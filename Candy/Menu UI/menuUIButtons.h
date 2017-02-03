//
//  menuUIButtons.h
//  Candy
//
//  Created by Callum Beckwith on 02/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface menuUIButtons : UIView
+(void)addButtons: (UIView*)v;
+(NSArray*)menuButtons;
+(void)menuUpdateChecker: (SKScene*)s view:(UIView*)v;
@end
