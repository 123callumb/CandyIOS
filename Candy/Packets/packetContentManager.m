//
//  packetContentManager.m
//  Candy
//
//  Created by Callum Beckwith on 18/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetContentManager.h"
#import "skPacketOpener.h"
#import "inventoryDataHandler.h"

@implementation packetContentManager

+(void)createContentPane: (SKSpriteNode*)s contentList:(NSArray*)contentArray {
    for (int i = 0; i <= ([contentArray count]-1); i++) {
        SKSpriteNode *contentItem =
        [self createPacketItem:[contentArray objectAtIndex:i]
              pos:[self setPositionOnPane:s contentID:i]];
        [s addChild:contentItem];
    }
}

+(id)createPacketItem: (NSString*)textureName pos:(CGPoint)pos{
    SKSpriteNode *content = [SKSpriteNode spriteNodeWithImageNamed:textureName];
    content.zPosition = 6;
    content.position = pos;
    content.xScale = 0.8;
    content.yScale = 0.8;
    return content;
}

+(SKSpriteNode*)createRandomPacketItem:(CGPoint)p itemList:(NSArray*)packetItems {
    
    int greyProb = 60/3;
    int blueProb = 20/3;
    int redProb = 18/2;
    int yellowProb = 2;
    
    NSMutableArray *contentlist = [[NSMutableArray alloc] init];
    
    for(int p = 0; p <= 2; p++){
        for(int i = 0; i <= greyProb; i++){
            [contentlist addObject:[packetItems objectAtIndex:p]];
        }
    }
    
    for(int p = 3; p <= 5; p++){
        for(int i = 0; i <= blueProb; i++){
            [contentlist addObject:[packetItems objectAtIndex:p]];
        }
    }
    
    if ([packetItems count] > 6) {
        for(int p = 6; p <= 7; p++){
            for(int i = 0; i <= redProb; i++){
                [contentlist addObject:[packetItems objectAtIndex:p]];
            }
        }
        for(int p = 8; p <= 8; p++){
            for(int i = 0; i <= yellowProb; i++){
                [contentlist addObject:[packetItems objectAtIndex:p]];
            }
        }
    }

    
    NSUInteger randNum = arc4random() % ([contentlist count]);
    NSString *randomContent = [contentlist objectAtIndex:randNum];
    SKSpriteNode *item = [self createPacketItem:randomContent pos:p];
    item.zPosition = 10;
    item.name = randomContent;
    return item;
}

+(CGPoint)setPositionOnPane: (SKSpriteNode*)s contentID:(int)cID {
    
    float x = 0.0;
    float y = 0.0;
    float yAdj = s.frame.size.height/24;
    
    if(cID == 0 || cID == 3 || cID == 6){
        x = -s.frame.size.width/1.5;
    }
    if(cID == 1 || cID == 4 || cID == 7) {
        x = 0;
    }
    if(cID == 2 || cID == 5 || cID == 8){
        x = s.frame.size.width/1.5;
    }
    
    if(cID <= 2){
        y = s.frame.size.height/2.5 + yAdj;
    }
    if(cID >= 3 && cID <= 5){
        y = 0 + yAdj;
    }
    if(cID >= 6 && cID <= 8){
        y = -s.frame.size.height/2.5 + yAdj;
    }
    
    return CGPointMake(x, y);
}
+(void)createSlider: (SKScene*)s yPos:(float)yVal sweetList:(NSArray*)contentList {
    SKSpriteNode *c1 = [packetContentManager createRandomPacketItem:CGPointMake(0, 0) itemList:contentList];
    
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
        
        CGPoint positionXY = CGPointMake((-s.frame.size.width/2)+xPos, yVal);
        SKSpriteNode *packetItem = [self createRandomPacketItem:positionXY itemList:contentList];
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
                    [inventoryDataHandler addSweet:unboxedItem.name];
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
