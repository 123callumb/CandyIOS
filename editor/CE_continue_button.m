//
//  CE_continue_button.m
//  Candy
//
//  Created by Killian Comerford on 22/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "CE_continue_button.h"
#import "mainTransition.h"
#import "Character_Maker.h"

@implementation CE_continue_button

    BOOL switchBack_;

+(void)initializeTextures:(UIView*)v scene:(SKScene*)scene{
    //add continue button
    SEL aSel_continue = @selector(continue_button_action:);
    UIButton *continue_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [continue_button addTarget:self action:aSel_continue forControlEvents:UIControlEventTouchUpInside];
    continue_button.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height - 16*((v.frame.size.width/2)/45),v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    [continue_button setImage:[UIImage imageNamed:@"button_continue"]forState:UIControlStateNormal];
    [v addSubview:continue_button];
    
    continue_button.tag = 11114;
    switchBack_ = false;
}
+(void)continue_button_action:(id)sender{
    switchBack_ = YES;
    UIView *v = [sender superview];
    [v removeFromSuperview];
}
+(void)testForChange:(SKScene*)s{
    if(switchBack_){
        [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition crossFadeWithDuration:0]];
        NSLog(@"AAAAA");
    }
    NSLog(@"no");
}
@end
