//
//  objectivesData.m
//  Candy
//
//  Created by Callum Beckwith on 15/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "objectivesData.h"

@implementation objectivesData

+(void)addGoldObjectives: (NSMutableArray*)goldObjs {
    [goldObjs addObject:@"Open 4 packets of sweets"];
    [goldObjs addObject:@"Own 10 Sweets"];
    [goldObjs addObject:@"Uprade a Candy Machine"];
    [goldObjs addObject:@"Upgrade your Building"];
    [goldObjs addObject:@"Unlock another Slot for a Machine"];
}

+(void)addSilverObjectives: (NSMutableArray*)silverObjs {
    [silverObjs addObject:@"Equip a sweet to a machine"];
    [silverObjs addObject:@"Use them Gemerator to get Gems"];
    [silverObjs addObject:@"Reach 10000 Coins"];
    [silverObjs addObject:@"Watch an advert to claim a free item"];
    [silverObjs addObject:@"Sell one of your Sweets for Coins"];
    [silverObjs addObject:@"Sell one of your Sweets for Mini Gems"];
}
+(void)addBronzeObjectives: (NSMutableArray*)bronzeObjs {
    [bronzeObjs addObject:@"View the current 'Sweet Trends'"];
    [bronzeObjs addObject:@"View your outfit in the 'Player Menu'"];
    [bronzeObjs addObject:@"Buy a new Desk from the store"];
    [bronzeObjs addObject:@"Reach 10000 Coins"];
    [bronzeObjs addObject:@"Buy a new Worksttion theme"];
}

+(NSMutableArray*)goldObjs {
    NSMutableArray *goldObjArray = [[NSMutableArray alloc] init];
    [self addGoldObjectives:goldObjArray];
    return goldObjArray;
}

+(NSMutableArray*)silverObjs {
    NSMutableArray *silverObjArray = [[NSMutableArray alloc] init];
    [self addSilverObjectives:silverObjArray];
    return silverObjArray;
}

+(NSMutableArray*)bronzeObjs {
    NSMutableArray *bronzeObjArray = [[NSMutableArray alloc] init];
    [self addBronzeObjectives:bronzeObjArray];
    return bronzeObjArray;
}

+(int)getGoldProgress {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"obj_gold_prog"];
}
+(int)getSilverProgress {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"obj_silver_prog"];
}
+(int)getBronzeProgress {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"obj_bronze_prog"];
}

+(void)setGoldProgress: (int)value {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:value forKey:@"obj_gold_prog"];
}
+(void)setSilverProgress: (int)value {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:value forKey:@"obj_silver_prog"];
}
+(void)setBronzeProgress: (int)value {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:value forKey:@"obj_bronze_prog"];
}
@end
