//
//  bannerBonusUI.m
//  Candy
//
//  Created by Callum Beckwith on 24/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "bannerBonusUI.h"
#import "miniGemBonus.h"
#import "messageUI.h"
#import "bannerTimerData.h"

@implementation bannerBonusUI
+(void)bannerCalled:(UIView*)v {
    
    
    
    if ([[self bonusState] isEqualToString:@"enableBonus"]) {
            
        if([bannerTimerData getBonusOpenedLeft] <= 0){
            [messageUI createMessageBox:v information:@"This will allow to gain free Mini Gems every so often while an advert is displayed at the bottom of the screen. Thanks for supporting us!" representingImage:@"miniGems" imageScale:0.3 messageBoxID:51 displayOnce:false];
            [self setBannerCalled:true];
            [self addBonusBanner:v];
            [bannerTimerData storeBonusOpenedLast];
                
        }else {
                [messageUI createMessageBox:v information:[NSString stringWithFormat:@"You can only use this buton every 3 Minutes, please wait %d seconds!", [bannerTimerData getBonusOpenedLeft]] representingImage:@"dunnoButton" imageScale:0.3 messageBoxID:99 displayOnce:false];
            }
    }else {
            GADBannerView *banner = [v viewWithTag:1342];
            UIView *gemView = [v viewWithTag:1344];
            [self setBannerCalled:false];
            [banner removeFromSuperview];
            [gemView removeFromSuperview];
            [messageUI createMessageBox:v information:@"Thank you for supporting us :)" representingImage:@"dunnoButton" imageScale:0.3 messageBoxID:52 displayOnce:false];
        }
    
}
+(void)setBannerCalled:(BOOL)enabled {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    if(!enabled){
        [nd setObject:@"enableBonus" forKey:@"bonus_string"];
    }else {
        [nd setObject:@"disableBonus" forKey:@"bonus_string"];
    }
}
+(NSString*)bonusState {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSString *bonusTexture = [nd objectForKey:@"bonus_string"];
    
    if(![bonusTexture isEqualToString:@"enableBonus"] && ![bonusTexture isEqualToString:@"disableBonus"]){
        return @"enableBonus";
    }else {
        return [nd objectForKey:@"bonus_string"];
    }
}
+(void)addBonusBanner: (UIView*)v {
    if([[self bonusState] isEqualToString:@"disableBonus"]){
        GADRequest *req = [GADRequest request];
        req.testDevices = @[@"b44fc47a591e07610a40e9763e12770d"];
        
        
        GADBannerView *banner = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
        [banner setAdUnitID:@"ca-app-pub-1801714701929045/2681870413"];
        [banner setRootViewController:(UIViewController*)v];
        [banner setDelegate:(id<GADBannerViewDelegate>)self];
        [banner setFrame:CGRectMake(0, v.frame.size.height-banner.frame.size.height, banner.frame.size.width, banner.frame.size.height)];
        [banner loadRequest:req];
        [banner setTag:1342];
        
        [v addSubview:banner];
    }

}
+(void)adViewDidReceiveAd:(GADBannerView *)bannerView {
    bannerView.hidden = NO;
    NSLog(@"im guessing were calling here everytime");
    [miniGemBonus createMiniGemBonusBar:[bannerView superview] bannerView:bannerView];

}
+(void)adView:(GADBannerView *)adView didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError: %@", error.localizedDescription);
}
@end
