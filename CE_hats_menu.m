//
//  CE_hats_menu.m
//  Candy
//
//  Created by Killian Comerford on 22/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "CE_hats_menu.h"
#import "CE_menu_buttons.h"
#import "display_character.h"

@implementation CE_hats_menu
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s{
    //making the scrollview
    UIScrollView *hats_scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(v.layer.position.x - v.frame.size.width*2, v.layer.position.y - v.frame.size.height/11.8, v.layer.frame.size.width, v.frame.size.height/2.1)];
    [hats_scroll setScrollEnabled:true];
    [v addSubview:hats_scroll];
    hats_scroll.tag = 11111;
    hats_scroll.userInteractionEnabled = true;
    //pull bar
    UIImageView *pull_bar_hat = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pull_bar_hats"]];
    pull_bar_hat.frame = CGRectMake(v.layer.position.x -v.frame.size.width/2-(v.frame.size.width/4), v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    pull_bar_hat.tag=1235;
    //unlockedArray
    NSMutableArray *unlockedHats = [[NSMutableArray alloc]init];
    [self addUnlockedHats:unlockedHats];
    //lockedArray
    NSMutableArray *lockedHats = [[NSMutableArray alloc]init];
    [self addLockedHats:lockedHats];
    //add back button
    SEL aSel_back = @selector(back_button_action:);
    UIButton *back_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [back_button addTarget:self action:aSel_back forControlEvents:UIControlEventTouchUpInside];
    back_button.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    [back_button setImage:[UIImage imageNamed:@"button_back"]forState:UIControlStateNormal];
    back_button.tag = 11113;
    
    [self spawnIcons:hats_scroll view:v];
    [v addSubview:back_button];
    [v addSubview:pull_bar_hat];
}
+(void)addUnlockedHats:(NSMutableArray*)array{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:20 forKey:@"num_unlocked_hats"];
    NSInteger baseUnlocked = [nd integerForKey:@"num_unlocked_hats"];
    
    for(int i=0;i<=baseUnlocked;i++){
        NSString *add = [NSString stringWithFormat:@"icon_hat_%i",i];
        [array addObject:add];
    }
    [nd setObject:array forKey:@"unlocked_hats"];
    [nd synchronize];
}
+(void)addLockedHats:(NSMutableArray*)array{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:20 forKey:@"num_locked_hats"];
    NSInteger baselocked = [nd integerForKey:@"num_locked_hats"];
    
    for(int i=21;i<=baselocked;i++){
        NSString *add = [NSString stringWithFormat:@"icon_hat_%i",i];
        [array addObject:add];
    }
    [nd setObject:array forKey:@"locked_hats"];
    [nd synchronize];
}
+(void)spawnIcons:(UIScrollView*)s view:(UIView*)v{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    UIImageView *selected= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_selected"]];
    selected.frame = CGRectMake(0, 0, v.frame.size.width/2, v.frame.size.width/2);
    selected.tag = 12121;
    
    NSMutableArray *unlocked = [nd objectForKey:@"unlocked_hats"];
    int spawned = 0;
    for(int i =0;i<unlocked.count;i++){
        int plusX = 0;
        int plusY = 0;
        if((i % 2)){plusX = v.frame.size.width/2;}
        plusY = (v.frame.size.width/2)*(i/2);
        NSString *name = unlocked[i];
        //UIImageView *Icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
        
        SEL aSel_hat = @selector(hat_selected:);
        UIButton *hat = [UIButton buttonWithType:UIButtonTypeCustom];
        [hat addTarget:self action:aSel_hat forControlEvents:UIControlEventTouchUpInside];
        hat.frame = CGRectMake(plusX, plusY, v.frame.size.width/2, v.frame.size.width/2);
        [hat setImage:[UIImage imageNamed:name]forState:UIControlStateNormal];
        hat.tag = 1000000+i;
        
        //Icon.frame = CGRectMake(plusX, plusY, v.frame.size.width/2, v.frame.size.width/2);
        [s setContentSize:CGSizeMake(v.frame.size.width,v.frame.size.width/2 + plusY)];
        [s addSubview:hat];
        spawned++;
    }
    NSMutableArray *locked = [nd objectForKey:@"locked_hats"];
    for(int i =0;i<locked.count;i++){
        int plusX = 0;
        int plusY = 0;
        if((spawned % 2)){plusX = v.frame.size.width/2;}
        plusY = (v.frame.size.width/2)*(spawned/2);
        NSString *name = locked[i];
        UIImageView *Icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
        
        UIImageView *cover = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_locked"]];
        Icon.frame = CGRectMake(plusX, plusY, v.frame.size.width/2, v.frame.size.width/2);
        cover.frame = CGRectMake(plusX, plusY, v.frame.size.width/2, v.frame.size.width/2);
        [s setContentSize:CGSizeMake(v.frame.size.width,v.frame.size.width/2 + plusY)];
        [s addSubview:Icon];
        [s addSubview:cover];
        spawned++;
    }
    [s addSubview:selected];
    [nd synchronize];
}
+(void)addHats{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    //increase this by one when adding a hat
    NSInteger numOfHats = 5;
    [nd setInteger:numOfHats forKey:@"hats_amount"];
    for(int i=0;i<= numOfHats;i++){
        NSString *name = [NSString stringWithFormat:@"icon_hat_%i",i];
        [nd setObject:name forKey:name];
    }
    [nd synchronize];
}
+(void)hat_selected:(id)sender{
    UIButton *btn = (UIButton*)sender;
    UIView *view = btn.superview;
    UIView *v = view.superview;
    UIImageView *hatt = [v viewWithTag:1231230];
    
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arr = [nd objectForKey:@"unlocked_hats"];
    NSInteger tagg = btn.tag-1000000;
    NSString *unEdited = arr[tagg];
    NSRange range = [unEdited rangeOfString:@"hat"];
    NSString *edited = [unEdited substringFromIndex:range.location];
    hatt.image = [UIImage imageNamed:edited];
    [nd setObject:edited forKey:@"current_hat"];
}
+(void)moveIn:(UIView*)v{
    UIScrollView *scroll = [v viewWithTag:11111];
    [UIView animateWithDuration:0.3 animations:^{
        scroll.frame = CGRectMake(v.layer.position.x - v.frame.size.width/2, v.layer.position.y - v.frame.size.height/11.8, v.layer.frame.size.width, v.frame.size.height/2.1);
    }];
    UIButton *btn = [v viewWithTag:11113];
    [UIView animateWithDuration:0.3 animations:^{
        btn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height - 16*((v.frame.size.width/2)/45),v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIButton *continueBtn = [v viewWithTag:11114];
    [UIView animateWithDuration:0.3 animations:^{
        continueBtn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIImageView *pull = [v viewWithTag:1235];
    [UIView animateWithDuration:0.3 animations:^{
        pull.frame = CGRectMake(v.layer.position.x -v.frame.size.width/2, v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    }];
    
    [CE_menu_buttons moveButtonsToSide:v];
}
+(void)back_button_action:(id)sender{
    UIView *v = [sender superview];
    UIScrollView *scroll = [v viewWithTag:11111];
    [UIView animateWithDuration:0.3 animations:^{
        scroll.frame = CGRectMake(v.layer.position.x - v.frame.size.width*2, v.layer.position.y - v.frame.size.height/11.8, v.layer.frame.size.width, v.frame.size.height/2.1);
    }];
    
    UIButton *btn = [v viewWithTag:11113];
    UIButton *continueBtn = [v viewWithTag:11114];
    
    [UIView animateWithDuration:0.3 animations:^{
        continueBtn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height - 16*((v.frame.size.width/2)/45),v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIImageView *pull = [v viewWithTag:1235];
    [UIView animateWithDuration:0.3 animations:^{
        pull.frame = CGRectMake(v.layer.position.x -v.frame.size.width/2 - (v.frame.size.width/4), v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    }];
    [CE_menu_buttons moveButtonsBack:v];
}

@end
