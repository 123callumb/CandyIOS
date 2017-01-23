//
//  upgrade_chew.m
//  Candy
//
//  Created by Killian Comerford on 20/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "upgrade_chew.h"

@implementation upgrade_chew

+(void)setTextures:(UIImageView*)box text:(UILabel*)txt{
    [box setImage:[UIImage imageNamed:@"upgrade_chew"]];
    txt.text = @"Upgrade Chew";
}
@end
