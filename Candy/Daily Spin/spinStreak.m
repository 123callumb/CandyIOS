//
//  spinStreak.m
//  Candy
//
//  Created by Callum Beckwith on 29/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "spinStreak.h"
#import "money.h"
#import "gems.h"
#import "spinData.h"



@implementation spinStreak
//This would be so much better if it was a 2dimensional array
+(void)createRewardPane: (SKScene*)s prize:(NSString*)prizeTexture {
    SKSpriteNode *backingPane = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(s.frame.size.width, s.frame.size.height)];
    backingPane.alpha = 0.0;
    SKAction *fadeIn = [SKAction fadeAlphaTo:0.75 duration:0.3];
    [s addChild:backingPane];
    [backingPane runAction:fadeIn];
    
    SKSpriteNode *rewardPane = [SKSpriteNode spriteNodeWithImageNamed:@"rewardBox"];
    [rewardPane setScale:0.5];
    rewardPane.position = CGPointMake(-s.frame.size.width, 0);
    
    SKLabelNode *bonusText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    bonusText.text = [self determineSpinStreakPrize];
    bonusText.fontSize = 120.0f;
    bonusText.position = CGPointMake(-rewardPane.frame.size.width/3, rewardPane.frame.size.height/1.5);
    bonusText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    bonusText.fontColor = [UIColor blackColor];
    
    SKLabelNode *streakLabel = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    streakLabel.text = [NSString stringWithFormat:@"%d", [spinData getStreakValue]];
    streakLabel.fontSize = 200.0f;
    streakLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    streakLabel.position = CGPointMake(rewardPane.frame.size.width/1.75, -rewardPane.frame.size.height/2.3);
    streakLabel.fontColor = [UIColor blackColor];

    SKSpriteNode *prize = [SKSpriteNode spriteNodeWithImageNamed:prizeTexture];
    prize.position = CGPointMake(-rewardPane.frame.size.width/2.7, -rewardPane.frame.size.height/5);
    [rewardPane addChild:prize];
    
    [rewardPane addChild:bonusText];
    [rewardPane addChild:streakLabel];
    [s addChild:rewardPane];
    
    [self givePrize:prizeTexture scene:s];
    
    SKAction *moveToCenter = [SKAction moveTo:CGPointZero duration:0.8];
    [rewardPane runAction:moveToCenter completion:^{
        rewardPane.name = @"rewardPane";
    }];
    
}


+(NSString*)determineSpinStreakPrize {

    if([spinData getStreakValue] == 1){
        [gems addMiniGems:5];
        return @"x5 Mini Gems";
    }
    if([spinData getStreakValue] == 2){
        [gems addMiniGems:10];
        return @"x10 Mini Gems";
    }
    if([spinData getStreakValue] == 3){
        [gems addGems:1];
        return @"x1 Gem";
    }
    if([spinData getStreakValue] == 4){
        [gems addMiniGems:15];
        return @"x15 Mini Gems";
    }
    if([spinData getStreakValue] == 5){
        [gems addGems:2];
        return @"x2 Gems";
    }
    if([spinData getStreakValue] == 6){
        [gems addMiniGems:17];
        return @"x17 Mini Gems";
    }
    if([spinData getStreakValue] == 7){
        [gems addMiniGems:20];
        return @"x20 Mini Gems";
    }
    if([spinData getStreakValue] == 8){
        [gems addGems:2];
        return @"x2 Gem";
    }
    if([spinData getStreakValue] == 9){
        [gems addMiniGems:25];
        return @"x25 Mini Gems";
    }
    if([spinData getStreakValue] == 10){
        [gems addGems:4];
        return @"x4 Gems";
    }
    if([spinData getStreakValue] == 11){
        [gems addMiniGems:27];
        return @"x27 Mini Gems";
    }
    if([spinData getStreakValue] == 12){
        [gems addMiniGems:30];
        return @"x30 Mini Gems";
    }
    if([spinData getStreakValue] == 13){
        [gems addGems:4];
        return @"x4 Gem";
    }
    if([spinData getStreakValue] == 14){
        [gems addMiniGems:35];
        return @"x35 Mini Gems";
    }
    if([spinData getStreakValue] == 15){
        [gems addGems:5];
        return @"x5 Gems";
    }
    if([spinData getStreakValue] == 16){
        [gems addMiniGems:37];
        return @"x37 Mini Gems";
    }
    if([spinData getStreakValue] == 17){
        [gems addMiniGems:40];
        return @"x40 Mini Gems";
    }
    if([spinData getStreakValue] == 18){
        [gems addGems:6];
        return @"x6 Gem";
    }
    if([spinData getStreakValue] == 19){
        [gems addMiniGems:45];
        return @"x10 Mini Gems";
    }
    if([spinData getStreakValue] >= 20){
        [gems addGems:8];
        return @"x8 Gems";
    }
    return @"No Bonus :( You don't have a Daily Spin Streak!";
}

+(void)givePrize:(NSString*)prize scene:(SKScene*)s{
    
    SKLabelNode *rewardText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    rewardText.fontSize = 100.0f;
    rewardText.position = CGPointMake(0, s.frame.size.height/4);
    rewardText.fontColor = [UIColor blackColor];

    NSString *displayedAmount;
    
    if([prize isEqualToString:@"gem"]){
        [gems addGems:1];
        displayedAmount = @"+1 Gem!";
    }
    if([prize isEqualToString:@"miniGems"]){
        [gems addMiniGems:14];
        displayedAmount = @"+14 Mini Gems!";
    }
    if([prize isEqualToString:@"coin"]){
        [money addBalance:20000 * ([spinData getStreakValue] + 1)];
        displayedAmount = [NSString stringWithFormat:@"+ %d Coins!", 20000 * ([spinData getStreakValue] + 1)];
    }

    rewardText.text = displayedAmount;
    [s addChild:rewardText];
}
@end
