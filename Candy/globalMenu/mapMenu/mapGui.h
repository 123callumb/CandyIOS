//
//  mapGui.h
//  Candy
//
//  Created by Callum Beckwith on 01/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface mapGui : SKSpriteNode
+(void)addGui: (SKScene*)s;
+(void)onTouchOfBack: (SKScene*)s obj:(SKSpriteNode*)n scene2:(SKScene*)s2;
@end
