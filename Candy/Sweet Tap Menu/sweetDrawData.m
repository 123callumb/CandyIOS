//
//  sweetDrawData.m
//  Candy
//
//  Created by Callum Beckwith on 28/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetDrawData.h"
#import "sweetInventoryData.h"

@implementation sweetDrawData

int drawSelected = 0;

+(int)getDrawsUnlocked {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    int drawsUnlocked = (int)[nd integerForKey:@"drawsUnlocked"];
    return drawsUnlocked;
}
+(void)setDrawsUnlocked: (int)amount {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:[self getDrawsUnlocked]+1 forKey:@"drawsUnlocked"];
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
+(void)editObject: (int)drawSlot invSlot:(int)invSlotID {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *draw = [self getDraw];
    
    if(draw == nil){
        draw = [[NSMutableArray alloc] init];
        
        int blankInt = 1337;
        NSNumber *blank = [NSNumber numberWithInteger:blankInt];
        
        for(int i = 0; i <= 200; i++){
            [draw addObject:blank];
        }
    }

    NSNumber *newSlot = [NSNumber numberWithInteger:invSlotID];

    [draw replaceObjectAtIndex:drawSlot withObject:newSlot];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:draw];
    
    [nd setObject:arrayToData forKey:@"sweetDraw"];
    [nd synchronize];
    
}
+(NSMutableDictionary*)getSweetDataAtSlot: (int)slotID {
    NSMutableArray *invAray = [self getDraw];
    if(invAray != NULL){
    NSNumber *slotData = [invAray objectAtIndex:slotID];
    int slotNo = (int)[slotData integerValue];
    NSMutableDictionary *sweetData;
    if(slotNo == 1337 || slotNo > [[sweetInventoryData getInventory] count] - 1){
        [sweetData setObject:@"emptyDraw" forKey:@"sweet_texture"];
    }else{
        sweetData = [sweetInventoryData getSweetDataAtSlot:slotNo];
    }
    return sweetData;
    }
    return NULL;
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

    NSMutableDictionary *drawData = [self getSweetDataAtSlot:slotNo];
    NSString *textureName = [drawData objectForKey:@"sweet_texture"];
    
    if(textureName == nil){
        return @"emptyDraw";
    }else {
        return textureName;
    }
}
+(int)getDrawSelected {
    return drawSelected;
}
+(void)setDrawSelected: (int)amount {
    drawSelected = amount;
}
@end
