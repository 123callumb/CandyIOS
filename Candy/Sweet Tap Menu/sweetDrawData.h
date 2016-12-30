//
//  sweetDrawData.h
//  Candy
//
//  Created by Callum Beckwith on 28/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sweetDrawData : NSObject
+(NSMutableArray*)getDraw;
+(void)editObject: (int)drawSlot invSlot:(int)invSlotID;
+(NSString*)getTextureAtSlot: (int)slotNo;
+(NSMutableDictionary*)getSweetDataAtSlot: (int)slotID;
+(int)getDrawsUnlocked;
+(int)getDrawSelected;
+(void)setDrawSelected: (int)amount;
+(void)setDrawsUnlocked: (int)amount;
@end
