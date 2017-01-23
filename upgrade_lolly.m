//
//  upgrade_lolly.m
//  Candy
//
//  Created by Killian Comerford on 20/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "upgrade_lolly.h"

@implementation upgrade_lolly

+(void)setTextures:(UIImageView*)box text:(UILabel*)txt{
    [box setImage:[UIImage imageNamed:@"upgrade_lolly"]];
    txt.text = @"Upgrade Lolly";
}

@end
