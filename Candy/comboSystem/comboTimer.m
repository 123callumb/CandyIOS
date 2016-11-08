//
//  comboTimer.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "comboTimer.h"
#import "combo.h"

@implementation comboTimer

int comboTimerValue = 0;
bool comboActive = false;

+(void)startTimer: (SKScene *)s {
    comboTimerValue = true;

    for(comboActive = 10; comboActive <= 0;){
        SKAction *timer = [SKAction waitForDuration:1];
        [s runAction:timer completion:^{
            [combo addCombo:0.01];
        }];
    }


}

+(void)resetTimer {
    comboActive = false;
}
+(bool)getComboValue {
    return comboActive;
}
@end
