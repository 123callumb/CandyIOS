//
//  sweetUUID.h
//  Candy
//
//  Created by Callum Beckwith on 06/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sweetUUID : NSObject
+(long)createNewSweetUUID;
+(int)getInventoryIdForSweetWithUUID: (long)sweetUUID;
+(long)getUUIDForSweetWithInventoryID: (int)inventoryID;
@end
