//
//  scrollUpdate.m
//  Candy
//
//  Created by Killian Comerford on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "scrollUpdate.h"
#import "upgrade_handler_regular.h"
#import "upgrade_handler_special.h"

int regularUpgrades = 5;
int specialUpgrades = 3;

@implementation scrollUpdate

+(void)initializeScrollRegular:(SKScene*)s{
    UIScrollView *ScrollRegular;
    ScrollRegular = [[UIScrollView alloc]initWithFrame:CGRectMake(s.view.frame.size.width / 19, s.view.frame.size.height / 4.2, 8.95*(s.view.frame.size.width /10), 2.38*(s.view.frame.size.height / 4))];
    for(int i = 0; i<= regularUpgrades; i++){
        [upgrade_handler_regular InitializeRegularUpgrade:ScrollRegular ID:i yPos:i*(ScrollRegular.frame.size.width/4)];
    }
    [ScrollRegular setContentSize:CGSizeMake(ScrollRegular.frame.size.width, (regularUpgrades+1)*32*(ScrollRegular.frame.size.width / 128))];
    ScrollRegular.backgroundColor = [UIColor colorWithRed:121.0f/255.0f green:75.0f/255.0f blue:148.0f/255.0f alpha:1];
    ScrollRegular.tag = 1;
    ScrollRegular.hidden = true;
    
    [s.view addSubview:ScrollRegular];
}
+(void)initializeScrollSpecial:(SKScene*)s{
    UIScrollView *ScrollSpecial;
    ScrollSpecial = [[UIScrollView alloc]initWithFrame:CGRectMake(s.view.frame.size.width / 19, s.view.frame.size.height / 4.2, 8.95*(s.view.frame.size.width /10), 2.38*(s.view.frame.size.height / 4))];
    for(int i = 0; i<= specialUpgrades; i++){
        [upgrade_handler_special InitializeSpecialUpgrade:ScrollSpecial ID:i yPos:i*(ScrollSpecial.frame.size.width/4)];
    }
    [ScrollSpecial setContentSize:CGSizeMake(ScrollSpecial.frame.size.width, (specialUpgrades+1)*32*(ScrollSpecial.frame.size.width / 128))];
    ScrollSpecial.backgroundColor = [UIColor colorWithRed:121.0f/255.0f green:75.0f/255.0f blue:148.0f/255.0f alpha:1];
    ScrollSpecial.tag = 2;
    ScrollSpecial.hidden = true;
    
    [s.view addSubview:ScrollSpecial];
}

+(void)Show:(UIView*)v{
    UIScrollView *regular = (UIScrollView*)[v viewWithTag:1];
    regular.hidden = false;
}
+(void)Hide:(UIView*)v{
    UIScrollView *updateView = (UIScrollView*)[v viewWithTag:1];
    updateView.hidden = true;
    UIScrollView *special = (UIScrollView*)[v viewWithTag:2];
    special.hidden = true;
}
+(void)switchMenu:(UIView*)v{
    UIScrollView *regular = (UIScrollView*)[v viewWithTag:1];
    UIScrollView *special = (UIScrollView*)[v viewWithTag:2];

    if(special.hidden){
        special.hidden = false;
        regular.hidden = true;
    }
    else if(regular.hidden){
        special.hidden = true;
        regular.hidden = false;
    }
}
@end
