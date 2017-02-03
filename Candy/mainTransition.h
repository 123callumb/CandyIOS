//
//  mainTransition.h
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface mainTransition : SKSpriteNode
+(void)switchScene: (SKScene *)s1 sceneTwo: (NSString *)scene2 Transition:(SKTransition *)tran;
+(void)switchForUIViews: (SKView*)s1 sceneTwo:(NSString *)scene2 Transition:(SKTransition *)tran;
@end
