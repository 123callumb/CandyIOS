//
//  sweetDrawData.m
//  Candy
//
//  Created by Callum Beckwith on 28/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetDrawData.h"

@implementation sweetDrawData
+(int)getDrawsUnlocked {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    int drawsUnlocked = (int)[nd integerForKey:@"drawsUnlocked"];
    return drawsUnlocked;
}
+(void)setDrawsUnlocked: (int)amount {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:[self getDrawsUnlocked]+amount forKey:@"drawsUnlocked"];
}
+(NSMutableArray*)getDraw {
    
    NSMutableArray *drawArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"sweetDraw"];
    
    if(arrayToData == nil){
        drawArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    drawArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return drawArray;
    
}
+(void)addObject: (NSMutableDictionary*)sweetData {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *draw = [self getDraw];
    
    if(draw == nil){
        draw = [[NSMutableArray alloc] init];
    }
    
    [draw addObject:sweetData];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:draw];
    
    [nd setObject:arrayToData forKey:@"sweetDraw"];
    [nd synchronize];
    
}
+(NSMutableDictionary*)getSweetDataAtSlot: (int)slotID {
    NSMutableArray *invAray = [self getDraw];
    NSMutableDictionary *sweetData = [invAray objectAtIndex:slotID];
    return sweetData;
}
+(void)removeObject: (int)slotID {
    NSMutableArray *draw = [self getDraw];
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    if(draw == nil){
        draw = [[NSMutableArray alloc] init];
    }
    
    [draw removeObjectAtIndex:slotID];
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:draw];
    [nd setObject:arrayToData forKey:@"sweetDraw"];
    [nd synchronize];
    
}
+(NSString*)getTextureAtSlot: (int)slotNo {
    NSMutableArray *draw = [self getDraw];
    NSMutableDictionary *drawData = [draw objectAtIndex:slotNo];
    NSString *textureName = [drawData objectForKey:@"sweet_texture"];
    
    if(textureName == nil){
        return @"emptyDraw";
    }else {
        return textureName;
    }
}
@end
