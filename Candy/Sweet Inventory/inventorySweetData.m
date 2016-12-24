//
//  inventorySweetData.m
//  Candy
//
//  Created by Callum Beckwith on 20/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "inventorySweetData.h"
#import "sweetInventoryData.h"

@implementation inventorySweetData
+(void)addSweet: (NSString*)sweetName sweetTextureName:(NSString*)textureName sweetColorRarity:(NSString*)colorRare {
    NSMutableDictionary *sweetData = [[NSMutableDictionary alloc] init];
    [sweetData setValue:sweetName forKey:@"sweet_name"];
    [sweetData setValue:textureName forKey:@"sweet_texture"];
    [sweetData setValue:colorRare forKey:@"sweet_color"];
    [sweetInventoryData addObject:sweetData];
}
@end
