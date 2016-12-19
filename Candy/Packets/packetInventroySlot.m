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

int packetInventorySpace = 49;
NSString *selectedPacket;

+(void)addSlots: (UIScrollView*)v {
    for(int i = 1; i < packetInventorySpace; i++){
        [self packetSlot:v slotID:i];
    }
    
}

+(void)packetSlot: (UIScrollView*)v slotID:(int)slotID {
    
    NSString *packetName;
    
    if([[packetInventoryData getPacketInventroyAsArray] count] >= slotID){
        
        packetName = [packetInventoryData getPacketAtSlot:slotID];
        
    }else {
        packetName = @"packetBlank";
    }
    
    UIView *slot = [[UIView alloc] initWithFrame:CGRectMake([self calculateX:slotID viewWidth:v.frame.size.width],
                                                            [self calculateY:slotID viewWidth:v.frame.size.width/3],
                                                            v.frame.size.width/3,
                                                            v.frame.size.width/3)];
    
    SEL onPress = @selector(onSlotPress:);
    UIImage *packetImage = [UIImage imageNamed:packetName];
    UIButton *slotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *slotBack = [UIImage imageNamed:@"packetInventorySlot"];
    UIImageView *slotView = [[UIImageView alloc]initWithImage:slotBack];
    
    slotView.frame = CGRectMake(slot.frame.origin.x, slot.frame.origin.y, slot.frame.size.width, slot.frame.size.width);
    
    if([[packetInventoryData getPacketInventroyAsArray] count] >= slotID){
    [slotButton addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
        }
    
    [slotButton setImage:packetImage forState:UIControlStateNormal];
    
    float slotWidth = slot.frame.size.width/1.4;
    float slotHeight = slot.frame.size.height/1.6;
    
    slotButton.frame = CGRectMake(slot.frame.size.width/2 - slotWidth/2, slot.frame.size.height/2 - slotHeight/2, slotWidth, slotHeight);
    slotButton.tag = slotID + 1500;
    
    [slot addSubview:slotView];
    [slotView addSubview:slotButton];

    [v addSubview:slot];
}

+(void)onSlotPress: (id)sender {
    UIButton *packet = (UIButton*)sender;
    UIView *v = (UIView*)[sender superview];
    UIScrollView *sv = (UIScrollView*)[v superview];
    int packetID = (int)packet.tag - 1500;

    if([packetInventoryData getPacketAtSlot:packetID] != nil){
        [sv removeFromSuperview];
         selectedPacket = [packetInventoryData getPacketAtSlot:packetID];
         [packetInventoryData removeFullSlot:packetID];
    }
}
+(NSString*)getSelectedPacket {
    return selectedPacket;
}

+(float)calculateX: (int)idNum viewWidth:(float)xWidth {
    float itemSize = xWidth/3;
    
    for(int i = 1; i < 100; i = i + 3){
        if (idNum == i) {
            return 0;
        }
    }
    for(int i = 2; i < 100; i = i + 3){
        if (idNum == i) {
            return xWidth/2 - itemSize;
        }
    }
    for(int i = 3; i < 100; i = i + 3){
        if (idNum == i) {
            return xWidth/2 - itemSize/2;
        }
    }
    return 0;
}
//I mean I can write a seperate function which does this calculation but I cant think of the formula right nowwww so this is gonna have to do #CopyAndPasta
+(float)calculateY: (int)idNum viewWidth:(float)yWidth {
    
    yWidth = yWidth/2;
    
    for(int i = 1; i <= 3; i++){
        if (idNum == i) {
            return 0;
        }
    }
    for(int i = 4; i <= 6; i++){
        if (idNum == i) {
            return  yWidth;
        }
    }
    for(int i = 7; i <= 9; i++){
        if (idNum == i) {
            return  (yWidth*2);
        }
    }
    for(int i = 10; i <= 12; i++){
        if (idNum == i) {
            return (yWidth*3);
        }
    }for(int i = 13; i <= 15; i++){
        if (idNum == i) {
            return  (yWidth*4);
        }
    }
    for(int i = 16; i <= 18; i++){
        if (idNum == i) {
            return  (yWidth*5);
        }
    }
    for(int i = 19; i <= 21; i++){
        if (idNum == i) {
            return (yWidth*6);
        }
    }
    for(int i = 22; i <= 24; i++){
        if (idNum == i) {
            return  (yWidth*7);
        }
    }
    for(int i = 25; i <= 27; i++){
        if (idNum == i) {
            return  (yWidth*8);
        }
    }
    for(int i = 28; i <= 30; i++){
        if (idNum == i) {
            return (yWidth*9);
        }
    }for(int i = 31; i <= 33; i++){
        if (idNum == i) {
            return  (yWidth*10);
        }
    }
    for(int i = 34; i <= 36; i++){
        if (idNum == i) {
            return  (yWidth*11);
        }
    }
    for(int i = 37; i <= 39; i++){
        if (idNum == i) {
            return (yWidth*12);
        }
    }for(int i = 40; i <= 42; i++){
        if (idNum == i) {
            return  (yWidth*13);
        }
    }
    for(int i = 43; i <= 45; i++){
        if (idNum == i) {
            return  (yWidth*14);
        }
    }
    for(int i = 46; i <= 48; i++){
        if (idNum == i) {
            return (yWidth*15);
        }
    }for(int i = 49; i <= 51; i++){
        if (idNum == i) {
            return  (yWidth*16);
        }
    }
    return 0;
}
@end
