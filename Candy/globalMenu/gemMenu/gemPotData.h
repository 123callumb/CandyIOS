//
//  gemPotData.h
//  Candy
//
//  Created by Callum Beckwith on 01/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface gemPotData : NSObject
+(int)getGems;
+(void)addGems: (int)amount scene:(SKSpriteNode*)s;
+(void)removeGems: (int)amount;
+(NSString*)getGemsAsString;
@end
