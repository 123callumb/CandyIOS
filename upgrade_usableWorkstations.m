//
//  upgrade_usableWorkstations.m
//  Candy
//
//  Created by Killian Comerford on 20/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "upgrade_usableWorkstations.h"
#import "levelWorkstations.h"

@implementation upgrade_usableWorkstations
+(void)setTextures:(UIImageView*)box text:(UILabel*)txt{
    [box setImage:[UIImage imageNamed:@"workStationsUnlocked"]];
    txt.text = @"Unlock Workstation";
}
@end
