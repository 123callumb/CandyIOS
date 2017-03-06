//
//  specialsItem.m
//  Candy
//
//  Created by Callum Beckwith on 06/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "specialsItem.h"
#import "specialsItemUi.h"

@implementation specialsItem

+(NSArray*)specialItems {
    NSArray *items = [[NSArray alloc] initWithObjects:@"x5Multiplier",
                                                      @"x10Multiplier",
                                                      @"x15Multiplier",
                                                      @"auto30",
                                                      @"auto60",
                                                      @"auto120",
                                                            nil];
    return items;
}
+(void)createSpecialItemPane: (UIScrollView*)v {
    [v setContentSize:CGSizeMake(v.frame.size.width, v.frame.size.height * 1.2)];

    for(int i = 0; i <= [[self specialItems] count] - 1; i++){
        [self createSpecialObject:v butNo:i];
    }
    
}
+(void)createSpecialObject:(UIScrollView*)v butNo:(int)buttonID {
    float itemArea = v.frame.size.width/2.4;
    UIImage *buttonImage = [UIImage imageNamed:[[self specialItems] objectAtIndex:buttonID]];
    UIButton *paneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [paneButton setImage:buttonImage forState:UIControlStateNormal];
    [paneButton addTarget:self action:@selector(onPressOfItem:) forControlEvents:UIControlEventTouchUpInside];
    [paneButton setTag:350000 + buttonID];
    
    CGRect objPos = [self determinePosition:itemArea Padding:itemArea/8 drawNo:buttonID];
    
    
    [paneButton setFrame:objPos];
    
    [v addSubview:paneButton];
}
+(CGRect)determinePosition: (float)slotSquared Padding:(float)padding drawNo:(int)drawID {
    float xPos = padding;
    float yPos = 0;
    
    int rowNo = 0;
    
    for(int i = 1; i <= [[self specialItems] count] - 1; i = i + 2){
        if (drawID == i) {
            xPos = (slotSquared*2.4) - slotSquared - padding;
        }
    }
    for(int i = 0; i <= [[self specialItems] count] - 1; i = i + 2){
        if(drawID == i || drawID == i + 1){
            yPos = ((slotSquared + padding) * rowNo) + padding;
        }else {
            rowNo++;
        }
    }
    return CGRectMake(xPos, yPos, slotSquared, slotSquared);
}
+(void)onPressOfItem: (id)sender {
    UIButton *item = (UIButton*)sender;
    UIView *v = [item superview];
    UIView *v1 = [v superview];
    
    [specialsItemUi createItemUIWithID:(int)((item.tag) - 350000) view:v1];
}
@end
