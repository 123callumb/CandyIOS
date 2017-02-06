//
//  inventorySweetData.h
//  Candy
//
//  Created by Callum Beckwith on 20/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface inventorySweetData : NSObject
+(void)addSweet: (NSString*)sweetName sweetTextureName:(NSString*)textureName sweetColorRarity:(NSString*)colorRare  newUUID:(long)uuid;
@end
