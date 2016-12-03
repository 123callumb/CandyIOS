//
//  buildingGui.h
//  Candy
//
//  Created by Callum Beckwith on 03/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface buildingGui : SKSpriteNode
+(void)createOnTouch: (SKSpriteNode*)n buildingName:(NSString*)nodeName;
@end
