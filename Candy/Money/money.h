//
//  money.h
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface money : SKNode
+(void)addBalance: (int)x;
+(NSString*)getBalanceAsString;
+(int)getBalance;
@end
