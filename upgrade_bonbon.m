//
//  upgrade_bonbon.m
//  Candy
//
//  Created by Killian Comerford on 20/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "upgrade_bonbon.h"

@implementation upgrade_bonbon

+(void)setTextures:(UIImageView*)box text:(UILabel*)txt{
    [box setImage:[UIImage imageNamed:@"upgrade_bonbons"]];
    txt.text = @"Upgrade Bonbons";
}

@end
