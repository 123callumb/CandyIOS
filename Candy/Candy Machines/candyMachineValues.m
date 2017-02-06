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
    
    if(upgradeValue == 0){
        return 10000;
    }
    if(upgradeValue == 1){
        return 25000;
    }
    if(upgradeValue == 2){
        return 50000;
    }
    if(upgradeValue == 3){
        return 100000;
    }
    if(upgradeValue == 4){
        return 250000;
    }
    if(upgradeValue == 5){
        return 500000;
    }
    if(upgradeValue == 6){
        return 1000000;
    }
    return 0;
}
+(int)slotPrices: (int)slotValue {
    
    if(slotValue == 0){
        return 25;
    }
    if(slotValue == 1){
        return 50;
    }
    if(slotValue == 2){
        return 100;
    }
    return 0;
}
@end
