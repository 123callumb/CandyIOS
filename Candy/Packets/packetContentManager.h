//
//  packetContentManager.h
//  Candy
//
//  Created by Callum Beckwith on 18/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface packetContentManager : SKSpriteNode
+(void)createContentPane: (SKSpriteNode*)s contentList:(NSArray*)contentArray;
+(SKSpriteNode*)createRandomPacketItem:(CGPoint)p itemList:(NSArray*)packetItems;
+(void)createSlider: (SKScene*)s yPos:(float)yVal sweetList:(NSArray*)contentList;
@end
