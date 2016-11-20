//
//  slot1Data.h
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface slot1Data : SKSpriteNode
+(int)getSweet: (int)no;
+(void)setSweet: (int)num sweetNum:(int)no;

+(int)getFlavour: (int)no;
+(void)setFlavour: (int)num sweetNum:(int)no;

+(int)getSweetness: (int)no;
+(void)setSweetness: (int)num sweetNum:(int)no;
@end
