//
//  backButtonSweetShop.m
//  Candy
//
//  Created by Callum Beckwith on 10/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "backButtonSweetShop.h"
#import "sweetShopUI.h"

@implementation backButtonSweetShop
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
    
    [sweetShopUI hideSweetShopUI:v];
}

@end
