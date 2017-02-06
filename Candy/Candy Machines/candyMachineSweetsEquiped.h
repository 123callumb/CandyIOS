//
//  candyMachineSweetsEquiped.h
//  Candy
//
//  Created by Callum Beckwith on 06/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface candyMachineSweetsEquiped : NSObject
+(NSMutableArray*)equippedSweets;
+(void)equipSweet: (NSNumber*)equipedSweetUUID;
@end
