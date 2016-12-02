//
//  coinButton.h
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface coinButton : SKSpriteNode
+(void)addButton: (SKScene *)s;
+(void)touched: (SKNode *)but cs:(SKScene *)s;
+(void)buttonReset: (SKScene*)s;
@end
