//
//  buttonAnimation.h
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface buttonAnimation : SKSpriteNode
+(void)changeState: (SKNode *)button changeName:(NSString *)name originalName:(NSString *)original; 
@end
