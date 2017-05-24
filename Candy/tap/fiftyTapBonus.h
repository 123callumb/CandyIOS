//
//  fiftyTapBonus.h
//  Candy
//
//  Created by Callum Beckwith on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface fiftyTapBonus : SKSpriteNode
+(void)reward:(SKScene*)s;
+(void)onTouchofBonus:(SKSpriteNode*)obj scene:(SKScene*)s;
@end
