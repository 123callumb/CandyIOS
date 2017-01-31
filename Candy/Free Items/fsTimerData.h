//
//  fsTimerData.h
//  Candy
//
//  Created by Callum Beckwith on 31/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface fsTimerData : NSObject
+(void)storeNextGemAdvert;
+(int)getGemTimeLeft;
+(void)storeNextCoinAdvert;
+(int)getCoinTimeLeft;
+(void)storeNextMiniGemAdvert;
+(int)getMiniGemTimeLeft;
@end
