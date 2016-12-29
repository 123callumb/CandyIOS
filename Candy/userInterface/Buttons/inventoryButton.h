//
//  inventoryButton.h
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface inventoryButton : SKSpriteNode
+(void)addButton: (SKScene *)s;
+(void)onTouch: (SKNode *)b cs:(SKScene *)s view:(UIView*)v;
@end
