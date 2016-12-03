//
//  buildingGui.m
//  Candy
//
//  Created by Callum Beckwith on 03/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "buildingGui.h"

@implementation buildingGui
bool guiEnabled = false;
+(void)createMenu: (SKSpriteNode*)n {
    SKSpriteNode *buildingGui = [SKSpriteNode spriteNodeWithImageNamed:@"mapGuiBoxSmall"];
    buildingGui.position = CGPointMake(n.frame.size.width * 2, 0);
    buildingGui.xScale = 0;
    buildingGui.yScale = 0;
    [n addChild:buildingGui];
    SKAction *grow = [SKAction scaleTo:1.5 duration:0.2];
    [buildingGui runAction:grow];
}
+(void)createOnTouch: (SKSpriteNode*)n buildingName:(NSString*)nodeName {
    if([n.name isEqualToString:nodeName]){
        SKAction *scaleDown  = [SKAction scaleBy:0.8 duration:0.1];
        SKAction *scaleUp = [SKAction scaleBy:1.25 duration:0.1];
        SKAction *sequence = [SKAction sequence:@[scaleDown, scaleUp]];
        [n runAction:sequence];
        [self createMenu:n];
        guiEnabled = true;
    }
}
@end
