//
//  display_character.m
//  Candy
//
//  Created by Killian Comerford on 15/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "display_character.h"

@implementation display_character
+(void)display:(UIView*)view size:(double)s xPos:(double)x yPos:(double)y{
    CGRect position = CGRectMake(x, y, view.frame.size.width/s, 48*((view.frame.size.width/s)/32));
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    //base
    UIImageView *base = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"player_base_0"]];
    base.layer.frame = position;
    UIImageView *tone = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"player_tone"]];
    tone.tag = 10105;
    tone.layer.frame = position;
    tone.alpha = [nd floatForKey:@"player_alpha"];
    
    //clothes
    UIImageView *hat = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self fetchHat]]];
    hat.layer.frame = position;
    hat.tag = 1231230;
    UIImageView *shirt = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self fetchShirt_0]]];
    shirt.layer.frame = position;
    shirt.tag = 12312301;
    UIImageView *pants = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self fetchPants]]];
    pants.layer.frame = position;
    pants.tag = 12312302;
    UIImageView *shoes = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self fetchShoes]]];
    shoes.layer.frame = position;
    shoes.tag = 12312303;
    
    [view addSubview:base];
    [view addSubview:tone];
    [view addSubview:pants];
    [view addSubview:shirt];
    [view addSubview:hat];
    [view addSubview:shoes];
    
}
+(NSString*)fetchHat{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSString *hat = [nd objectForKey:@"current_hat"];
    return hat;
}
+(NSString*)fetchShirt_0{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSString *shirt_0 = [nd objectForKey:@"current_shirt_0"];
    return shirt_0;
}
+(NSString*)fetchShirt_1{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSString *shirt_1 = [nd objectForKey:@"current_shirt_1"];
    return shirt_1;
}
+(NSString*)fetchPants{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSString *pants = [nd objectForKey:@"current_pants"];
    return pants;
}
+(NSString*)fetchShoes{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSString *Shoes = [nd objectForKey:@"current_shoes"];
    return Shoes;
}
@end
