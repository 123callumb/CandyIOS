//
//  coinStoreScene.m
//  Candy
//
//  Created by Callum Beckwith on 06/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "coinStoreScene.h"
#import "coinStoreUI.h"
#import "mainTransition.h"
#import "money.h"
#import "gems.h"

@implementation coinStoreScene
-(void)didMoveToView:(SKView *)view {
    
    self.anchorPoint = CGPointMake(0.5, 0.5);
    
    //I decided to just do the sprite sk stuff here as there is only the header that uses it!
    SKSpriteNode *header = [SKSpriteNode spriteNodeWithImageNamed:@"itemStoreHeader"];
    header.size = CGSizeMake(self.frame.size.width, self.frame.size.height/3.3);
    header.position = CGPointMake(0, self.frame.size.height/2 - header.frame.size.height/2);
    [self addChild:header];
    
    //May aswell put the bg view in as a sprite as well cos fook it ;)
    SKSpriteNode *backing = [SKSpriteNode spriteNodeWithImageNamed:@"coinStoreBg"];
    backing.size = CGSizeMake(self.frame.size.width, self.frame.size.height - header.frame.size.height/1.4);
    backing.position = CGPointMake(0, header.frame.origin.y - backing.frame.size.height/2.2);
    backing.zPosition = header.zPosition - 1;
    [self addChild:backing];
    
    [coinStoreUI addCoinStoreUI:self.view];
    
    //Back button
    SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    back.text = @"BACK";
    back.name = @"backText";
    back.fontSize = 75.0f;
    back.fontColor = [SKColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    back.position = CGPointMake(-self.frame.size.width/2 + back.frame.size.width/1.35, header.frame.origin.y + header.frame.size.height/4.5);
    [self addChild:back];
    
    //Money Value
    SKLabelNode *moneyLabel = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    moneyLabel.text = [money getBalanceAsString];
    moneyLabel.name = @"moneyTag";
    moneyLabel.fontSize = 60.0f;
    moneyLabel.fontColor = [SKColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    moneyLabel.position = CGPointMake(- self.frame.size.width/60, header.frame.origin.y + header.frame.size.height/4.5);
    [self addChild:moneyLabel];
    
    //Gem Value
    SKLabelNode *gemLabel = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    gemLabel.text = [gems getGemsAsString];
    gemLabel.name = @"gemTag";
    gemLabel.fontSize = 60.0f;
    gemLabel.fontColor = [SKColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    gemLabel.position = CGPointMake(self.frame.size.width/2.7, header.frame.origin.y + header.frame.size.height/4.5);
    [self addChild:gemLabel];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    if([obj.name isEqualToString:@"backText"]){
        [coinStoreUI removeCoinStore:self.view];
        [mainTransition switchScene:self sceneTwo:@"main" Transition:[SKTransition fadeWithDuration:0.3]];
    }
}
//We should not do this shit in the main class, theres not much running here thats why I did it, I haven't experimented with the update method however logically in my head it will cause lag if it's used to run a lot of methods. This just simply ensures that the sprites are up to date, due to the fact we cannot transfer data across two view controllers - sk and ui :P
-(void)update:(NSTimeInterval)currentTime {
    SKLabelNode *gemLabel = (SKLabelNode*)[self childNodeWithName:@"gemTag"];
    gemLabel.text = [gems getGemsAsString];
    
    SKLabelNode *moneyLabel = (SKLabelNode*)[self childNodeWithName:@"moneyTag"];
    moneyLabel.text = [money getBalanceAsString];

}
@end
