//
//  sweetDrawSlots.m
//  Candy
//
//  Created by Callum Beckwith on 28/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetDrawSlots.h"
#import "sweetDrawData.h"
#import "sweetDrawUI.h"

@implementation sweetDrawSlots
+(void)addSlots: (UIScrollView*)v layoutStyle:(int)layoutType {
    for(int i = 0; i <= [sweetDrawData getDrawsUnlocked]; i++){
        [self createSlot:v drawNo:i layoutStyle:layoutType];
    }
}
+(void)createSlot: (UIScrollView*)v drawNo:(int)drawNumber layoutStyle:(int)layoutType{
    float slotSquared = v.frame.size.width/2.2;
    float padding = v.frame.size.width/40;
    
    NSString *sweetTextureName = [sweetDrawData getTextureAtSlot:drawNumber];
    
    UIView *mainSlot = [[UIView alloc] initWithFrame:[self layoutStyle:slotSquared Padding:padding drawNo:drawNumber layoutID:layoutType]];
    
    UIImage *drawBg = [UIImage imageNamed:@"sweetDrawSlot"];
    UIImage *sweetTexture = [UIImage imageNamed:sweetTextureName];
    
    UIImageView *draw = [[UIImageView alloc] initWithImage:drawBg];
    UIButton *sweetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [sweetButton setImage:sweetTexture forState:UIControlStateNormal];
    [sweetButton setFrame:CGRectMake(0, 0, mainSlot.frame.size.width, mainSlot.frame.size.height)];
    
    SEL onPress = @selector(onDrawPress:);
    
    [sweetButton addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    
    draw.frame = CGRectMake(0, 0, mainSlot.frame.size.width, mainSlot.frame.size.height);
    
    [mainSlot addSubview:draw];
    [mainSlot addSubview:sweetButton];
    
    [v addSubview:mainSlot];
}

+(CGRect)layoutStyle: (float)slotSquared Padding:(float)padding drawNo:(int)drawID layoutID:(int)layoutStyle {
    float xPos = 0;
    float yPos = 0;
    
    if(layoutStyle == 0){
        xPos = (slotSquared * drawID) + padding;
    }else if (layoutStyle == 1){
        
    }
    return CGRectMake(xPos, yPos, slotSquared, slotSquared);
}


+(void)onDrawPress: (id)sender {
    UIButton *drawSlot = (UIButton*)sender;
    UIView *slot = [drawSlot superview];
    UIScrollView *sv = (UIScrollView*)[slot superview];
    UIView *v = [sv superview];

    [sweetDrawUI createMenu:v];
}
@end
