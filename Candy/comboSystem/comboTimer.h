//
//  comboTimer.h
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface comboTimer : SKNode
+(void)startTimer:(SKScene *)s;
+(bool)getComboValue;
+(void)realeaseMechanism: (SKScene*)s;
@end
