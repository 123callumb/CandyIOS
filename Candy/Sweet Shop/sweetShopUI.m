//
//  sweetShopUI.m
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetShopUI.h"
#import "sweetShopBackground.h"
#import "sweetScrollUI.h"
#import "sweetShop.h"
#import "backButtonSweetShop.h"

@implementation sweetShopUI
+(void)addUIView: (UIView*)v {
    UIView *main = [[UIView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    
    main.hidden = true;
    main.tag = 1000;
    
    [sweetShopBackground addBacking:main];
    [sweetScrollUI addScrollUI:main];
    [backButtonSweetShop addBackButton:main];
    
    [v addSubview:main];

}
+(void)showSweetShopUI:(UIView*)v {
    UIView *ui = (UIView*)[v viewWithTag:1000];
    ui.hidden = false;
}
+(void)hideSweetShopUI: (UIView*)view {
    UIView *ui = (UIView*)[view viewWithTag:1000];
    ui.hidden = true;
}
@end
