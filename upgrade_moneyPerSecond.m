//
//  upgrade_moneyPerSecond.m
//  Candy
//
//  Created by Killian Comerford on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "upgrade_moneyPerSecond.h"

@implementation upgrade_moneyPerSecond
+(void)setTextures:(UIImageView*)box text:(UILabel*)txt{
    [box setImage:[UIImage imageNamed:@"coinPerSecond"]];
    txt.text = @"Money Per Sec";
}
+(void)whenPressed{
    
}

@end
