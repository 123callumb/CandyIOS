//
//  sweetData.h
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface sweetData : SKSpriteNode
+(id)sweetFromSlot: (int)i;
+(NSString*)textureDecider: (int)i;
+(NSString*)sweetTypeNameDecider: (int)i;
+(NSString*)determineFlavourString: (int)flavourID;
@end
