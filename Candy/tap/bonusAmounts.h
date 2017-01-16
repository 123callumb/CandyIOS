//
//  bonusAmounts.h
//  Candy
//
//  Created by Callum Beckwith on 11/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bonusAmounts : NSObject
+(int)calculateMiniGemReturn;
+(int)calculateCoinReturn;
+(int)generateRandIntWithBounds: (int)lwrBound UprBound:(int)uprBound;
@end
