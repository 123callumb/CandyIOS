//
//  packet.m
//  Candy
//
//  Created by Callum Beckwith on 10/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packet.h"
#import "packetInventoryData.h"
#import "confirmPurchase.h"

@implementation packet
+(void)addPackets: (UIView*)v {
    [self createSweetPacket:v idNum:1 packetTexture:@"lollyPacket"];
    [self createSweetPacket:v idNum:2 packetTexture:@"bonbonPacket"];
    [self createSweetPacket:v idNum:3 packetTexture:@"sweetPacket"];
    [self createSweetPacket:v idNum:4 packetTexture:@"chewPacket"];
    [self createSweetPacket:v idNum:5 packetTexture:@"jawbreakerPacket"];
}
+(void)createSweetPacket: (UIView*)v idNum:(int)packetNo packetTexture:(NSString*)texture {
    
    UIView *packetWindow = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                    (v.frame.size.width/4.2) * (packetNo-1),
                                                                    v.frame.size.width,
                                                                    v.frame.size.width/4.2)];

    
    UIImage *packetTexture = [UIImage imageNamed:texture];
    UIImageView *bar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"packetBuyBar"]];
    UIImageView *packetView = [[UIImageView alloc] initWithImage:packetTexture];
    UIButton *openButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    SEL onPress = @selector(onPress:);
    
    bar.frame = CGRectMake(0, 0, packetWindow.frame.size.width, packetWindow.frame.size.height);
    
    openButton.frame = CGRectMake(packetWindow.frame.size.width/3.5, packetWindow.frame.size.height/7, packetView.frame.size.width/3.8, packetWindow.frame.size.height/1.4);
   
    packetView.frame = CGRectMake(packetWindow.frame.size.width/20, packetWindow.frame.size.height/5, packetWindow.frame.size.width/6, packetWindow.frame.size.height/1.7);
    
    [openButton addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    [openButton setImage:[UIImage imageNamed:@"packetBuyButton"] forState:UIControlStateNormal];
    [openButton setImage:[UIImage imageNamed:@"packetButButtonPressed"] forState:UIControlStateHighlighted];
    openButton.tag = 1100 + packetNo;
    
    
    

    [bar addSubview:packetView];
    [packetWindow addSubview:bar];
    [packetWindow addSubview:openButton];
    
    [v addSubview:packetWindow];
}
+(void)onPress: (id)sender {
    UIButton *packet = (UIButton*)sender;
    UIView *v2 = [packet superview];
    UIScrollView *v1 = (UIScrollView*)[v2 superview];
    UIView *v = [v1 superview];
    
    int packetPressed = (int)(packet.tag - 1100);
    
    if (packet.isSelected == false) {
        [confirmPurchase confirmPacketPurchase:v tagNumber:packetPressed];
    }

}
@end
