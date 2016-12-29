//
//  sweetDrawData.h
//  Candy
//
//  Created by Callum Beckwith on 28/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sweetDrawData : NSObject
+(void)addObject: (NSMutableDictionary*)sweetData;
+(NSString*)getTextureAtSlot: (int)slotNo;
+(int)getDrawsUnlocked;
@end
