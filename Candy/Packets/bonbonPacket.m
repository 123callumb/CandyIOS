//
//  bonbonPacket.m
//  Candy
//
//  Created by Callum Beckwith on 15/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "bonbonPacket.h"
#import "skPacketOpener.h"

@implementation bonbonPacket
+(void)addContentSection: (SKSpriteNode*)s {
    
    float x1 = -s.frame.size.width/1.5;
    float x2 = 0;
    float x3 = s.frame.size.width/1.5;
    
    float y1 = s.frame.size.height/1.5;
    float y2 = 0;
   //float y3 = -s.frame.size.height/1.5;
    
    SKSpriteNode *c1 = [self
                        createPacketItem:@"cokebonbonPacket"
                        pos:CGPointMake(x1, y1)];
    
    SKSpriteNode *c2 = [self
                        createPacketItem:@"mintbonbonPacket"
                        pos:CGPointMake(x2, y1)];
    
    SKSpriteNode *c3 = [self
                        createPacketItem:@"strawberrybonbonPacket"
                        pos:CGPointMake(x3, y1)];
    
    SKSpriteNode *c4 = [self
                        createPacketItem:@"bubblegumbonbonPacket"
                        pos:CGPointMake(x1, y2)];
    
    SKSpriteNode *c5 = [self
                        createPacketItem:@"cherrybonbonPacket"
                        pos:CGPointMake(x2, y2)];
    
    SKSpriteNode *c6 = [self
                        createPacketItem:@"rainbowBonBonPacket"
                        pos:CGPointMake(x3, y2)];
    
    [s addChild:c1];
    [s addChild:c2];
    [s addChild:c3];
    [s addChild:c4];
    [s addChild:c5];
    [s addChild:c6];
}
+(id)createPacketItem: (NSString*)textureName pos:(CGPoint)pos{
    SKSpriteNode *content = [SKSpriteNode spriteNodeWithImageNamed:textureName];
    content.position = pos;
    return content;
}
+(id)createRandom: (SKScene*)s pos:(CGPoint)pox {
    
    NSArray *contentlist =[NSArray arrayWithObjects:
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"cokebonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"mintbonbonPacket",
                           @"strawberrybonbonPacket",
                           @"strawberrybonbonPacket",
                           @"strawberrybonbonPacket",
                           @"bubblegumbonbonPacket",
                           @"bubblegumbonbonPacket",
                           @"bubblegumbonbonPacket",
                           @"cherrybonbonPacket",
                           @"cherrybonbonPacket",
                           @"rainbowBonBonPacket",
                           nil];
    
    NSUInteger randNum = arc4random() % [contentlist count];
    NSString *randomContent = [contentlist objectAtIndex:randNum];
    SKSpriteNode *item = [self createPacketItem:randomContent pos:pox];
    item.zPosition = 10;
    item.name = randomContent;
    return item;
}
+(void)createRandomSlider: (SKScene*)s yPos:(float)yVal {
    SKSpriteNode *c1 = [self
                        createPacketItem:@"cokebonbonPacket"
                        pos:CGPointMake(0, 0)];
    
    c1.xScale = 0.86;
    c1.yScale = 0.86;
    
    float packetWidth = c1.frame.size.width;
    float duration = 0.2;
    
    float lowerBoundX = -packetWidth/8;
    float upperBoundX = packetWidth/8;
    float rndValueX = (((float) arc4random() / RAND_MAX) * (upperBoundX - lowerBoundX)) + lowerBoundX;
    float rnd = rndValueX;
    
    for(int i = 1; i <= 40; i++){
        
        float xPos = (packetWidth * i)/2;

        SKSpriteNode *packetItem =
        [self createRandom:s pos:CGPointMake((-s.frame.size.width/2)+xPos, yVal)];
        packetItem.xScale = 0.43;
        packetItem.yScale = 0.43;
        
        [s addChild:packetItem];
        
        
        if(i < 35){
           SKAction *slide = [SKAction moveByX:-packetItem.frame.size.width*i y:0 duration:duration*i];
            [packetItem runAction:slide completion:^{
                
                [packetItem removeFromParent];
                
            }];
        }
        
        if(i > 35){

            
            float finalX = 0.0;
            
            duration = 6.75;
            
            if(i == 36){
                finalX = -packetItem.frame.size.width*2;
            }
            if(i == 37){
                finalX = -packetItem.frame.size.width;
            }
            if(i == 38){
                finalX = 0;
            }
            if(i == 39){
                finalX = packetItem.frame.size.width;
            }
            if(i == 40){
                finalX = packetItem.frame.size.width*2 ;
            }
            
            SKAction *slide = [SKAction moveToX:finalX+rnd duration:duration];
            [packetItem runAction:slide completion:^{
            
                if(i == 38){
                SKSpriteNode *unboxedItem = (SKSpriteNode*)[s nodeAtPoint:CGPointMake(0, s.frame.size.height/4.84)];
                
                
                    [skPacketOpener setOpenedItem:[NSString stringWithFormat:@"%@", unboxedItem.name]];
                    [skPacketOpener openedSweet:s];
                   
                }
                SKAction *wait = [SKAction waitForDuration:1.75];
                [s runAction:wait completion:^{
                    [packetItem removeFromParent];
                }];
            }];

            

        }
        
    }
}
@end
