//
//  floorStore.h
//  Candy
//
//  Created by Callum Beckwith on 07/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface floorStore : UIView
+(void)addFloorStoreUI: (UIView*)v;
+(NSString*)determineScreenName: (NSString*)inputString;
+(int)determinePriceBasedOnName: (NSString*)inputString;
+(void)onBuy: (int)floorID view:(UIView*)v;
+(void)onEquip: (int)floorID view:(UIView*)v;
@end
