//
//  candyMachineSweetsEquiped.m
//  Candy
//
//  Created by Callum Beckwith on 06/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineSweetsEquiped.h"

@implementation candyMachineSweetsEquiped
+(NSMutableArray*)equippedSweets {
    NSMutableArray *equippedArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"equippedSweets"];
    
    if(arrayToData == nil){
        equippedArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    equippedArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return equippedArray;
    
}
+(void)equipSweet: (NSNumber*)equipedSweetUUID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *equippedSweets = [self equippedSweets];
    
    if(equippedSweets == nil){
        equippedSweets = [[NSMutableArray alloc] init];
    }
    
    [equippedSweets addObject:equipedSweetUUID];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:equippedSweets];
    
    [nd setObject:arrayToData forKey:@"equippedSweets"];
    [nd synchronize];
}
+(bool)hasAlreadyGotItemEquiped {
    return nil;
}
@end
