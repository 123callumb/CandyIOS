//
//  upgrade_wrapped.m
//  Candy
//
//  Created by Killian Comerford on 20/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "upgrade_wrapped.h"

@implementation upgrade_wrapped
+(void)setTextures:(UIImageView*)box text:(UILabel*)txt{
    [box setImage:[UIImage imageNamed:@"upgrade_wrapped"]];
    txt.text = @"Upgrade Wrapped";
}

@end
