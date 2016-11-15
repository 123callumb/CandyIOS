//
//  menuBackButton.h
//  Candy
//
//  Created by Callum Beckwith on 13/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface menuBackButton : SKSpriteNode
+(void)createButton:(SKScene*)s;
+(void)removeButton:(SKScene*)s;
+(void)onTouch: (SKNode*)n currentScene:(SKScene*)s;
@end
