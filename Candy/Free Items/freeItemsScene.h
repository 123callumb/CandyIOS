//
//  freeItemsScene.h
//  Candy
//
//  Created by Callum Beckwith on 26/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@import GoogleMobileAds;

@interface freeItemsScene : SKScene <GADRewardBasedVideoAdDelegate>

@property(nonatomic, weak) IBOutlet GADRewardBasedVideoAd *videoAd;

@end
