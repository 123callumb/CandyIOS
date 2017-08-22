//
//  CE_shirts_menu.m
//  Candy
//
//  Created by Killian Comerford on 22/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "CE_shirts_menu.h"
#import "CE_menu_buttons.h"
#import "display_character.h"

@implementation CE_shirts_menu
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s{
    //making the scrollview
    UIScrollView *shirts_scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(v.layer.position.x + v.frame.size.width, v.layer.position.y - v.frame.size.height/11.8, v.layer.frame.size.width, v.frame.size.height/2.1)];
    [shirts_scroll setScrollEnabled:true];
    [v addSubview:shirts_scroll];
    shirts_scroll.tag = 10211111;
    shirts_scroll.userInteractionEnabled = true;
    //pull bar
    UIImageView *pull_bar_shirts = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pull_bar_shirts"]];
    pull_bar_shirts.frame = CGRectMake(v.frame.size.width, v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    pull_bar_shirts.tag=1238;
    
    //unlockedArray
    NSMutableArray *unlockedshirts = [[NSMutableArray alloc]init];
    [self addUnlockedshirts:unlockedshirts];
    
    //lockedArray
    NSMutableArray *lockedshirts = [[NSMutableArray alloc]init];
    [self addLockedshirts:lockedshirts];
    
    //add back button
    SEL aSel_back = @selector(back_button_action:);
    UIButton *back_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [back_button addTarget:self action:aSel_back forControlEvents:UIControlEventTouchUpInside];
    back_button.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    [back_button setImage:[UIImage imageNamed:@"button_back"]forState:UIControlStateNormal];
    back_button.tag = 10211113;
    
    [self spawnIcons:shirts_scroll view:v];
    [v addSubview:back_button];
    [v addSubview:pull_bar_shirts];
}
+(void)addUnlockedshirts:(NSMutableArray*)array{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:20 forKey:@"num_unlocked_shirts"];
    NSInteger baseUnlocked = [nd integerForKey:@"num_unlocked_shirts"];
    
    for(int i=0;i<=baseUnlocked;i++){
        NSString *add = [NSString stringWithFormat:@"icon_shirts_%i",i];
        [array addObject:add];
        NSLog(@"test %i", i);
    }
    [nd setObject:array forKey:@"unlocked_shirts"];
    [nd synchronize];
}
+(void)addLockedshirts:(NSMutableArray*)array{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:20 forKey:@"num_locked_shirts"];
    NSInteger baselocked = [nd integerForKey:@"num_locked_shirts"];
    
    for(int i=21;i<=baselocked;i++){
        NSString *add = [NSString stringWithFormat:@"icon_shirts_%i",i];
        [array addObject:add];
    }
    [nd setObject:array forKey:@"locked_shirts"];
    [nd synchronize];
}
+(void)spawnIcons:(UIScrollView*)s view:(UIView*)v{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    UIImageView *selected= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_selected"]];
    selected.frame = CGRectMake(0, 0, v.frame.size.width/2, v.frame.size.width/2);
    selected.tag = 12122;
    
    NSMutableArray *unlocked = [nd objectForKey:@"unlocked_shirts"];
    int spawned = 0;
    for(int i =0;i<unlocked.count;i++){
        int plusX = 0;
        int plusY = 0;
        if((i % 2)){plusX = v.frame.size.width/2;}
        plusY = (v.frame.size.width/2)*(i/2);
        NSString *name = unlocked[i];
        //UIImageView *Icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
        
        SEL aSel_shirts = @selector(shirts_selected:);
        UIButton *shirts = [UIButton buttonWithType:UIButtonTypeCustom];
        [shirts addTarget:self action:aSel_shirts forControlEvents:UIControlEventTouchUpInside];
        shirts.frame = CGRectMake(plusX, plusY, v.frame.size.width/2, v.frame.size.width/2);
        [shirts setImage:[UIImage imageNamed:name]forState:UIControlStateNormal];
        shirts.tag = 1000000+i;
        
        //Icon.frame = CGRectMake(plusX, plusY, v.frame.size.width/2, v.frame.size.width/2);
        [s setContentSize:CGSizeMake(v.frame.size.width,v.frame.size.width/2 + plusY)];
        [s addSubview:shirts];
        spawned++;
    }
    NSMutableArray *locked = [nd objectForKey:@"locked_shirts"];
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
+(void)addshirts{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    //increase this by one when adding a shirts
    NSInteger numOfshirts = 5;
    [nd setInteger:numOfshirts forKey:@"shirts_amount"];
    for(int i=0;i<= numOfshirts;i++){
        NSString *name = [NSString stringWithFormat:@"icon_shirts_%i",i];
        [nd setObject:name forKey:name];
    }
    [nd synchronize];
}
+(void)shirts_selected:(id)sender{
    UIButton *btn = (UIButton*)sender;
    UIView *view = btn.superview;
    UIView *v = view.superview;
    UIImageView *shirtst = [v viewWithTag:12312301];
    
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arr = [nd objectForKey:@"unlocked_shirts"];
    NSInteger tagg = btn.tag-1000000;
    NSString *unEdited = arr[tagg];
    NSRange range = [unEdited rangeOfString:@"shirts"];
    NSString *edited = [unEdited substringFromIndex:range.location];
    shirtst.image = [UIImage imageNamed:edited];
    [nd setObject:edited forKey:@"current_shirt_0"];
}
+(void)moveIn:(UIView*)v{
    UIScrollView *scroll = [v viewWithTag:10211111];
    [UIView animateWithDuration:0.3 animations:^{
        scroll.frame = CGRectMake(v.layer.position.x - v.frame.size.width/2, v.layer.position.y - v.frame.size.height/11.8, v.layer.frame.size.width, v.frame.size.height/2.1);
    }];
    UIButton *btn = [v viewWithTag:10211113];
    [UIView animateWithDuration:0.3 animations:^{
        btn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height - 16*((v.frame.size.width/2)/45),v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIButton *continueBtn = [v viewWithTag:11114];
    [UIView animateWithDuration:0.3 animations:^{
        continueBtn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIImageView *pull = [v viewWithTag:1238];
    [UIView animateWithDuration:0.3 animations:^{
        pull.frame = CGRectMake(v.frame.size.width - v.frame.size.width/4, v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    }];
    
    [CE_menu_buttons moveButtonsToSideLeft:v];
}
+(void)back_button_action:(id)sender{
    UIView *v = [sender superview];
    UIScrollView *scroll = [v viewWithTag:10211111];
    [UIView animateWithDuration:0.3 animations:^{
        scroll.frame = CGRectMake(v.layer.position.x + v.frame.size.width, v.layer.position.y - v.frame.size.height/11.8, v.layer.frame.size.width, v.frame.size.height/2.1);
    }];
    
    UIButton *btn = [v viewWithTag:10211113];
    UIButton *continueBtn = [v viewWithTag:11114];
    
    [UIView animateWithDuration:0.3 animations:^{
        continueBtn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height - 16*((v.frame.size.width/2)/45),v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIImageView *pull = [v viewWithTag:1238];
    [UIView animateWithDuration:0.3 animations:^{
        pull.frame = CGRectMake(v.frame.size.width, v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    }];
    [CE_menu_buttons moveButtonsBackLeft:v];
}

@end
