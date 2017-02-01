//
//  upgrades_regular.h
//  Candy
//
//  Created by Killian Comerford on 01/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface upgrades_regular : UIImageView
+(void)addUpgrade:(long)upgradeID upgradeImage:(UIImageView*)box upgradeText:(UILabel*)txt;
+(void)setMoney:(long)i text:(UILabel*)txt i0:(int)i0 i1:(int)i1 i2:(int)i2 i3:(int)i3 i4:(int)i4 i5:(int)i5 i6:(int)i6;
+(void)fetchMoneyValue:(long)upgradeID moneyTextBox:(UILabel*)text;
+(void)upgradeActions:(long)upgradeID;
@end
