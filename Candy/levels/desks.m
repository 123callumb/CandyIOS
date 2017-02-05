//
//  desks.m
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "desks.h"
#import "candyMachines.h"

@implementation desks
+(void)addDeskTypes: (NSMutableArray*)desks {
    [desks addObject:@"desk_wood"]; //ID 0 for when pulling from else where etc...
    [desks addObject:@"desk_grey"];  //ID 1
    [desks addObject:@"desk_polished"]; 
    [desks addObject:@"black_desk"];
    [desks addObject:@"desk_king"];
}
+(NSArray*)getDeskTypes {
    NSMutableArray *deskTypes = [[NSMutableArray alloc] init];
    [self addDeskTypes:deskTypes];
    return deskTypes;
}
+(NSString*)getCurrentDesk {
    int deskID = [self getCurrentDeskID];
    return [[self getDeskTypes] objectAtIndex:deskID];
}
+(void)setCurrentDeskID: (int)deskID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:deskID forKey:@"desk_ID"];
    [nd synchronize];
}
+(int)getCurrentDeskID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"desk_ID"];
}
+(void)addDesk: (CGPoint)pos scale:(float)scale nodeToAttatch:(SKScene*)s {
    SKSpriteNode *desk = [SKSpriteNode spriteNodeWithImageNamed:[self getCurrentDesk]];
    desk.xScale = scale;
    desk.yScale = scale;
    desk.position = pos;
    desk.zPosition = 0;
    desk.name = @"desk";
   // [candyMachines addCandyMachine:desk scale:1 position:CGPointMake(-desk.frame.size.width/2.4, desk.frame.size.height/1.3)];
    [s addChild:desk];
}
+(int)getAmountOfDesks {
    return (int)( [[self getDeskTypes] count] - 1 );
}
+(NSString*)getDeskAtIndex: (int)index {
    return [[self getDeskTypes] objectAtIndex:index];
}
+(NSMutableArray*)getOwnedDesksByID {
    NSMutableArray *floorArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"ownedDesks"];
    
    if(arrayToData == nil){
        floorArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    floorArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return floorArray;
}
+(void)addNewDeskToList: (int)deskID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *desks = [self getOwnedDesksByID];
    
    if(desks == nil){
        desks = [[NSMutableArray alloc] init];
    }
    
    NSNumber *newDesk = [NSNumber numberWithInt:deskID];
    
    [desks addObject:newDesk];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:desks];
    
    [nd setObject:arrayToData forKey:@"ownedDesks"];
    [nd synchronize];
}
+(bool)doesOwnDesk: (int)deskID {
    NSNumber *inputID = [NSNumber numberWithUnsignedInt:deskID];
    
    if([[self getOwnedDesksByID] containsObject:inputID]){
        
        return true;
    }else {
        return false;
    }
}

@end
