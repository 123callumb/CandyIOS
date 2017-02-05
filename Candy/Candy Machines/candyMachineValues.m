//
//  candyMachineValues.m
//  Candy
//
//  Created by Callum Beckwith on 04/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineValues.h"
#import "candyMachines.h"

@implementation candyMachineValues
+(void)addCandyMachineTextures: (NSMutableArray*)machineTextures {
    [self createMachineWithTexture:machineTextures stateOne:@"machine_default" stateTwo:@"machine_default_1"];
    [self createMachineWithTexture:machineTextures stateOne:@"machine_default_1" stateTwo:@"machine_default"];

}

+(NSMutableArray*)candyMachineTextures {
    NSMutableArray *machineTextures = [[NSMutableArray alloc] init];
    [self addCandyMachineTextures:machineTextures];
    return machineTextures;
}
+(void)createMachineWithTexture:(NSMutableArray*)machineTextures stateOne:(NSString*)stateOne stateTwo:(NSString*)stateTwo {
    NSMutableDictionary *candyMachineTexture = [[NSMutableDictionary alloc] init];
    [candyMachineTexture setObject:stateOne forKey:@"candyMachine_textureOne"];
    [candyMachineTexture setObject:stateTwo forKey:@"candyMachine_textureTwo"];
    [machineTextures addObject:candyMachineTexture];
}

+(NSString*)getCandyMachineTextureFirstState: (int)candyMachineID {
    NSDictionary *textureData = [[self candyMachineTextures] objectAtIndex:[candyMachines getCandyMachineUpgradeValueAtID:candyMachineID]];
    NSString *texture = [textureData objectForKey:@"candyMachine_textureOne"];
    return texture;
}
+(NSString*)getCandyMachineTextureSecondState: (int)candyMachineID {
    NSDictionary *textureData = [[self candyMachineTextures] objectAtIndex:[candyMachines getCandyMachineUpgradeValueAtID:candyMachineID]];
    NSString *texture = [textureData objectForKey:@"candyMachine_textureTwo"];
    return texture;
}

+(int)upgradePrices: (int)upgradeValue {
    
    NSArray *price = @[@10000, @20000, @40000, @80000, @160000, @320000];
    
    for(int i = 0; i <= [price count] - 1; i++){
        if(i == upgradeValue){
            return (int)[price objectAtIndex:i];
        }
    }
    return 0;
}
+(int)slotPrices: (int)slotValue {
    
    NSArray *price = @[@25, @50, @100];
    
    for(int i = 0; i <= [price count] - 1; i++){
        if(i == slotValue){
            return (int)[price objectAtIndex:i];
        }
    }
    return 0;
}
@end
