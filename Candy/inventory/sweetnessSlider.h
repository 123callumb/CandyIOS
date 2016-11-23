//
//  sweetnessSlider.h
//  Candy
//
//  Created by Callum Beckwith on 23/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface sweetnessSlider : SKSpriteNode
+(void)addSlider: (SKSpriteNode*)s;
+(void)moveSlider:(SKSpriteNode*)s location:(CGPoint)point;
@end
