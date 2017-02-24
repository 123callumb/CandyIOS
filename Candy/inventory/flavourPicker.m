//
//  flavourPicker.m
//  Candy
//
//  Created by Callum Beckwith on 22/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "flavourPicker.h"
#import "slot1Data.h"
#import "registerBoxes.h"
#import "box1.h"

@implementation flavourPicker
int flavourNum = 0;

+(void)addFlavourPickerToView: (UIScrollView*)scrollView scene:(UIView*)v {
    [scrollView setContentSize:CGSizeMake(v.frame.size.width/1.458,320) ];
    scrollView.backgroundColor = [UIColor colorWithRed:90.0f/255.0f green:233.0f/255.0f blue:184.0f/255.0f alpha:1.0f];
    scrollView.center = CGPointMake(v.frame.size.width/2, v.frame.size.height/1.6);
    scrollView.tag = 5;
   for(int i = 1; i <= 4; i++){
        [self addFlavourSlot:scrollView flavourId:i];
    }
    scrollView.hidden = true;
}
+(void)showUi: (UIView*)v {
    UIScrollView *sweetTypeView = (UIScrollView*)[v viewWithTag:5];
    sweetTypeView.hidden = false;
}
+(void)hideUi: (UIView*)v {
    UIScrollView *sweetTypeView = (UIScrollView*)[v viewWithTag:5];
    sweetTypeView.hidden = true;
}
+(void)addFlavourSlot: (UIScrollView*)scrollView flavourId:(int)flvId {
    NSString *flavourName = [self determineFlavourString:flvId];
    UIButton *menuItem = [UIButton buttonWithType:UIButtonTypeCustom];

    [menuItem setImage:[UIImage imageNamed:@"flavourMenu"] forState:UIControlStateNormal];
    
    SEL bMethod = @selector(onSlotPress:);

    [menuItem addTarget:self action:bMethod forControlEvents:UIControlEventTouchUpInside];
    menuItem.frame = CGRectMake(0, [self slotPositionSystemY:flvId scrollView:scrollView], scrollView.frame.size.width, 260*0.265);
    menuItem.tag = 800 + flvId;
    
    UILabel *flavourLabel = [[UILabel alloc] initWithFrame:CGRectMake(0-menuItem.frame.size.width/6, menuItem.frame.size.height/4.8, 300, 40)];
    
    [flavourLabel setTextColor:[UIColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1]];
    [flavourLabel setBackgroundColor:[UIColor clearColor]];
    [flavourLabel setFont:[UIFont fontWithName:@"Coder's-Crux" size:40.0f]];
    [flavourLabel setText:flavourName];
    flavourLabel.textAlignment = NSTextAlignmentCenter;
    [menuItem addSubview:flavourLabel];
    [scrollView addSubview:menuItem];
}
+(NSString*)determineFlavourString: (int)flavourID {
    if(flavourID == 1){
        return @"MINT";
    }
    if(flavourID == 2){
        return @"COKE";
    }
    if(flavourID == 3){
        return @"STRAWBERRY";
    }
    if (flavourID == 4) {
        return @"CHOCOLATE";
    }else {
        return @"NO FLAVOUR";
    }
}
//this needs making simpler! i will do the calculations when I can be arsed!
+(float)slotPositionSystemY: (int)slotId scrollView:(UIScrollView*)v{
    if(slotId == 1){
        return v.frame.size.height/24;
    }
    if(slotId == 2){
        return v.frame.size.height/24 + 75;
    }
    if(slotId ==3 ){
        return  v.frame.size.height/24 + 150;
    }
    if(slotId == 4){
        return v.frame.size.height/24 + 225;
    }
    return 0;
}
+(void)refreshSlots: (UIScrollView*)v {
    for (int i = 1; i <= 4; i++) {
        UIButton *slots = (UIButton*)[v viewWithTag:800 + i];
        [slots setImage:[UIImage imageNamed:@"flavourMenu"] forState:UIControlStateNormal];
    }
}

+(void)onSlotPress:(id)sender {
    UIButton *slotButton = (UIButton*) sender;
    UIView *view = (UIView*)[sender superview];
    UIScrollView *v = (UIScrollView*)[view viewWithTag:5];
    
    for (int i = 1; i <= 4; i++) {
        if(slotButton.tag == 800 + i){
                [slot1Data setFlavour:i sweetNum:[box1 getSelectedSlot]];
                [self refreshSlots:v];
                [slotButton setImage:[UIImage imageNamed:@"flavourMenuButton"] forState:UIControlStateNormal];
        }
    }
    
}

@end
