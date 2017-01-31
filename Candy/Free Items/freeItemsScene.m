//
//  freeItemsScene.m
//  Candy
//
//  Created by Callum Beckwith on 26/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "freeItemsScene.h"
#import "mainTransition.h"
#import "statsMenuButtons.h"
#import "messageUI.h"
#import "timerLabels.h"
#import "fsTimerData.h"
#import "gems.h"
#import "money.h"

@import GoogleMobileAds;

NSString *rewardedGood;

@implementation freeItemsScene

-(void)didMoveToView:(SKView *)view {
    [self setAnchorPoint:CGPointMake(0.5, 0.5)];
    [self addAllSceneItems:self];
}
-(void)addAllSceneItems: (SKScene*)s {
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"fsBackground"];
    background.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    
    SKSpriteNode *header = [SKSpriteNode spriteNodeWithImageNamed:@"fsHeader"];
    header.size = CGSizeMake(self.frame.size.width, self.frame.size.height/4.5);
    header.position = CGPointMake(0, self.frame.size.height/2 - header.frame.size.height/2);
    
    SKSpriteNode *note = [SKSpriteNode spriteNodeWithImageNamed:@"fsNote"];
    note.size = CGSizeMake(self.frame.size.width, self.frame.size.height/7);
    note.position = CGPointMake(0, self.frame.size.height/4.7);
    
    SKSpriteNode *gemButton = [SKSpriteNode spriteNodeWithImageNamed:@"fsGem"];
    gemButton.size = CGSizeMake(self.frame.size.width, self.frame.size.height/5);
    gemButton.position = CGPointMake(0, self.frame.size.height/20);
    gemButton.name = @"gemButton";
    [timerLabels addGemLabel:gemButton];

    SKSpriteNode *miniGemButton = [SKSpriteNode spriteNodeWithImageNamed:@"fsMiniGems"];
    miniGemButton.size = CGSizeMake(self.frame.size.width, self.frame.size.height/5);
    miniGemButton.position = CGPointMake(0, -self.frame.size.height/3.05);
    miniGemButton.name = @"miniGemButton";
    [timerLabels addMiniGemLabel:miniGemButton];
    
    SKSpriteNode *coinsButton = [SKSpriteNode spriteNodeWithImageNamed:@"fsCoins"];
    coinsButton.size = CGSizeMake(self.frame.size.width, self.frame.size.height/5);
    coinsButton.position = CGPointMake(0, -self.frame.size.height/7.2);
    coinsButton.name = @"coinsButton";
    [timerLabels addCoinLabel:coinsButton];
    
    SKSpriteNode *doneButton = [SKSpriteNode spriteNodeWithImageNamed:@"fsBackbutton"];
    doneButton.size = CGSizeMake(s.frame.size.width*2, self.frame.size.height/7);
    doneButton.xScale = 0.5;
    doneButton.yScale = 0.5;
    doneButton.position = CGPointMake(0, -self.frame.size.height/2 + doneButton.size.height/1.7);
    doneButton.name = @"doneButton";
    
    [s addChild:background];
    [s addChild:header];
    [s addChild:doneButton];
    [s addChild:gemButton];
    [s addChild:miniGemButton];
    [s addChild:coinsButton];
    [s addChild:note];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    SKSpriteNode *node = (SKSpriteNode*)obj;
    
    
    if([node.name isEqualToString:@"doneButton"]){
        
        SKAction *move = [SKAction moveToX:-self.frame.size.width*2 duration:0.2];
        [node runAction:move completion:^{
            [mainTransition switchScene:self sceneTwo:@"main" Transition:[SKTransition fadeWithColor:[SKColor blackColor] duration:0.2]];

        }];
    }
    if ([node.name isEqualToString:@"gemButton"]) {
        
        if([fsTimerData getGemTimeLeft] <= 0){
        
        [statsMenuButtons buttonAnimation:node action:[SKAction runBlock:^{
        rewardedGood = @"gem";
            
            [GADRewardBasedVideoAd sharedInstance].delegate = self;
            
            if([[GADRewardBasedVideoAd sharedInstance] isReady]){
                
                [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:(UIViewController*)self.view];
            }
        
            }]];
        }
    }
    if ([node.name isEqualToString:@"miniGemButton"]) {
        
        if([fsTimerData getMiniGemTimeLeft] <= 0){
        
        [statsMenuButtons buttonAnimation:node action:[SKAction runBlock:^{
            rewardedGood = @"miniGems";
            
            [GADRewardBasedVideoAd sharedInstance].delegate = self;
            
            if([[GADRewardBasedVideoAd sharedInstance] isReady]){
                [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:(UIViewController*)self.view];
            }
        
        }]];
        }
    }
    if ([node.name isEqualToString:@"coinsButton"]) {
        
        if([fsTimerData getCoinTimeLeft] <= 0){
        [statsMenuButtons buttonAnimation:node action:[SKAction runBlock:^{
            rewardedGood = @"coin";
            

            [GADRewardBasedVideoAd sharedInstance].delegate = self;
            
            if([[GADRewardBasedVideoAd sharedInstance] isReady]){
                [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:(UIViewController*)self.view];
            }}]];
        }
    }
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
   didRewardUserWithReward:(GADAdReward *)reward {
    NSLog(@"noots?");
}

- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad is received.");
}

- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Opened reward based video ad.");
}

- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad started playing.");
}

- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad is closed.");
    
    GADRequest *rq = [GADRequest request];
    rq.testDevices = @[@"1e69c118ffc7ac17572ce32296f9878fe6d58d46"];
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:rq withAdUnitID:@"ca-app-pub-1801714701929045/4977592815"];
    
    if(rewardedGood != nil){
        
        NSString *goodname;
        
        if([rewardedGood isEqualToString:@"gem"]){
            goodname = @"1x Gem";
            [fsTimerData storeNextGemAdvert];
            [gems addGems:1];
        }
        if([rewardedGood isEqualToString:@"coin"]){
            goodname = @"1000x Coins";
            [fsTimerData storeNextCoinAdvert];
            [money addBalance:1000]; //here we will determine the amount from the players current buidling id/level!
        }
        if([rewardedGood isEqualToString:@"miniGems"]){
            goodname = @"14x MiniGems";
            [fsTimerData storeNextMiniGemAdvert];
            [gems addMiniGems:14];
        }
        
        [messageUI createMessageBox:self.view information:
         [NSString stringWithFormat:@"Thank You for supporting us by watching an advert! Here's your reward! %@", goodname]
                  representingImage:rewardedGood imageScale:0.4 messageBoxID:80 displayOnce:false];
    }
}

- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad will leave application.");
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
    didFailToLoadWithError:(NSError *)error {
    rewardedGood = nil;
    NSLog(@"Reward based video ad failed to load.");
}
-(void)update:(NSTimeInterval)currentTime {
    [timerLabels updateLabels:self];
}
@end
