//
//  messageSprite.h
//  Candy
//
//  Created by Callum Beckwith on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface messageSprite : SKSpriteNode
+(void)createMesssage: (SKScene*)s line1:(NSString*)l1 line2:(NSString*)l2 line3:(NSString*)l3 line4:(NSString*)l4;
@end
