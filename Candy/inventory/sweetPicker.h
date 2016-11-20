//
//  sweetPicker.h
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface sweetPicker : SKSpriteNode
+(void)addSweetPicker: (SKSpriteNode*)s;
+(void)onArrowPress: (SKSpriteNode*)obj scene:(SKScene*)s;
+(int)getSweetNum;
@end
