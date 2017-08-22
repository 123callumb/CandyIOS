//
//  CE_menu_buttons.m
//  Candy
//
//  Created by Killian Comerford on 22/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "CE_menu_buttons.h"
#import "CE_hats_menu.h"
#import "CE_pants_menu.h"
#import "CE_shirts_menu.h"
#import "CE_shoes_menu.h"
#import "CE_skin_menu.h"

double btn_scale = 2.35;

@implementation CE_menu_buttons
+(void)initializeTextures:(UIView*)v{
    //add hats button
    SEL aSel_hats = @selector(hats_button_action:);
    UIButton *hats_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [hats_button addTarget:self action:aSel_hats forControlEvents:UIControlEventTouchUpInside];
    hats_button.frame = CGRectMake((v.frame.size.width/4)-(v.frame.size.width/(btn_scale*2)-5),(v.frame.size.height/2)-9.5*((v.frame.size.width/2.1)/32), v.frame.size.width/btn_scale, 20*((v.frame.size.width/btn_scale)/32));
    [hats_button setImage:[UIImage imageNamed:@"button_hats"]forState:UIControlStateNormal];
    hats_button.tag = 111111;
    
    //add shirts button
    SEL aSel_shirts = @selector(shirt_button_action:);
    UIButton *shirts_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [shirts_button addTarget:self action:aSel_shirts forControlEvents:UIControlEventTouchUpInside];
    shirts_button.frame = CGRectMake((3*(v.frame.size.width /4))-(v.frame.size.width/(btn_scale*2)+5),(v.frame.size.height/2)-9.5*((v.frame.size.width/2.1)/32), v.frame.size.width/btn_scale, 20*((v.frame.size.width/btn_scale)/32));
    [shirts_button setImage:[UIImage imageNamed:@"button_shirts"]forState:UIControlStateNormal];
    shirts_button.tag = 111112;
    
    //add pants button
    SEL aSel_pants = @selector(pants_button_action:);
    UIButton *pants_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [pants_button addTarget:self action:aSel_pants forControlEvents:UIControlEventTouchUpInside];
    pants_button.frame = CGRectMake((v.frame.size.width /4)-(v.frame.size.width/(btn_scale*2)-5),(v.frame.size.height/2)+9.5*((v.frame.size.width/2.1)/32), v.frame.size.width/btn_scale, 20*((v.frame.size.width/btn_scale)/32));
    [pants_button setImage:[UIImage imageNamed:@"button_pants"]forState:UIControlStateNormal];
    pants_button.tag = 111113;
    
    //add shoes button
    SEL aSel_shoes = @selector(shoes_button_action:);
    UIButton *shoes_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [shoes_button addTarget:self action:aSel_shoes forControlEvents:UIControlEventTouchUpInside];
    shoes_button.frame = CGRectMake((3*(v.frame.size.width /4))-(v.frame.size.width/(btn_scale*2)+5),(v.frame.size.height/2)+9.5*((v.frame.size.width/2.1)/32), v.frame.size.width/btn_scale, 20*((v.frame.size.width/btn_scale)/32));
    [shoes_button setImage:[UIImage imageNamed:@"button_shoes"]forState:UIControlStateNormal];
    shoes_button.tag = 111114;
    
    //add skin button
    SEL aSel_skin = @selector(skin_button_action:);
    UIButton *skin_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [skin_button addTarget:self action:aSel_skin forControlEvents:UIControlEventTouchUpInside];
    skin_button.frame = CGRectMake((v.frame.size.width /4)-(v.frame.size.width/(btn_scale*2)-5),(v.frame.size.height/2)+28.5*((v.frame.size.width/2.1)/32), (2*(v.frame.size.width/btn_scale))*1.05, 20*((v.frame.size.width/btn_scale)/32));
    [skin_button setImage:[UIImage imageNamed:@"button_skin"]forState:UIControlStateNormal];
    skin_button.tag = 111116;
    
    [v addSubview:hats_button];
    [v addSubview:shirts_button];
    [v addSubview:pants_button];
    [v addSubview:shoes_button];
    [v addSubview:skin_button];
}
+(void)hats_button_action:(id)sender{
    [CE_hats_menu moveIn:[sender superview]];
}
+(void)shirt_button_action:(id)sender{
    [CE_shirts_menu moveIn:[sender superview]];
}
+(void)pants_button_action:(id)sender{
    [CE_pants_menu moveIn:[sender superview]];
}
+(void)shoes_button_action:(id)sender{
    [CE_shoes_menu moveIn:[sender superview]];
}
+(void)skin_button_action:(id)sender{
    [CE_skin_menu moveIn:[sender superview]];
}
+(void)moveButtonsToSide:(UIView*)v{
    for(int i = 1; i<=6 ; i++){
        UIButton *b = [v viewWithTag:(111110+i)];
        CGRect rect = b.frame;
        [UIView animateWithDuration:0.3 animations:^{
            b.frame = CGRectMake(rect.origin.x + 500, rect.origin.y, rect.size.width, rect.size.height);
        }];
    }
}
+(void)moveButtonsBack:(UIView*)v{
    for(int i = 1; i<=6 ; i++){
        UIButton *b = [v viewWithTag:(111110+i)];
        CGRect rect = b.frame;
        [UIView animateWithDuration:0.3 animations:^{
            b.frame = CGRectMake(rect.origin.x-500, rect.origin.y, rect.size.width, rect.size.height);
        }];
}}
+(void)moveButtonsToSideLeft:(UIView*)v{
    for(int i = 1; i<=6 ; i++){
        UIButton *b = [v viewWithTag:(111110+i)];
        CGRect rect = b.frame;
        [UIView animateWithDuration:0.3 animations:^{
            b.frame = CGRectMake(rect.origin.x - 500, rect.origin.y, rect.size.width, rect.size.height);
        }];
    }
}
+(void)moveButtonsBackLeft:(UIView*)v{
    for(int i = 1; i<=6 ; i++){
        UIButton *b = [v viewWithTag:(111110+i)];
        CGRect rect = b.frame;
        [UIView animateWithDuration:0.3 animations:^{
            b.frame = CGRectMake(rect.origin.x+500, rect.origin.y, rect.size.width, rect.size.height);
        }];
}}

@end
