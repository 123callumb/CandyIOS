//
//  menuUi.m
//  Candy
//
//  Created by Callum Beckwith on 02/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "menuUi.h"
#import "menuUIButtons.h"

@implementation menuUi

+(void)createMenu: (UIView*)v {
    
    if([v viewWithTag:1337] == nil){
        UIView *menuBase = [[UIView alloc] initWithFrame:CGRectMake(-v.frame.size.width, 0, v.frame.size.width/1.5, v.frame.size.height)];
        
        UIImage *backDropI = [UIImage imageNamed:@"menuBackingSmall"];
        UIImageView *backDrop = [[UIImageView alloc] initWithImage:backDropI];
        
        backDrop.frame = CGRectMake(0, 0, menuBase.frame.size.width, menuBase.frame.size.height);
        
        [menuBase addSubview:backDrop];
        
        [self addButtonScrollUI:menuBase];
        [self addFooterButtons:menuBase];
        menuBase.tag = 1337;
        [v addSubview:menuBase];
        
        [UIView animateWithDuration:0.3 animations:^{
            menuBase.frame = CGRectMake(0, 0, menuBase.frame.size.width, menuBase.frame.size.height);
        }];
    }
}
+(void)addButtonScrollUI: (UIView*)v {
    UIScrollView *buttonList = [[UIScrollView alloc] initWithFrame:CGRectMake(0, v.frame.size.height/5.72, v.frame.size.width, v.frame.size.height/1.4)];
    [menuUIButtons addButtons:buttonList];
    buttonList.contentSize = CGSizeMake(buttonList.frame.size.width, (buttonList.frame.size.height/3.5 * ([[menuUIButtons menuButtons] count])) + buttonList.frame.size.height/30);
    [v addSubview:buttonList];
}
+(void)addFooterButtons:(UIView*)v {
    UIImage *backButtonImage = [UIImage imageNamed:@"crossButton"];
    UIImage *rateButtonImage = [UIImage imageNamed:@"rateButton"];
    UIImage *settingsButtonImage = [UIImage imageNamed:@"settingsButton"];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *rateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton setImage:backButtonImage forState:UIControlStateNormal];
    [rateButton setImage:rateButtonImage forState:UIControlStateNormal];
    [settingsButton setImage:settingsButtonImage forState:UIControlStateNormal];
    
    float crossH = v.frame.size.height/10;
    float crossW = v.frame.size.height/10;
    float mediumH = v.frame.size.height/12;
    float mediumW = v.frame.size.width/2.8;
    float setH = v.frame.size.height/12;
    float setW = v.frame.size.height/12;
    
    [backButton setFrame:CGRectMake(v.frame.size.width - crossW - setH/5, v.frame.size.height - crossH*1, crossW, crossH)];
    [rateButton setFrame:CGRectMake(v.frame.size.width/2 - mediumW/1.8, v.frame.size.height - mediumH*1.1, mediumW, mediumH)];
    [settingsButton setFrame:CGRectMake(0 + setH/8, v.frame.size.height - setH*1.1, setW, setH)];
    
    [backButton addTarget:self action:@selector(onBackPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [v addSubview:backButton];
    [v addSubview:rateButton];
    [v addSubview:settingsButton];
}
+(void)onBackPress: (id)sender {
    UIButton *back = (UIButton*)sender;
    UIView *v1 = [back superview];
    [self removeMenu:v1];
}
+(void)removeMenu: (UIView*)v {
    
    UIView *menu = [v viewWithTag:1337];
    
    if(menu != nil){
        
        [UIView animateWithDuration:0.3 animations:^{
            menu.frame = CGRectMake(-v.frame.size.width, 0, v.frame.size.width/1.5, v.frame.size.height);
        } completion:^(BOOL finished){
            [menu removeFromSuperview];
        }];
    }
    
}


@end
