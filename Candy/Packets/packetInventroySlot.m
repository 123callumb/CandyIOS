//
//  packetInventroySlot.m
//  Candy
//
//  Created by Callum Beckwith on 12/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetInventroySlot.h"
#import "packetInventoryData.h"

@implementation packetInventroySlot

int packetInventorySpace = 50;

+(void)addSlots: (UIScrollView*)v {
    for(int i = 1; i < packetInventorySpace; i++){
        [self packetSlot:v slotID:i];
    }
    
}

+(void)packetSlot: (UIScrollView*)v slotID:(int)slotID {
    
    NSString *packetName;
    
    if([packetInventoryData getSlotFull:slotID] == 1){
        packetName = [[NSUserDefaults standardUserDefaults] valueForKey:[NSString stringWithFormat:@"packet_slot_%d", slotID]];
    }else {
        packetName = @"packetBlank";
    }
    
    UIView *slot = [[UIView alloc] initWithFrame:CGRectMake([self calculateX:slotID viewWidth:v.frame.size.width],
                                                            [self calculateY:slotID viewWidth:v.frame.size.width/3.6],
                                                            v.frame.size.width/3.2,
                                                            v.frame.size.width/3.6)];
    SEL onPress = @selector(onSlotPress:);
    UIImage *packetImage = [UIImage imageNamed:packetName];
    UIButton *slotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [slotButton addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    [slotButton setImage:packetImage forState:UIControlStateNormal];
    slotButton.frame = CGRectMake(0, 0, slot.frame.size.width, slot.frame.size.width/1.2);
    
    [slot addSubview:slotButton];
    [v addSubview:slot];
}

+(void)onSlotPress: (id)sender {
    UIView *v = (UIView*)[sender superview];
    UIScrollView *sv = (UIScrollView*)[v superview];
    [sv removeFromSuperview];
}

+(float)calculateX: (int)idNum viewWidth:(float)xWidth {
    for(int i = 1; i < 100; i = i + 3){
        if (idNum == i) {
            return xWidth/50;
        }
    }
    for(int i = 2; i < 100; i = i + 3){
        if (idNum == i) {
            return xWidth/2.9;
        }
    }
    for(int i = 3; i < 100; i = i + 3){
        if (idNum == i) {
            return xWidth-(xWidth/3.1);
        }
    }
    return 0;
}
//I mean I can write a seperate function which does this calculation but I cant think of the formula right nowwww so this is gonna have to do #CopyAndPasta
+(float)calculateY: (int)idNum viewWidth:(float)yWidth {
    for(int i = 1; i <= 3; i++){
        if (idNum == i) {
            return yWidth/10;
        }
    }
    for(int i = 4; i <= 6; i++){
        if (idNum == i) {
            return  yWidth + yWidth/10;
        }
    }
    for(int i = 7; i <= 9; i++){
        if (idNum == i) {
            return  (yWidth*2) + yWidth/10;
        }
    }
    for(int i = 10; i <= 12; i++){
        if (idNum == i) {
            return (yWidth*3) + yWidth/10;
        }
    }for(int i = 13; i <= 15; i++){
        if (idNum == i) {
            return  (yWidth*4) + yWidth/10;
        }
    }
    for(int i = 16; i <= 18; i++){
        if (idNum == i) {
            return  (yWidth*5) + yWidth/10;
        }
    }
    for(int i = 19; i <= 21; i++){
        if (idNum == i) {
            return (yWidth*6) + yWidth/10;
        }
    }
    for(int i = 22; i <= 24; i++){
        if (idNum == i) {
            return  (yWidth*7) + yWidth/10;
        }
    }
    for(int i = 25; i <= 27; i++){
        if (idNum == i) {
            return  (yWidth*8) + yWidth/10;
        }
    }
    for(int i = 28; i <= 30; i++){
        if (idNum == i) {
            return (yWidth*9) + yWidth/10;
        }
    }for(int i = 31; i <= 33; i++){
        if (idNum == i) {
            return  (yWidth*10) + yWidth/10;
        }
    }
    for(int i = 34; i <= 36; i++){
        if (idNum == i) {
            return  (yWidth*11) + yWidth/10;
        }
    }
    for(int i = 37; i <= 39; i++){
        if (idNum == i) {
            return (yWidth*12) + yWidth/10;
        }
    }for(int i = 40; i <= 42; i++){
        if (idNum == i) {
            return  (yWidth*13) + yWidth/10;
        }
    }
    for(int i = 43; i <= 45; i++){
        if (idNum == i) {
            return  (yWidth*14) + yWidth/10;
        }
    }
    for(int i = 46; i <= 48; i++){
        if (idNum == i) {
            return (yWidth*15) + yWidth/10;
        }
    }for(int i = 49; i <= 51; i++){
        if (idNum == i) {
            return  (yWidth*16) + yWidth/10;
        }
    }
    return 0;
}
@end
