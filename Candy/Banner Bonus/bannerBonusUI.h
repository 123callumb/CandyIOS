//
//  bannerBonusUI.h
//  Candy
//
//  Created by Callum Beckwith on 24/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@import GoogleMobileAds;

@interface bannerBonusUI : UIView<GADBannerViewDelegate>
+(void)addBonusBanner: (UIView*)v;
+(NSString*)bonusState;
+(void)setBannerCalled:(BOOL)enabled;
+(void)bannerCalled:(UIView*)v;
@end
