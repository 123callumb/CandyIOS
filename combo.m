//
//  combo.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "combo.h"
#import "comboTimer.h"
#import "comboBar.h"

@implementation combo

float comboValue = 1.01;

+(void)comboDecider:(SKScene *)s {
        [comboTimer startTimer:s];
}
+(void)addCombo: (float)x{
    comboValue = comboValue + x;
}

+(float)getCombo {
    return comboValue;
}
+(void)resetCombo: (SKScene*)s {
    comboValue = 1.00;
    [comboBar updateText:s];
}
+(NSString*)getComboAsString {
    NSString *comboV = [NSString stringWithFormat:@"%.02f", comboValue];
    return comboV;
}
@end
