//
//  world.m
//  Candy
//
//  Created by Callum Beckwith on 07/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "world.h"
#import "coinBarSprite.h"
#import "menuUIButtons.h"
#import "menuUI.h"
#import "menuHandler.h"
#import "mainUI.h"
#import "bannerBonusUI.h"
#import "buttonHandler.h"
#import "worldMap.h"

@implementation world

-(void)didMoveToView:(SKView *)view {
    [self setAnchorPoint:CGPointMake(0.5, 0.5)];
    
    //Something important to note if the gestures are not removed then they will remain in the next scene becuase it listens on the view not the scene
    
    //Add Gesture Rec - Is there a way to add this directly to the map node if I turn it into an object? I dont think soooooo
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    longPress.minimumPressDuration = 0.4;
    [[self view] addGestureRecognizer:longPress];
    
    UIPanGestureRecognizer *panRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [[self view] addGestureRecognizer:panRec];
    
    //Add ui stuff
    [menuHandler refreshMenuSystem:self];
    [mainUI drawUI:self];
    [bannerBonusUI addBonusBanner:self.view];
    
    //Add level stuff
    [self addBacking];
    [worldMap addWorld:self];
}

//Should I be placing this elsewhere kinda feels ugly here
-(void)addBacking {
    SKSpriteNode *spaceBacking = [SKSpriteNode spriteNodeWithImageNamed:@"sky"];
    [spaceBacking setSize:CGSizeMake(self.frame.size.height/1.2, -self.frame.size.height)];
    [self addChild:spaceBacking];
}

-(void)onPan:(UIPanGestureRecognizer*)sender {
    
    //Does stry have to be global tho?
    [worldMap mapMovement:sender onScene:self];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];

    [buttonHandler registerButtons:obj currentScene:self view:self.view];
    //[upgradeMenu onTouch:obj scene:self];
}
-(void)update:(CFTimeInterval)currentTime {
    //God i really hope this doesn't cause lag
    [coinBarSprite updateText:self];
    [menuUIButtons menuUpdateChecker:self view:self.view];
}
-(void)onLongPress: (UILongPressGestureRecognizer*)longPress {\
    
    CGPoint touchLocation = [longPress.self locationOfTouch:0 inView:longPress.view];
    CGPoint objLoc = [[self.scene view] convertPoint:touchLocation toScene:self.scene];
    SKNode *obj = [self nodeAtPoint:objLoc];
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [worldMap onBuldingInteraction:(SKSpriteNode*)obj onView:self.view];
    }
    
}

@end
