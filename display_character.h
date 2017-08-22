//
//  display_character.h
//  Candy
//
//  Created by Killian Comerford on 15/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface display_character : SKScene
+(void)display:(UIView*)view size:(double)s xPos:(double)x yPos:(double)y;
+(NSString*)fetchHat;
+(NSString*)fetchShirt_0;
+(NSString*)fetchShirt_1;
+(NSString*)fetchPants;
+(NSString*)fetchShoes;
@end
