//
//  defaultLevel.m
//  Candy
//
//  Created by Callum Beckwith on 16/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "defaultLevel.h"
#import "Character.h"
#import "candyMachines.h"
#import "levelStructure.h"

@implementation defaultLevel
+(void)setLevel:(SKScene*)s{
    [levelStructure createLevel:s];
}
@end
