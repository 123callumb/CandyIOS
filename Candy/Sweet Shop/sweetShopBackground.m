//
//  sweetShopBackground.m
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetShopBackground.h"
#import "uiGemLabel.h"

@implementation sweetShopBackground

+(void)addBacking: (UIView*)v {
    [self addHeader:v];
    [self addFooter:v];
    [self addPacketKeys:v];
}
+(void)addHeader: (UIView*)v {
    UIImage *headerImage = [UIImage imageNamed:@"sweetShopHeader"];
    UIImageView *header = [[UIImageView alloc] initWithImage:headerImage];
    header.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height/6);
    header.tag = 1001;
    [v addSubview:header];
}
+(void)addFooter: (UIView*)v {
    UIImage *footerImage = [UIImage imageNamed:@"footerUI"];
    UIImageView *footer = [[UIImageView alloc] initWithImage:footerImage];
    footer.frame = CGRectMake(0, v.frame.size.height-v.frame.size.height/6, v.frame.size.width, v.frame.size.height/6);
    footer.tag = 1002;
    [v addSubview:footer];
}
+(void)addPacketKeys: (UIView*)v {
    UIImage *packetKey = [UIImage imageNamed:@"gemsBar"];
    UIImageView *packetKeys = [[UIImageView alloc] initWithImage:packetKey];
    packetKeys.frame = CGRectMake(0, v.frame.size.height/6, v.frame.size.width, v.frame.size.height/7);
    packetKeys.tag = 1003;
    [uiGemLabel addGemLabel:packetKeys rectSize:CGRectMake(packetKeys.frame.size.width-packetKeys.frame.size.height*1.15,
                                                           packetKeys.frame.size.height-packetKeys.frame.size.height*1.05,
                                                           packetKeys.frame.size.height, packetKeys.frame.size.height)
                                                           fontSize:40.0f];
    [v addSubview:packetKeys];
}
@end
