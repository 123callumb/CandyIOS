//
//  combo.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "combo.h"
#import "comboTimer.h"

@implementation combo

double comboValue = 1.0;

+(void)comboDecider:(SKScene *)s {
    if([comboTimer getComboValue] == false){
        [comboTimer startTimer:s];
    }
}
+(void)addCombo: (double)x{
    comboValue = comboValue + x;
}

+(double)getCombo {
    return comboValue;
}
+(NSString*)getComboAsString {
    NSString *comboV = [NSString stringWithFormat:@"%f", comboValue];
    return comboV;
}
@end
