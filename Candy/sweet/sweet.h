//
//  sweet.h
//  Candy
//
//  Created by Callum Beckwith on 09/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface sweet : SKNode
+(id)createNewSweet: (SKScene*)s sweetName:(NSString*)name textureName:(NSString*)textureName;
@end
