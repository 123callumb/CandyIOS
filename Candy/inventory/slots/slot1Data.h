//
//  slot1Data.h
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface slot1Data : SKSpriteNode
+(int)getSweet: (NSString*)no;
+(void)setSweet: (int)num sweetNum:(NSString*)no;

+(int)getFlavour: (NSString*)no;
+(void)setFlavour: (int)num sweetNum:(NSString*)no;

+(int)getSweetness: (NSString*)no;
+(void)setSweetness: (int)num sweetNum:(NSString*)no;
@end
