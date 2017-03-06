//
//  specialsItemUi.m
//  Candy
//
//  Created by Callum Beckwith on 06/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "specialsItemUi.h"
#import "specialsItem.h"

@implementation specialsItemUi

+(void)createItemUIWithID:(int)itemID view:(UIView*)v {
    UIView *viewItem = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width*2, 0, v.frame.size.width, v.frame.size.height)];
    
    UIImage *backingImage = [UIImage imageNamed:@"sp_itemUI"];
    UIImageView *backing = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewItem.frame.size.width, viewItem.frame.size.height)];
    UIImage *itemImage = [UIImage imageNamed:[[specialsItem specialItems] objectAtIndex:itemID]];
    UIImageView *item = [[UIImageView alloc] initWithImage:itemImage];
    UIImage *activateImage = [UIImage imageNamed:@"activateButton"];
    UIImage *backButton = [UIImage imageNamed:@"backButtonSmall"];
    UIButton *activate = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *itemBack = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(viewItem.frame.size.width/2 - viewItem.frame.size.width/4, viewItem.frame.size.height/2, viewItem.frame.size.width/2, viewItem.frame.size.height/20)];
    
    [activate setImage:activateImage forState:UIControlStateNormal];
    [itemBack setImage:backButton forState:UIControlStateNormal];
    [backing setImage:backingImage];
    [price setText:@"10"];
    [price setFont:[UIFont fontWithName:@"Coder's-Crux" size:30]];
    [price setTextColor:[UIColor colorWithRed:228.0/255.0f green:228.0/255.0f blue:228.0/255.0f alpha:1]];
    [item setFrame:CGRectMake(viewItem.frame.size.width/2 - viewItem.frame.size.width/6, viewItem.frame.size.height/4, viewItem.frame.size.width/3, viewItem.frame.size.width/3)];
    
    [viewItem addSubview:backing];
    [viewItem addSubview:item];
    [viewItem addSubview:activate];
    [viewItem addSubview:itemBack];
    
    [v addSubview:viewItem];
    
    [UIView animateWithDuration:0.3 animations:^{
        [viewItem setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    }];
    
}

@end
