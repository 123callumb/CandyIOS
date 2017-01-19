//
//  spinBox.h
//  Candy
//
//  Created by Callum Beckwith on 14/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface spinBox : SKSpriteNode
+(void)createPrizeBox: (SKScene*)s;
+(void)updateBox: (SKScene*)s;
+(void)setFinalOutcome: (NSString*)str;
@end
