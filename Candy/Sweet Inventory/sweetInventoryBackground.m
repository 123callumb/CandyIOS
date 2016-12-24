//
//  sweetInventoryBackground.m
//  Candy
//
//  Created by Callum Beckwith on 20/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInventoryBackground.h"
#import "sweetInventoryUI.h"

@implementation sweetInventoryBackground

+(void)addItems: (UIView*)v {
    [self addHeader:v];
    [self addBackBar:v];
    [self addBackButton:v];
}
+(void)addHeader: (UIView*)v {
    UIImage *headerImage = [UIImage imageNamed:@"sweetInventoryHeader"];
    UIImageView *header = [[UIImageView alloc] initWithImage:headerImage];
    header.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height/4.5);
    header.tag = 4001;
    [v addSubview:header];
}
+(void)addBackBar: (UIView*)v {
    UIImage *footerImage = [UIImage imageNamed:@"footerUI"];
    UIImageView *footer = [[UIImageView alloc] initWithImage:footerImage];
    footer.frame = CGRectMake(0, v.frame.size.height-v.frame.size.height/6, v.frame.size.width, v.frame.size.height/6);
    footer.tag = 4002;
    [v addSubview:footer];
}
+(void)addBackButton: (UIView*)v {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    SEL onPress = @selector(onBackPress:);
    backButton.frame = CGRectMake((v.frame.size.width/2 - v.frame.size.width/4), v.frame.size.height/1.157, v.frame.size.width/2, v.frame.size.height/10);
    [backButton addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"backButtonPressure"] forState:UIControlStateHighlighted];
    
    [v addSubview:backButton];
}
+(void)onBackPress: (id)sender {
    UIButton *v1 = (UIButton*)sender;
    UIView *v = [v1 superview];
    [sweetInventoryUI hideSweetInventoryUI:v];
}

@end
