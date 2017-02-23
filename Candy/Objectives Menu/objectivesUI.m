//
//  objectivesUI.m
//  Candy
//
//  Created by Callum Beckwith on 14/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "objectivesUI.h"
#import "objectivesUITask.h"

@implementation objectivesUI

+(void)createObjectivesUI: (UIView*)v {
    UIView *mainObj = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    UIImage *bgImage = [UIImage imageNamed:@"objBG"];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    UIImage *titleImage = [UIImage imageNamed:@"objTitle"];
    UIImageView *titleView = [[UIImageView alloc] initWithImage:titleImage];
    UIImage *crossImage = [UIImage imageNamed:@"crossButton"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton setImage:crossImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0, 0, mainObj.frame.size.width/8, mainObj.frame.size.width/8)];
    [backButton addTarget:self action:@selector(onBackPress:) forControlEvents:UIControlEventTouchUpInside];
    [bgView setFrame:CGRectMake(0, 0, mainObj.frame.size.width, mainObj.frame.size.height)];
    [titleView setFrame:CGRectMake(mainObj.frame.size.width/2 - (mainObj.frame.size.width/1.2)/2 , mainObj.frame.size.height/14, mainObj.frame.size.width/1.2, mainObj.frame.size.height/12)];
    
    [mainObj addSubview:bgView];
    [mainObj addSubview:titleView];
    [mainObj addSubview:backButton];
    [objectivesUITask createTasks:mainObj];

    [mainObj setAlpha:0.0];
    
    
    [v addSubview:mainObj];
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainObj setAlpha:1];
        [mainObj setFrame:v.frame];
    }];
}
+(void)onBackPress: (id)sender {
    UIButton *back = (UIButton*)sender;
    UIView *v = [back superview];
    
    [UIView animateWithDuration:0.3 animations:^{
        [v setAlpha:0];
        [v setFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
    }];
}
@end
