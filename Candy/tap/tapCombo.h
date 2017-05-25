//
//  tapCombo.h
//  Candy
//
//  Created by Callum Beckwith on 21/05/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface tapCombo : NSObject
+(void)startTapTimerCountDown:(SKScene*)onScene;
+(float)getCurrentComboMultiplier;
+(void)resetComboData;
@end
