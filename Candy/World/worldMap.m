//
//  worldMap.m
//  Candy
//
//  Created by Callum Beckwith on 15/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "worldMap.h"
#import "buildingData.h"
#import "mapBuildingUI.h"
#import "mapBuildingUI.h"

@implementation worldMap

float strY = 0.0;

+(void)addWorld:(SKScene*)s {
    SKSpriteNode *world = [SKSpriteNode spriteNodeWithImageNamed:@"world"];
    [world setSize:CGSizeMake(s.frame.size.width*1.5, s.frame.size.width*2.8)];
    [world setPosition:CGPointMake(0, 0)];
    [world setName:@"world"];
    
    vector_float2 v[] = {
        (vector_float2){0.0,0.0}, (vector_float2){0.5,0.0}, (vector_float2){1.0,0.0},
        (vector_float2){0.0,0.5}, (vector_float2){0.5,0.5}, (vector_float2){1.0,0.5},
        (vector_float2){0.0,1.0}, (vector_float2){0.5,1.0}, (vector_float2){1.0,1.0}
    };
    
    //[world setWarpGeometry:[SKWarpGeometryGrid gridWithColumns:3 rows:3 sourcePositions:v2 destPositions:v]];
    [buildingData addBuildingsToMap:world];
    
    SKCropNode *worldCrop = [[SKCropNode alloc] init];
    [worldCrop setPosition:CGPointMake(0, -world.frame.size.height/4)];
    worldCrop.maskNode = [[SKSpriteNode alloc] initWithImageNamed:@"worldCropCircle"];
    [worldCrop setName:@"crop"];
    [worldCrop addChild:world];
    [s addChild:worldCrop];
    SKAction *warpWorld = [SKAction warpTo:[SKWarpGeometryGrid gridWithColumns:2 rows:2 sourcePositions:v destPositions:v] duration:4];
    [world runAction:warpWorld];
}

+(void)mapMovement:(UIPanGestureRecognizer*)sender onScene:(SKScene*)s {
    
    if(sender.state == UIGestureRecognizerStateBegan){
        strY = [sender locationOfTouch:0 inView:s.view].y;
        strY = [s.scene convertPointFromView:CGPointMake(0, strY)].y;
    }
    if(sender.state == UIGestureRecognizerStateChanged){
        
        SKSpriteNode *crop = (SKSpriteNode*)[s childNodeWithName:@"crop"];
        SKSpriteNode *world = (SKSpriteNode*)[crop childNodeWithName:@"world"];
        
        float changeY = [sender locationOfTouch:0 inView:s.view].y;
        changeY = [s.scene convertPointFromView:CGPointMake(0, changeY)].y;
        
        float distanceChange = strY - changeY;
        strY = changeY;
        float restriction = world.position.y - distanceChange;
        //NSLog(@"gud memes %f", restriction);
        for(int i = 0; i < 8; i++){
        [world enumerateChildNodesWithName:[NSString stringWithFormat:@"building_%d", i] usingBlock:^(SKNode *node, bool *stop){
            SKSpriteNode *building = (SKSpriteNode*)node;
            float buildingPositionRelativeToView = [s convertPoint:building.position fromNode:[building parent]].y;
            float distanceFromNeg300 = buildingPositionRelativeToView + 100;
            float makePositive = sqrtf(powf(distanceFromNeg300, 2));
            float toNegateFromScale = makePositive*powf(10, -3);
            float newScale = 0.35 - (toNegateFromScale/2);
            [building setScale:newScale];
            //NSLog(@"pos:%f", buildingPositionRelativeToView);
        }];
        }
        
        if(restriction < 900 && restriction > -400){
            [world setPosition:CGPointMake(world.position.x, world.position.y - distanceChange)];
        }
        
    }
}
+(void)onBuldingInteraction:(SKSpriteNode*)building onView:(UIView*)v {

    NSString *buildingName = [building name];

    if([buildingName containsString:@"building_"] && [mapBuildingUI getCurrentMapBuildingID] == -1){
        buildingName = [buildingName stringByReplacingOccurrencesOfString:@"building_" withString:@""];
        int buildingNo = [buildingName intValue];
        [mapBuildingUI openBuildingUIForBuildingWithID:buildingNo forView:v];
    }
}

@end
