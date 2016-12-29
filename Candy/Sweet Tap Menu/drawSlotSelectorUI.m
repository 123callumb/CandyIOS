//
//  drawSlotSelectorUI.m
//  Candy
//
//  Created by Callum Beckwith on 28/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "drawSlotSelectorUI.h"
#import "sweetDrawData.h"
#import "drawInventorySelector.h"

@implementation drawSlotSelectorUI

+(void)createDrawSelectionUI: (UIView*)v {
    float uiWidth = v.frame.size.width/1.5;
    float uiHeight = v.frame.size.height/1.74;
    
    UIScrollView *drawSlotsUi = [[UIScrollView alloc] initWithFrame:CGRectMake(v.frame.size.width/2 - uiWidth/2, v.frame.size.height/5.4, uiWidth, uiHeight)];
    drawSlotsUi.backgroundColor = [UIColor clearColor];
    drawSlotsUi.contentSize = CGSizeMake(drawSlotsUi.frame.size.width, drawSlotsUi.frame.size.height*2);
    
    for(int i = 0; i <= [sweetDrawData getDrawsUnlocked] + 5; i++){
        [self createSlot:drawSlotsUi slotNo:i];
    }
    
    [v addSubview:drawSlotsUi];
}
+(void)createSlot: (UIView*)v slotNo:(int)drawNumber {
    float slotSquared = v.frame.size.width/2.2;
    float padding = v.frame.size.width/40;
    
    NSString *sweetTextureName = [sweetDrawData getTextureAtSlot:drawNumber];
    
    UIView *mainSlot = [[UIView alloc] initWithFrame:[self layoutStyle:slotSquared Padding:padding drawNo:drawNumber]];
    
    UIImage *drawBg = [UIImage imageNamed:@"sweetDrawSlot"];
    UIImage *sweetTexture = [UIImage imageNamed:sweetTextureName];
    
    UIImageView *draw = [[UIImageView alloc] initWithImage:drawBg];
    UIButton *sweetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [sweetButton setImage:sweetTexture forState:UIControlStateNormal];
    [sweetButton setFrame:CGRectMake(0, -padding, mainSlot.frame.size.width, mainSlot.frame.size.height)];
    
    sweetButton.tag = 11000 + drawNumber;
    
    SEL onPress = @selector(onDrawPress:);
    
    [sweetButton addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    
    draw.frame = CGRectMake(0, 0, mainSlot.frame.size.width, mainSlot.frame.size.height);
    

    
    [mainSlot addSubview:draw];
    [mainSlot addSubview:sweetButton];
    
    [v addSubview:mainSlot];
}
+(CGRect)layoutStyle: (float)slotSquared Padding:(float)padding drawNo:(int)drawID {
    float xPos = 0;
    float yPos = 0;
    
    int rowNo = 0;
    
    for(int i = 1; i <= [sweetDrawData getDrawsUnlocked] + 5; i = i + 2){
        if (drawID == i) {
            xPos = (slotSquared*2.2) - slotSquared;
        }
    }
    for(int i = 0; i <= [sweetDrawData getDrawsUnlocked] + 5; i = i + 2){
        if(drawID == i || drawID == i + 1){
            yPos = ((slotSquared + padding) * rowNo) + padding;
        }else {
            rowNo++;
        }
    }
    return CGRectMake(xPos, yPos, slotSquared, slotSquared);
}
+(void)onDrawPress: (id)sender {
    UIButton *slot = (UIButton*)sender;
    UIView *v1 = [slot superview];
    UIScrollView *sv = (UIScrollView*)[v1 superview];
    UIView *v = [sv superview];
    
    [drawInventorySelector createInvSelectionUI:v];
}
@end
