//
//  firstTimeDataSetup.m
//  Candy
//
//  Created by Callum Beckwith on 05/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "firstTimeDataSetup.h"
#import "gems.h"
#import "packetInventoryData.h"
#import "candyMachines.h"
#import "money.h"
#import "settingsData.h"

@implementation firstTimeDataSetup
+(void)setup {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    if([nd integerForKey:@"setup_int"] == 0){
        
        [candyMachines increaseCandyMachinesByOne];
        
        [gems addGems:100];
        [money addBalance:10000000];
        
        [packetInventoryData addPacketWithStringToInventory:@"lollyPacket"];
        [packetInventoryData addPacketWithStringToInventory:@"jawbreakerPacket"];
        [packetInventoryData addPacketWithStringToInventory:@"sweetPacket"];
    
        [settingsData toggleFancyGraphics:true];
        [settingsData toggleTips:true];
        [settingsData toggleMusic:true];
        
        [nd setInteger:1 forKey:@"setup_int"];
        [nd synchronize];
    }
}
@end
