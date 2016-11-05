//
//  backgroundManager.m
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "backgroundManager.h"
#import "splashBacking.h"

@implementation backgroundManager

//The point in this class is that everything from the backgrounds is added to a method in here and then the method is ran in the main scene class, it will clean the scene classes up so much!!

//GameScene.m XD
+(void)splashScene: (SKScene *)s {
    [splashBacking main:s];
}

@end
