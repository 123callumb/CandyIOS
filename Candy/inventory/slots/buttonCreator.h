//
//  buttonCreator.h
//  Candy
//
//  Created by Callum Beckwith on 04/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface buttonCreator : SKSpriteNode
+(void)createSweetButton: (SKSpriteNode*)s text:(NSString*)text buttonName:(NSString*)name position:(CGPoint)pos;
+(void)animateOnPress: (SKSpriteNode*)s scene:(SKScene*)sk;
+(void)addButtons: (SKSpriteNode*)s;
+(void)refreshButtons: (SKSpriteNode*)s;
@end
