//
//  flavourPicker.h
//  Candy
//
//  Created by Callum Beckwith on 22/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface flavourPicker : SKSpriteNode
+(void)addFlavourPicker: (SKSpriteNode*)s;
+(void)onArrowPress: (SKSpriteNode*)obj scene:(SKScene*)s;
+(NSString*)determineFlavourString: (int)flavourID;
+(int)getFlavourPicked;
+(void)resetFlavour;
@end
