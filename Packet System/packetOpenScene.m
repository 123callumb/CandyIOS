//
//  packetOpenScene.m
//  Candy
//
//  Created by Callum Beckwith on 02/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "packetOpenScene.h"
#import "packetBacking.h"
#import "packetInventoryData.h"
#import "myPacketsScene.h"
#import "sparks.h"
#import "lollyPacket.h"
#import "bonbonPacket.h"
#import "wrappedPacket.h"
#import "chewPacket.h"
#import "jawbreakerPacket.h"
#import "inventoryDataHandler.h"
#import "mainTransition.h"
#import "candybarPacket.h"
#import "pencilPacket.h"
#import "marshmallowPacket.h"
#import "eggPacket.h"

@implementation packetOpenScene

int prob;
int tapCounter = 0;
bool sceneChange = false;

-(void)didMoveToView:(SKView *)view {
    [self setAnchorPoint:CGPointMake(0.5, 0.5)];
    [packetBacking addOpenerBacking:self];
    [self createSweetPacket:self];
    prob = [self returnRarity];
    [self setBackgroundColor:[UIColor blackColor]];
}
-(void)createSweetPacket: (SKScene*)s {
    SKSpriteNode *sweetPacket = [SKSpriteNode spriteNodeWithImageNamed:[packetInventoryData getPacketAtSlot:[myPacketsScene getCurrentPacket]]];
    sweetPacket.name = @"sweetPacket";
    sweetPacket.zPosition = 5;
    
    SKSpriteNode *shadow = [SKSpriteNode spriteNodeWithImageNamed:@"packetShadow"];
    shadow.xScale = 0.4;
    shadow.yScale = 0.4;
    shadow.position = CGPointMake(0, -sweetPacket.frame.size.height/2.4);
    shadow.name = @"packetShadow";
    
    //[s addChild:shadow];
    [s addChild:sweetPacket];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    if(sceneChange){
        tapCounter = 0;
        sceneChange = false;
        [mainTransition switchScene:self sceneTwo:@"myPackets" Transition:[SKTransition crossFadeWithDuration:0.4]];
    }
    
    if([obj.name isEqualToString:@"sweetPacket"]){

        [self packetInteraction:(SKSpriteNode*)obj posOfTouch:loc];
    }

    
}
-(void)packetInteraction: (SKSpriteNode*)node posOfTouch:(CGPoint)pos {
    
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.15];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.15];
    SKAction *seqSG = [SKAction sequence:@[shrink, grow]];
    
    NSString *prizeItem;
    
    [node runAction:seqSG];
    
    [sparks createSpriteSplosion:self nodeAmount:10 pos:pos];
    [self spawnPacketItems:[packetInventoryData getPacketAtSlot:[myPacketsScene getCurrentPacket]]];

    if(prob == tapCounter){
        if (prob == 0) {
            prizeItem = [self didReceiveGreyItem:[packetInventoryData getPacketAtSlot:[myPacketsScene getCurrentPacket]]];
            [packetInventoryData removeFullSlot:[myPacketsScene getCurrentPacket]];
        }
        if (prob == 1) {
            prizeItem = [self didReceiveBlueItem:[packetInventoryData getPacketAtSlot:[myPacketsScene getCurrentPacket]]];
            [packetInventoryData removeFullSlot:[myPacketsScene getCurrentPacket]];
        }
        if (prob == 2) {
            prizeItem = [self didReceiveRedItem:[packetInventoryData getPacketAtSlot:[myPacketsScene getCurrentPacket]]];
            [packetInventoryData removeFullSlot:[myPacketsScene getCurrentPacket]];
        }
        if (prob == 3) {
            prizeItem = [self didReceiveYellowItem:[packetInventoryData getPacketAtSlot:[myPacketsScene getCurrentPacket]]];
            [packetInventoryData removeFullSlot:[myPacketsScene getCurrentPacket]];
        }
        
        SKSpriteNode *openedItem = [SKSpriteNode spriteNodeWithImageNamed:prizeItem];
        openedItem.xScale = 0.1;
        openedItem.yScale = 0.1;
        [self addChild:openedItem];
        
        SKAction *growIntoScene = [SKAction scaleTo:1 duration:0.4];
        [openedItem runAction:growIntoScene];
        
        [node removeFromParent];
        [inventoryDataHandler addSweet:prizeItem];
        [sparks createSpriteSplosion:self nodeAmount:70 pos:openedItem.position];
        
        SKAction *waitFor = [SKAction waitForDuration:1];
        
        [packetBacking addCongrats:self];
        
        [self runAction:waitFor completion:^{
            sceneChange = true;
        }];
        
    }else{
        tapCounter++;
    }
}
-(int)returnRarity {
    int upperBound = 100;
    int lowerBound = 0;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    NSLog(@"no from probability = %d", rndValue);
    
    if(rndValue >= 60 && rndValue < 85){
        return 1;
    }
    if (rndValue >= 85 && rndValue < 98) {
        return 2;
    }
    if (rndValue >= 98 && rndValue <= 100) {
        return 3;
    }
    
    else return 0;
 
}
-(NSString*)didReceiveGreyItem:(NSString*)packetType {
    int upperBound = 3;
    int lowerBound = 1;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);


    if(rndValue == 1){

        return [self returnItemFromPacket:packetType number:0];
    }
    if(rndValue == 2){

        return [self returnItemFromPacket:packetType number:1];
    }
    if(rndValue == 3){

        return [self returnItemFromPacket:packetType number:2];
    }
    
    else return nil;
}
-(NSString*)didReceiveBlueItem:(NSString*)packetType {
    int upperBound = 3;
    int lowerBound = 1;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);

    if(rndValue == 1){
        return [self returnItemFromPacket:packetType number:3];
    }
    if(rndValue == 2){
        return [self returnItemFromPacket:packetType number:4];
    }
    if(rndValue == 3){
        return [self returnItemFromPacket:packetType number:5];
    }
    
    else return nil;
}
-(NSString*)didReceiveRedItem:(NSString*)packetType {
    int upperBound = 2;
    int lowerBound = 1;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);


    if(rndValue == 1){

        return [self returnItemFromPacket:packetType number:6];
    }
    if(rndValue == 2){

        return [self returnItemFromPacket:packetType number:7];
    }
    else return nil;
}
-(NSString*)didReceiveYellowItem:(NSString*)packetType {
    return [self returnItemFromPacket:packetType number:8];
}
-(NSString*)returnItemFromPacket: (NSString*)packetType number:(int)num {
    if([packetType isEqualToString:@"bonbonPacket"]){
        return [[bonbonPacket contentList] objectAtIndex:num];
    }
    if([packetType isEqualToString:@"lollyPacket"]){
        return [[lollyPacket contentList] objectAtIndex:num];
    }
    if([packetType isEqualToString:@"sweetPacket"]){
        return [[wrappedPacket contentList] objectAtIndex:num];
    }
    if([packetType isEqualToString:@"chewPacket"]){
        return [[chewPacket contentList] objectAtIndex:num];
    }
    if([packetType isEqualToString:@"jawbreakerPacket"]){
        return [[jawbreakerPacket contentList] objectAtIndex:num];
    }
    if([packetType isEqualToString:@"candybarPacket"]){
        return [[candybarPacket contentList] objectAtIndex:num];
    }
    if([packetType isEqualToString:@"marshmallowPacket"]){
        return [[marshmallowPacket contentList] objectAtIndex:num];
    }
    if([packetType isEqualToString:@"pencilPacket"]){
        return [[pencilPacket contentList] objectAtIndex:num];
    }
    if([packetType isEqualToString:@"eggPacket"]){
        return [[eggPacket contentList] objectAtIndex:num];
    }
    return nil;
}
-(void)spawnPacketItems: (NSString*)packetName {
    
        for(int i = 0; i <= 3; i++){
    
    int upperBound = 8;
    int lowerBound = 0;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);

    if([packetName isEqualToString:@"bonbonPacket"]){
        [self itemSpawner:[[bonbonPacket contentList] objectAtIndex:rndValue]
         ];
    }
    if([packetName isEqualToString:@"lollyPacket"]){
        [self itemSpawner:[[lollyPacket contentList] objectAtIndex:rndValue]
         ];
    }
    if([packetName isEqualToString:@"sweetPacket"]){
        [self itemSpawner:[[wrappedPacket contentList] objectAtIndex:rndValue]
         ];
    }
    if([packetName isEqualToString:@"chewPacket"]){
        [self itemSpawner:[[chewPacket contentList] objectAtIndex:rndValue]
         ];
    }
    if([packetName isEqualToString:@"jawbreakerPacket"]){
        [self itemSpawner:[[jawbreakerPacket contentList] objectAtIndex:rndValue]
         ];
    }
    if([packetName isEqualToString:@"candybarPacket"]){
                [self itemSpawner:[[candybarPacket contentList] objectAtIndex:rndValue]
                 ];
            }
    if([packetName isEqualToString:@"marshmallowPacket"]){
                [self itemSpawner:[[marshmallowPacket contentList] objectAtIndex:rndValue]
                 ];
            }
    if([packetName isEqualToString:@"pencilPacket"]){
                [self itemSpawner:[[pencilPacket contentList] objectAtIndex:rndValue]
                 ];
            }
    if([packetName isEqualToString:@"eggPacket"]){
                [self itemSpawner:[[eggPacket contentList] objectAtIndex:rndValue]
                 ];
            }
        }
    
}
-(void)itemSpawner: (NSString*)tex1 {

    SKSpriteNode *item1 = [SKSpriteNode spriteNodeWithImageNamed:tex1];
    
    item1.xScale = 0.3;
    item1.yScale = 0.3;

    
    item1.physicsBody = [SKPhysicsBody bodyWithTexture:[item1 texture] size:item1.size];
    item1.physicsBody.dynamic = true;
    item1.physicsBody.collisionBitMask = 1;
    
    [self addChild:item1];

    
    int lowerBound = -600;
    int upperBound = 600;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    SKAction *lauch = [SKAction applyImpulse:CGVectorMake(rndValue, 1000) duration:0.4];
    
    [item1 runAction:lauch];

}
@end
