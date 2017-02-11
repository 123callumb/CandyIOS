//
//  workstationStore.h
//  Candy
//
//  Created by Callum Beckwith on 08/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface workstationStore : UIView
+(void)addWorkstationStoreUI: (UIView*)v;
+(void)onBuy: (int)stationID view:(UIView*)v;
+(void)onEquip: (int)stationID view:(UIView*)v;
@end
