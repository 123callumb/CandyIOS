//
//  skPacketOpener.h
//  Candy
//
//  Created by Callum Beckwith on 13/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface skPacketOpener : SKSpriteNode
+(void)addOpenerButton: (SKScene*)s;
+(void)onOpenPress: (SKNode*)n scene:(SKScene*)s view:(UIView*)v;
+(void)openedSweet: (SKScene*)s;
+(void)setOpenedItem: (NSString*)n;
@end
