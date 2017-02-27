//
//  messageUI.m
//  Candy
//
//  Created by Callum Beckwith on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "messageUI.h"
#import "gems.h"
#import "money.h"
#import "sweetInventoryData.h"
#import "sweetInventoryUI.h"
#import "objectivesSilver.h"
#import "itemUI.h"
#import "objectivesUI.h"
#import "objectivesData.h"

@implementation messageUI
+(void)createMultipleMessageBoxes: (NSArray*)infoStrings corrispondingTextures:(NSArray*)textures textureScales:(NSArray*)scales uiview:(UIView*)v endMessageIDAt:(int)messageID displayOnce:(bool)displayOnce {
    for(int i = (int)([infoStrings count] - 1); i >= 0; i = i - 1){
        NSString *infoString = [infoStrings objectAtIndex:i];
        NSString *stringTexture = [textures objectAtIndex:i];
        float scale = [[scales objectAtIndex:i] floatValue];
        [self createMessageBox:v
              information:infoString
              representingImage:stringTexture
              imageScale:scale
              messageBoxID:messageID + i
              displayOnce:displayOnce
         ];
    }
}
+(void)createMessageBox: (UIView*)v information:(NSString*)contentText representingImage:(NSString*)imageTexture imageScale:(float)scale messageBoxID:(int)boxID displayOnce:(bool)displayOnce {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    if([nd integerForKey:[NSString stringWithFormat:@"messageBox_with_id_%d", boxID]] == 0){
        UIView *messageBox = [[UIView alloc] initWithFrame:CGRectMake(0,  v.frame.size.height, v.frame.size.width, v.frame.size.height)];
        UIImage *backgroundImage = [UIImage imageNamed:@"informationBox"];
        UIImage *backgoundTick = [UIImage imageNamed:@"informationBoxTick"];
        UIButton *backdrop = [UIButton buttonWithType:UIButtonTypeCustom];
        [backdrop setImage:backgroundImage forState:UIControlStateNormal];
        [backdrop setImage:backgoundTick forState:UIControlStateHighlighted];
        [backdrop addTarget:self action:@selector(removeMessageOnPress:) forControlEvents:UIControlEventTouchUpInside];
    
        UILabel *information = [[UILabel alloc] initWithFrame:CGRectMake(messageBox.frame.size.width/2 - v.frame.size.width/3 , messageBox.frame.size.height/2.5, v.frame.size.width/1.5, v.frame.size.height/2)];
    
        [information setFont:[UIFont fontWithName:@"Coder's-Crux" size:28.0f]];
        [information setText:contentText];
        [information setLineBreakMode:NSLineBreakByClipping];
        [information setTextAlignment:NSTextAlignmentCenter];
        [information setLineBreakMode:0];
        [information setNumberOfLines:0];
        [information setClipsToBounds:YES];
    
        UIImage *representingImage = [UIImage imageNamed:imageTexture];
        
        float imageW = representingImage.size.width * scale;
        float imageH = representingImage.size.height * scale;
    
        UIImageView *representingView = [[UIImageView alloc] initWithFrame:CGRectMake(messageBox.frame.size.width/2 - imageW/2, v.frame.size.   height/2.5 - imageH, imageW, imageH)];
        [representingView setImage:representingImage];
    
        backdrop.frame = CGRectMake(0, 0, messageBox.frame.size.width, messageBox.frame.size.height);
    
    
        [messageBox addSubview:backdrop];
        [messageBox addSubview:representingView];
        [messageBox addSubview:information];
    
        [v addSubview:messageBox];
        
        [UIView animateWithDuration:0.3 animations:^{
            [messageBox setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        }];
    
        if(displayOnce){
            [nd setInteger:1 forKey:[NSString stringWithFormat:@"messageBox_with_id_%d", boxID]];
        }
        
    }
}
+(void)removeMessageOnPress: (id)sender {
    UIButton *button = (UIButton*)sender;
    UIView *messageBox = [button superview];
    UIView *v = [messageBox superview];
    
    [UIView animateWithDuration:0.3 animations:^{
        [messageBox setFrame:CGRectMake(0,  -v.frame.size.height, messageBox.frame.size.width, -messageBox.frame.size.height)];
    } completion:^(BOOL finished){
        [messageBox removeFromSuperview];
    }];
}
+(void)createConfirmMessageBox: (UIView*)v information:(NSString*)contentText representingImage:(NSString*)imageTexture imageScale:(float)scale messageBoxID:(int)boxID displayOnce:(bool)displayOnce onConfirm:(int)confType confTag:(int)confTag {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    if([nd integerForKey:[NSString stringWithFormat:@"messageConfirmBox_with_id_%d", boxID]] == 0){
        UIView *messageBox = [[UIView alloc] initWithFrame:CGRectMake(0,  v.frame.size.height, v.frame.size.width, v.frame.size.height)];
        UIImage *backgroundImage = [UIImage imageNamed:@"informationBox"];
        UIImage *backgoundTick = [UIImage imageNamed:@"informationBoxTick"];
        UIImage *confirmButtonImage = [UIImage imageNamed:@"confirmButton"];
        UIImage *denyButtonImage = [UIImage imageNamed:@"cancelButton"];
        
        UIButton *backdrop = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *denyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [backdrop setImage:backgroundImage forState:UIControlStateNormal];
        [backdrop setImage:backgoundTick forState:UIControlStateHighlighted];
        
        float buttonW = messageBox.frame.size.width/2;
        float buttonH = messageBox.frame.size.height/10;
        
        [confirmButton setImage:confirmButtonImage forState:UIControlStateNormal];
        
        if(confType == 0){
            [confirmButton addTarget:self action:@selector(onCoinSell:) forControlEvents:UIControlEventTouchUpInside];
        }
        if (confType == 1) {
            [confirmButton addTarget:self action:@selector(onMiniGemSell:) forControlEvents:UIControlEventTouchUpInside];

        }
        if(confType == 2){
            [confirmButton addTarget:self action:@selector(onSkip:) forControlEvents:UIControlEventTouchUpInside];
        }
        [confirmButton setTag:confTag];
        [confirmButton setFrame:CGRectMake(messageBox.frame.size.width/2 - buttonW/2, messageBox.frame.size.height/1.7, buttonW, buttonH)];
        
        [denyButton setImage:denyButtonImage forState:UIControlStateNormal];
        [denyButton addTarget:self action:@selector(removeMessageOnPress:) forControlEvents:UIControlEventTouchUpInside];
        [denyButton setFrame:CGRectMake(messageBox.frame.size.width/2 - buttonW/2, messageBox.frame.size.height/1.4, buttonW, buttonH)];

        UILabel *information = [[UILabel alloc] initWithFrame:CGRectMake(messageBox.frame.size.width/2 - v.frame.size.width/3 , messageBox.frame.size.height/6, v.frame.size.width/1.5, v.frame.size.height/2)];
        
        [information setFont:[UIFont fontWithName:@"Coder's-Crux" size:28.0f]];
        [information setText:contentText];
        [information setLineBreakMode:NSLineBreakByClipping];
        [information setTextAlignment:NSTextAlignmentCenter];
        [information setLineBreakMode:0];
        [information setNumberOfLines:0];
        [information setClipsToBounds:YES];
        
        UIImage *representingImage = [UIImage imageNamed:imageTexture];
        
        float imageW = representingImage.size.width * scale;
        float imageH = representingImage.size.height * scale;
        
        UIImageView *representingView = [[UIImageView alloc] initWithFrame:CGRectMake(messageBox.frame.size.width/2 - imageW/2, v.frame.size.   height/3 - imageH, imageW, imageH)];
        [representingView setImage:representingImage];
        
        backdrop.frame = CGRectMake(0, 0, messageBox.frame.size.width, messageBox.frame.size.height);
        
        
        [messageBox addSubview:backdrop];
        [messageBox addSubview:representingView];
        [messageBox addSubview:information];
        [messageBox addSubview:confirmButton];
        [messageBox addSubview:denyButton];
        
        [v addSubview:messageBox];
        
        [UIView animateWithDuration:0.3 animations:^{
            [messageBox setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        }];
        
        if(displayOnce){
            [nd setInteger:1 forKey:[NSString stringWithFormat:@"messageConfirmBox_with_id_%d", boxID]];
        }
        
    }
}
+(void)onCoinSell: (id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v1 = [v superview];
    UIView *v2 = [v1 superview];
    
    int slotNo = (int)(but.tag - 6500);
    
    NSMutableDictionary *slotData = [sweetInventoryData getSweetDataAtSlot:slotNo];
    NSString *color = [slotData objectForKey:@"sweet_color"];
    
    int amount = [itemUI getCoinSelllingPrice:color];
    
    [sweetInventoryData removeObject:slotNo];
    [money addBalance:amount];
    [sweetInventoryUI refreshView:v2];
    [objectivesSilver object4:v2];
    
    [v1 removeFromSuperview];
}
+(void)onMiniGemSell: (id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v1 = [v superview];
    UIView *v2 = [v1 superview];
    
    int slotNo = (int)(but.tag - 13500);
    
    NSMutableDictionary *slotData = [sweetInventoryData getSweetDataAtSlot:slotNo];
    NSString *color = [slotData objectForKey:@"sweet_color"];
    
    int amount = [itemUI getGemSelllingPrice:color];
    
    [sweetInventoryData removeObject:slotNo];
    [gems addMiniGems:amount];
    [sweetInventoryUI refreshView:v2];
    [objectivesSilver object5:v2];
    
    [v1 removeFromSuperview];
}
+(void)onSkip:(id)sender {
    UIButton *but = (UIButton*)sender;
    UIView *v = [but superview];
    UIView *v1 = [v superview];
    UIView *v2 = [v1 superview];
    
    int slotNo = (int)(but.tag - 1447);

    
    if([gems getGems] >= 2){
        [gems addGems:-2];
        [v1 removeFromSuperview];
        [objectivesUI createObjectivesUI:v2];
       
        if(slotNo == 0){
            [objectivesData setGoldProgress:[objectivesData getGoldProgress]+1];
        }
        if(slotNo == 1){
            [objectivesData setSilverProgress:[objectivesData getSilverProgress]+1];
        }
        if(slotNo == 2){
            [objectivesData setBronzeProgress:[objectivesData getBronzeProgress]+1];
        }
    }
}
@end
