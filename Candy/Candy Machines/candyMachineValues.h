//
//  candyMachineValues.h
//  Candy
//
//  Created by Callum Beckwith on 04/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface candyMachineValues : NSObject
+(NSString*)getCandyMachineTextureFirstState: (int)candyMachineID;
+(NSString*)getCandyMachineTextureSecondState: (int)candyMachineID;
+(int)upgradePrices: (int)upgradeValue;
+(int)slotPrices: (int)slotValue;
@end
