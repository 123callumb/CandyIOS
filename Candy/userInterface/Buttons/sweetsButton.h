//
//  sweetsButton.h
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface sweetsButton : SKSpriteNode
+(void)addButton: (SKSpriteNode *)s;
+(void)touched: (SKNode *)but cs:(SKScene *)s; 
@end
