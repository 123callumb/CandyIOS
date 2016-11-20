//
//  registerBoxes.h
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface registerBoxes : SKSpriteNode
+(void)registerBoxes:(SKNode *)obj currentScene:(SKScene *)s;
+(int)getSlotPressed;
+(void)setSlotPressed: (int)num;
@end
