//
//  mainTransition.h
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface mainTransition : SKSpriteNode
+(void)switchScene: (SKScene *)s1 sceneTwo: (SKScene *)s2 Transition:(SKTransition *)tran sceneID:(int)id;
@end
