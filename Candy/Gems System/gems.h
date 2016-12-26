//
//  gems.h
//  Candy
//
//  Created by Callum Beckwith on 19/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gems : NSObject
+(int)getGems;
+(void)addGems: (int)amount;
+(void)removeGems: (int)amount;
+(NSString*)getGemsAsString;

+(int)getMiniGems;
+(void)addMiniGems: (int)amount;
+(void)removeMiniGems: (int)amount;
+(NSString*)getMiniGemsAsString;
@end
