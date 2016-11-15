//
//  combo.h
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface combo : SKNode
+(void)comboDecider:(SKScene *)s;
+(void)addCombo: (float)x;
+(float)getCombo;
+(void)resetCombo: (SKScene*)s;
+(NSString *)getComboAsString;
@end
