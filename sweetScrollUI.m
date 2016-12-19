//
//  sweetScrollUI.m
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetScrollUI.h"
#import "packet.h"

@implementation sweetScrollUI

+(void)addScrollUI:(UIView*)v {
    UIImageView *header = (UIImageView*)[v viewWithTag:1001];
    UIImageView *key = (UIImageView*)[v viewWithTag:1003];
    
    UIScrollView *mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, (header.frame.size.height + key.frame.size.height), v.frame.size.width, (v.frame.size.height - (key.frame.size.height + header.frame.size.height*2)))];
    
    mainScroll.backgroundColor = [UIColor colorWithRed:120.0f/255.0f green:185.0f/255.0f blue:219.0/255.0f alpha:1];
    
    [mainScroll setContentSize:CGSizeMake(v.frame.size.width, mainScroll.frame.size.height*1.25)];
    
    [packet addPackets:mainScroll];
    
    [v addSubview:mainScroll];
}
@end
