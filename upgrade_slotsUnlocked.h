//
//  upgrade_slotsUnlocked.h
//  Candy
//
//  Created by Killian Comerford on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface upgrade_slotsUnlocked : UIImageView
+(void)setTextures:(UIImageView*)box text:(UILabel*)txt id:(double)i;
+(void)whenPressed:(long)upgradePro;
+(void)fetchMoney:(long)upgradeVal text:(UILabel*)txt;
@end
