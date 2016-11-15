//
//  comboTimer.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "comboTimer.h"
#import "combo.h"
#import "money.h"

@implementation comboTimer

int comboTimerValue = 0;
bool comboActive = true;

bool comboReset;
bool alreadyCounting = false;
bool readyRelease = false;

+(void)startTimer: (SKScene *)s {
    readyRelease = false;
}

+(void)realeaseMechanism: (SKScene*)s {
    
    SKAction *tenSeconds = [SKAction waitForDuration:10];
    
    [s runAction:tenSeconds completion:^{
        readyRelease = true;
        SKAction *oneSecond = [SKAction waitForDuration:1];
        int x = [money getBalance];
        [s runAction:oneSecond completion:^{
            int y = [money getBalance];
            if(readyRelease == true && y == x){
                [combo resetCombo:s];
            }
        }];
    }];
}

+(bool)getComboValue {
    return comboActive;
}
@end
