//
//  upgrade_jawbreaker.m
//  Candy
//
//  Created by Killian Comerford on 20/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "upgrade_jawbreaker.h"

@implementation upgrade_jawbreaker

+(void)setTextures:(UIImageView*)box text:(UILabel*)txt{
    [box setImage:[UIImage imageNamed:@"upgrade_jawbreaker"]];
    txt.text = @"Upgrade Jawbreaker";
}
@end
