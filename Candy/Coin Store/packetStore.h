//
//  packetStore.h
//  Candy
//
//  Created by Callum Beckwith on 03/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface packetStore : UIView
+(void)addPacketStoreUI: (UIView*)v;
+(void)onBuy: (int)packetID;
@end
