//
//  desks.h
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface desks : SKSpriteNode
+(void)addDesk: (CGPoint)pos scale:(float)scale nodeToAttatch:(SKScene*)s;
+(int)getAmountOfDesks;
+(void)addNewDeskToList: (int)deskID;
+(bool)doesOwnDesk: (int)deskID;
+(NSString*)getDeskAtIndex: (int)index;
+(void)setCurrentDeskID: (int)deskID;
@end
