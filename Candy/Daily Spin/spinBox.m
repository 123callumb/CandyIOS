//
//  spinBox.m
//  Candy
//
//  Created by Callum Beckwith on 14/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "spinBox.h"
#import "spinScene.h"
#import "mainTransition.h"
#import "money.h"
#import "gems.h"
#import "spinData.h"
#import "spinWheel.h"
#import "spinStreak.h"
#import "messageUI.h"
#import "mainTransition.h"
#import "sparks.h"
@implementation spinBox

int paneCount;
NSMutableArray *prizes;

+(void)beginBoxSpinning:(SKScene*)s {
    
    [spinScene spinTaken];
    
    int spinAmount = [self randomNumberBetween:30 maxNumber:paneCount-12-5];
    int spinSlowAmount = [self randomNumberBetween:4 maxNumber:12];
    int spinStopAmount = [self randomNumberBetween:4 maxNumber:5];
    
    SKSpriteNode *pane = (SKSpriteNode*)[s childNodeWithName:@"pane"];
    SKAction *moveBy = [SKAction moveByX:0 y:(-pane.frame.size.height * spinAmount) duration:5];
    SKAction *moveSlow = [SKAction moveByX:0 y:(-pane.frame.size.height * spinSlowAmount) duration:2.5];
    SKAction *moveStop = [SKAction moveByX:0 y:(-pane.frame.size.height * spinStopAmount) duration:2];
    SKAction *spin = [SKAction sequence:@[moveBy, moveSlow, moveStop]];
    
    [spinData setCurrentDate];
    [spinData addStreak];
    
    [pane runAction:spin completion:^{
        //Log Prize
        NSString *prizeSring = [prizes objectAtIndex:spinAmount+ spinSlowAmount+ spinStopAmount+1];
        
        NSLog(@"%@", prizeSring);
        //Show reward Here
        [sparks createSpriteSplosion:s nodeAmount:50 pos:CGPointZero];
        [spinStreak createRewardPane:s prize:prizeSring];
    }];


}
+(void)addRandomPRizePane:(SKScene*)s {
    paneCount = [self randomNumberBetween:50 maxNumber:70];
    
    SKSpriteNode *pane = [SKSpriteNode spriteNodeWithImageNamed:@"prizeBacking"];
    [pane setScale:0.55];
    pane.position = CGPointMake(0, -s.frame.size.height/3);
    pane.name = @"pane";
    [prizes addObject:@"null"];
    prizes = [[NSMutableArray alloc] init];
    
    for(int i = 1; i <= paneCount; i++){
        SKSpriteNode *paneItem = [SKSpriteNode spriteNodeWithImageNamed:@"prizeBacking"];
        paneItem.position = CGPointMake(0, -s.frame.size.height/3 + (paneItem.frame.size.height * i) +s.frame.size.height/5.3 );
        
        int itemDecider = [self randomNumberBetween:0 maxNumber:2];
        NSString *itemTexture = [[self prizeData] objectAtIndex:itemDecider];
        [prizes addObject:itemTexture];
        
        SKSpriteNode *prize = [SKSpriteNode spriteNodeWithImageNamed:itemTexture];
        [paneItem addChild:prize];
        
        [pane addChild:paneItem];
    }
    
    [s addChild:pane];
}

+(NSArray*)prizeData {
    NSArray *items = [NSArray arrayWithObjects:@"coin", @"gem", @"miniGems", nil];
    
    return items;
}
+(int)randomNumberBetween:(int)min maxNumber:(int)max
{
    return (int)(min + arc4random_uniform(max - min + 1));
}
@end
