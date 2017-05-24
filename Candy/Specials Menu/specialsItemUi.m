//
//  specialsItemUi.m
//  Candy
//
//  Created by Callum Beckwith on 06/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "specialsItemUi.h"
#import "specialsItem.h"
#import "specialsData.h"

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
    
    [activate setFrame:CGRectMake(viewItem.frame.size.width/2 - viewItem.frame.size.width/3.4, viewItem.frame.size.height/1.65, viewItem.frame.size.width/1.7, viewItem.frame.size.height/6.5)];
    [itemBack setFrame:CGRectMake(viewItem.frame.size.width/2 - viewItem.frame.size.width/5.1, viewItem.frame.size.height/1.3, viewItem.frame.size.width/2.55, viewItem.frame.size.height/6.5)];
    [item setFrame:CGRectMake(viewItem.frame.size.width/2 - viewItem.frame.size.width/4.4, viewItem.frame.size.height/16, viewItem.frame.size.width/2.2, viewItem.frame.size.width/2.2)];

    [activate setImage:activateImage forState:UIControlStateNormal];
    [activate setTag:352000 + itemID];
    [itemBack setImage:backButton forState:UIControlStateNormal];
    [backing setImage:backingImage];
    [price setText:[NSString stringWithFormat:@"%d", [specialsItem getPriceOfItem:itemID]]];
    [price setFont:[UIFont fontWithName:@"Coder's-Crux" size:30]];
    [price setTextColor:[UIColor blackColor]];
    [price setTextAlignment:NSTextAlignmentCenter];
    
    
    [itemBack addTarget:self action:@selector(onBackPress:) forControlEvents:UIControlEventTouchUpInside];
    [activate addTarget:self action:@selector(onActivate:) forControlEvents:UIControlEventTouchUpInside];
    
    [viewItem addSubview:backing];
    [viewItem addSubview:item];
    [viewItem addSubview:activate];
    [viewItem addSubview:itemBack];
    [viewItem addSubview:price];
    
    [v addSubview:viewItem];
    
    [UIView animateWithDuration:0.3 animations:^{
        [viewItem setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    }];
    
    
}
+(void)onBackPress:(id)sender {
    UIButton *back = (UIButton*)sender;
    UIView *mainItemV = [back superview];
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainItemV setFrame:CGRectMake(mainItemV.frame.size.width, 0, mainItemV.frame.size.width, mainItemV.frame.size.height)];
        [mainItemV setAlpha:0.0];
    } completion:^(BOOL finished){
        [mainItemV removeFromSuperview];
    }];
}
+(void)onActivate:(id)sender {
    UIButton *acvtivate = (UIButton*)sender;
    int itemID = (int)(acvtivate.tag - 352000);
    UIView *mainItemV = [acvtivate superview];
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainItemV setFrame:CGRectMake(mainItemV.frame.size.width, 0, mainItemV.frame.size.width, mainItemV.frame.size.height)];
        [mainItemV setAlpha:0.0];
    } completion:^(BOOL finished){
        [mainItemV removeFromSuperview];
        [specialsData activateSpecialWithID:itemID];
    }];
}
+(void)itemActiveScene:(UIView*)v activeItemID:(int)itemID {
    UIView *viewItem = [[UIView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        
    UIImage *backingImage = [UIImage imageNamed:@"sp_active"];
    UIImageView *backing = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewItem.frame.size.width, viewItem.frame.size.height)];
    UIImage *itemImage = [UIImage imageNamed:[[specialsItem specialItems] objectAtIndex:itemID]];
    UIImageView *item = [[UIImageView alloc] initWithImage:itemImage];
    UILabel *activeTime = [[UILabel alloc] initWithFrame:CGRectMake(viewItem.frame.size.width/2 - viewItem.frame.size.width/4, viewItem.frame.size.height/1.19, viewItem.frame.size.width/2, viewItem.frame.size.height/20)];

    [item setFrame:CGRectMake(viewItem.frame.size.width/2 - viewItem.frame.size.width/3.4, viewItem.frame.size.height/3.1, viewItem.frame.size.width/1.7, viewItem.frame.size.width/1.7)];
    [backing setImage:backingImage];
    
    [activeTime setText:@"Go Tap!"];
    [activeTime setFont:[UIFont fontWithName:@"Coder's-Crux" size:30]];
    [activeTime setTextColor:[UIColor blackColor]];
    [activeTime setTextAlignment:NSTextAlignmentCenter];
    
    [viewItem addSubview:backing];
    [viewItem addSubview:item];
    [viewItem addSubview:activeTime];
    
    [v addSubview:viewItem];

}
@end
