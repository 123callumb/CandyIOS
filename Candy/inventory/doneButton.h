//
//  doneButton.h
//  Candy
//
//  Created by Callum Beckwith on 21/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface doneButton : SKSpriteNode
+(void)createButton: (SKSpriteNode*)s;
+(void)onTouch: (SKNode*)n currentScene:(SKScene*)s;
@end
