//
//  messageUI.m
//  Candy
//
//  Created by Callum Beckwith on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "messageUI.h"

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
        UIView *messageBox = [[UIView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        UIImage *backgroundImage = [UIImage imageNamed:@"informationBox"];
        UIButton *backdrop = [UIButton buttonWithType:UIButtonTypeCustom];
        [backdrop setImage:backgroundImage forState:UIControlStateNormal];
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
    
        if(displayOnce){
            [nd setInteger:1 forKey:[NSString stringWithFormat:@"messageBox_with_id_%d", boxID]];
        }
        
    }
}
+(void)removeMessageOnPress: (id)sender {
    UIButton *button = (UIButton*)sender;
    UIView *messageBox = [button superview];
    [messageBox removeFromSuperview];
}
@end
