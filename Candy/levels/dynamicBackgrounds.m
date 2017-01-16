//
//  dynamicBackgrounds.m
//  Candy
//
//  Created by Callum Beckwith on 06/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "dynamicBackgrounds.h"
#import "buildingType.h"

@implementation dynamicBackgrounds
+(void)addDynamicBackground: (SKScene*)s {
    [self addSky:s];
    [self addCurrentBackdrop:s];
}
+(void)addCurrentBackdrop: (SKScene*)s {
    
    NSString *backdropTextureName;
    
    if([buildingType getCurrentBuildingID] == 0){
        backdropTextureName = @"estateBackdrop";
    }else {
        backdropTextureName = @"estateBackdrop"; //catch exception for now!
    }
    
    SKSpriteNode *backdrop = [SKSpriteNode spriteNodeWithImageNamed:backdropTextureName];
    backdrop.size = CGSizeMake(s.frame.size.width, s.frame.size.height/5.5);
    backdrop.position = CGPointMake(0, s.frame.size.height/3.5);
    backdrop.zPosition = -6;
    [s addChild:backdrop];
}
//For having a day and night cycle just overlay the night time sprite with the day time and increase the opacity over time while moving the sun and moon sprites, may aswell do this after the main functions of the game are in because its is just astetically pleasing!
+(void)addSky: (SKScene*)s {
    SKSpriteNode *dayTime = [SKSpriteNode spriteNodeWithImageNamed:@"daySky"];
    dayTime.size = CGSizeMake(s.frame.size.width, s.frame.size.height/2.5);
    dayTime.position = CGPointMake(0, s.frame.size.height/2 - dayTime.frame.size.height/2);
    dayTime.zPosition = -7;
    [s addChild:dayTime];
}
+(void)addClouds: (SKScene*)s {

}
+(void)addSunAndMoon {

}
@end
