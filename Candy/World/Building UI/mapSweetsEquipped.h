//
//  mapSweetsEquipped.h
//  Candy
//
//  Created by Callum Beckwith on 27/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mapSweetsEquipped : NSObject
+(bool)hasSweetEquippedToBuilding:(long)sweetUUID forBuilding:(int)buildingID;
+(void)updateAndLoadCurrentEquippedSweetsByUUID;
@end
