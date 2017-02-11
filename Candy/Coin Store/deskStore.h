//
//  deskStore.h
//  Candy
//
//  Created by Callum Beckwith on 08/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface deskStore : UIView
+(void)addDeskStoreUI: (UIView*)v;
+(void)onBuy: (int)deskID view:(UIView*)v;
+(void)onEquip: (int)deskID view:(UIView*)v;
@end
