//
//  mainTransition.m
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mainTransition.h"
#import "main.h"

//Everytime we want to change scene if we use this method it will make it easier, we can also add certain scene transitions easier this way!

//We can actually use sprites here to create out own custom transition, be pretty cool actually!

//Currently this class is pretty screwed but ill explain how it works :/
@implementation mainTransition {
    main *main;
}

+(void)switchScene: (SKScene *)s1 sceneTwo: (SKScene *)s2 Transition:(SKTransition *)tran sceneID:(int)id; {
    
    //Set custom tran
    SKTransition *customTransition = tran;
    
    //This is the ugly bit, it needs to be this way because you can't import classes through a method
    if(id==0){
        
        //That \/ lil bitch rn there is our problem
        s2 = [[main alloc] initWithSize:s1.size];
        s2.scaleMode = SKSceneScaleModeAspectFill;
    }
    
    
    //Change the scene
    s2.scaleMode = SKSceneScaleModeAspectFill;
    [s1.view presentScene:s2 transition:customTransition];
}

@end
