//
//  mainTransition.m
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mainTransition.h"
#import "main.h"
#import "Character_Maker.h"
#import "mapScene.h"
#import "sweetShop.h"
#import "packetsScene.h"
#import "coinStoreScene.h"
#import "spinScene.h"
#import "freeItemsScene.h"

//Everytime we want to change scene if we use this method it will make it easier, we can also add certain scene transitions easier this way!

//We can actually use sprites here to create out own custom transition, be pretty cool actually!

//Currently this class is pretty screwed but ill explain how it works :/
@implementation mainTransition {
    main *main;
    Character_Maker *Char_Maker;
    mapScene *mapMain;
    sweetShop *sweetShopUI;
    packetsScene *packetSK;
    coinStoreScene *coinStore;
    spinScene *spinSK;
    freeItemsScene *fsScene;
}

+(void)switchScene: (SKScene *)s1 sceneTwo: (NSString *)scene2 Transition:(SKTransition *)tran{
    
    //Set custom tran
    SKTransition *customTransition = tran;
    SKScene *s2;

    //fixed the transition problem lad
    if([scene2 isEqual:@"main"]){
        s2 = [[main alloc] initWithSize:s1.size];
    }
    else if([scene2 isEqual:@"Character_Maker"]){
        s2 = [[Character_Maker alloc] initWithSize:s1.size];
    }else if([scene2 isEqual:@"mainMap"]){
        s2 = [[mapScene alloc] initWithSize:s1.size];
    }else if([scene2 isEqual:@"sweetShop"]){
        s2 = [[sweetShop alloc] initWithSize:s1.size];
    }else if([scene2 isEqual:@"packetScene"]){
        s2 = [[packetsScene alloc] initWithSize:s1.size];
    }else if([scene2 isEqual:@"coinStore"]){
        s2 = [[coinStoreScene alloc] initWithSize:s1.size];
    }else if([scene2 isEqual:@"dailySpin"]){
        s2 = [[spinScene alloc] initWithSize:s1.size];
    }else if([scene2 isEqual:@"freeItems"]){
        s2 = [[freeItemsScene alloc] initWithSize:s1.size];
    }
    s2.scaleMode = SKSceneScaleModeAspectFill;
    
    //Change the scene
    s2.scaleMode = SKSceneScaleModeAspectFill;
    [s1.view presentScene:s2 transition:customTransition];
}

@end
