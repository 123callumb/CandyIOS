//
//  packet.m
//  Candy
//
//  Created by Callum Beckwith on 10/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packet.h"
#import "packetInventoryData.h"

@implementation packet
+(void)addPackets: (UIView*)v {
    [self createSweetPacket:v idNum:1 packetTexture:@"lollyPacket"];
    [self createSweetPacket:v idNum:2 packetTexture:@"bonbonPacket"];
    [self createSweetPacket:v idNum:3 packetTexture:@"sweetPacket"];
    [self createSweetPacket:v idNum:4 packetTexture:@"chewPacket"];
    [self createSweetPacket:v idNum:5 packetTexture:@"jawbreakerPacket"];
}
+(void)createSweetPacket: (UIView*)v idNum:(int)packetNo packetTexture:(NSString*)texture {
    
    UIView *packetWindow = [[UIView alloc] initWithFrame:CGRectMake([self calculateX:packetNo viewWidth:v.frame.size.width],
                                                                    [self calculateY:packetNo viewWidth:v.frame.size.height],
                                                                    v.frame.size.width/3.5,
                                                                    v.frame.size.width/3)];

    
    UIImage *packetTexture = [UIImage imageNamed:texture];
    UIImageView *packetView = [[UIImageView alloc] initWithImage:packetTexture];
    UIButton *openButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    SEL onPress = @selector(onPress:);
    
    openButton.frame = CGRectMake(0, packetView.frame.size.height/4.5, v.frame.size.width/3.5, v.frame.size.height/7.7);
    openButton.tag = 1100 + packetNo;
    
    [openButton addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    [openButton setImage:[UIImage imageNamed:@"openButton"] forState:UIControlStateNormal];
    [openButton setImage:[UIImage imageNamed:@"openPressured"] forState:UIControlStateHighlighted];
    
    packetView.frame = CGRectMake(0, 0, packetWindow.frame.size.width, packetWindow.frame.size.width/1.2);
    
    [packetWindow addSubview:openButton];
    [packetWindow addSubview:packetView];
    
    [v addSubview:packetWindow];
}
+(void)onPress: (id)sender {
    UIButton *packet = (UIButton*)sender;
    int packetPressed = (int)(packet.tag - 1100);
    
    if (packetPressed == 1) {
        [packetInventoryData addPacketWithStringToInventory:@"lollyPacket"];
    }
    if (packetPressed == 2) {
        [packetInventoryData addPacketWithStringToInventory:@"bonbonPacket"];
    }
    if (packetPressed == 3) {
        [packetInventoryData addPacketWithStringToInventory:@"sweetPacket"];
    }
    if (packetPressed == 4) {
        [packetInventoryData addPacketWithStringToInventory:@"chewPacket"];
    }
    if (packetPressed == 5) {
        [packetInventoryData addPacketWithStringToInventory:@"jawbreakerPacket"];
    }
    

    
}
+(float)calculateX: (int)idNum viewWidth:(float)xWidth {
    for(int i = 1; i < 100; i = i + 3){
        if (idNum == i) {
            return xWidth/26;
        }
    }
    for(int i = 2; i < 100; i = i + 3){
        if (idNum == i) {
            return xWidth/2.8;
        }
    }
    for(int i = 3; i < 100; i = i + 3){
        if (idNum == i) {
            return xWidth-(xWidth/3.1);
        }
    }
    return 0;
}
+(float)calculateY: (int)idNum viewWidth:(float)yWidth {
    for(int i = 1; i <= 3; i++){
        if (idNum == i) {
            return yWidth/18;
        }
    }
    for(int i = 4; i <= 6; i++){
        if (idNum == i) {
            return yWidth/2.1;
        }
    }
    for(int i = 7; i <= 9; i++){
        if (idNum == i) {
            return yWidth/4;
        }
    }
    for(int i = 10; i <= 12; i++){
        if (idNum == i) {
            return yWidth/2;
        }
    }
    return 0;
}
@end
