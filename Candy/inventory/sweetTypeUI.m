//
//  sweetTypeUI.m
//  Candy
//
//  Created by Callum Beckwith on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetTypeUI.h"
#import "slot.h"
#import "slot1Data.h"
#import "box1.h"

@implementation sweetTypeUI
bool slotSelected = false;

+(void)addMethodsToView: (UIScrollView*)scrollView scene:(UIView*)v {
    [scrollView setContentSize:CGSizeMake(v.frame.size.width/1.458,300) ];
    scrollView.backgroundColor = [UIColor colorWithRed:90.0f/255.0f green:233.0f/255.0f blue:184.0f/255.0f alpha:1.0f];
    scrollView.center = CGPointMake(v.frame.size.width/2, v.frame.size.height/1.6);
    scrollView.tag = 4;
    for(int i = 0; i <= 11; i++){
    [self addSweetSlot:scrollView id:i];
    }
    scrollView.hidden = true;
}
+(void)showUi: (UIView*)v {
    UIScrollView *sweetTypeView = (UIScrollView*)[v viewWithTag:4];
    sweetTypeView.hidden = false;
}
+(void)hideUi: (UIView*)v {
    UIScrollView *sweetTypeView = (UIScrollView*)[v viewWithTag:4];
    sweetTypeView.hidden = true;
}
+(void)addSweetSlot: (UIScrollView*)view id:(int)slotId{
    
    NSString *sweetName = [self slotTextureDecider:slotId];
    UIButton *slot = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImageView *sweet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:sweetName]];
    
    SEL bMeth = @selector(onSlotPress:);
    
    [slot addTarget:self action:bMeth forControlEvents:UIControlEventTouchUpInside];
    [slot setImage:[UIImage imageNamed:@"slot"] forState:UIControlStateNormal];
    
    slot.tag = 200 + slotId;
    slot.frame = CGRectMake([self slotPositionSystemX:slotId scrollView:view],[self slotPositionSystemY:slotId scrollView:view], 260*0.265, 260*0.265);
    sweet.frame = CGRectMake(slot.frame.size.width/3.6, slot.frame.size.height/4.4, 260*0.12, 260*0.12);
    sweet.contentMode = UIViewContentModeScaleAspectFill;
    
    [slot addSubview:sweet];
    [view addSubview:slot];
}

+(float)slotPositionSystemX: (int)slotId scrollView:(UIScrollView*)v{
    if(slotId == 0 || slotId == 3 || slotId == 6 || slotId == 9){
        return 0;
    }
    if (slotId == 1 || slotId == 4 || slotId == 7 || slotId == 10) {
        return (v.frame.size.width/3);
    }
    if (slotId == 2|| slotId == 5 || slotId == 8 || slotId == 11) {
        return (v.frame.size.width/3) * 2;
    }
    else {
        return 0;
    }
}

+(float)slotPositionSystemY: (int)slotId scrollView:(UIScrollView*)v{
    if(slotId == 0 || slotId == 1 || slotId == 2 ){
        return v.frame.size.height/24;
    }
    if(slotId == 3 || slotId == 4 || slotId == 5 ){
        return v.frame.size.height/24 + 75;
    }
    if(slotId == 6 || slotId == 7 || slotId == 8 ){
        return  v.frame.size.height/24 + 150;
    }
    if(slotId == 9 || slotId == 10 || slotId == 11 ){
        return v.frame.size.height/24 + 225;
    }
    return 0;
}

+(NSString*)slotTextureDecider: (int)i {
    if(i == 0){
        return @"defaultSweet";
    }
    if(i == 1){
        return @"bonbon";
    }
    if(i == 2){
        return @"badSweet";
    }
    else {
        return @"padlock";
    }
}
+(void)refreshSlots: (UIScrollView*)v {
    for (int i = 0; i <= 2; i++) {
        UIButton *slots = (UIButton*)[v viewWithTag:200 + i];
        [slots setImage:[UIImage imageNamed:@"slot"] forState:UIControlStateNormal];
    }
}
+(void)onSlotPress:(id)sender {
    UIButton *slotButton = (UIButton*) sender;
    UIView *view = (UIView*)[sender superview];
    UIScrollView *v = (UIScrollView*)[view viewWithTag:4];
    
    for (int i = 0; i <= 2; i++) {
        if(slotButton.tag == 200 + i){
            if(slotSelected == false){
                [slot1Data setSweet:i sweetNum:[box1 getSelectedSlot]];
                [self refreshSlots:v];
                [slotButton setImage:[UIImage imageNamed:@"slotSelected"] forState:UIControlStateNormal];
            }
        }
    }

}
@end
