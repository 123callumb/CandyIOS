//
//  CE_hats_menu.h
//  Candy
//
//  Created by Killian Comerford on 22/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <UIKit/UIKit.h>
@interface CE_hats_menu : SKScene
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s;
+(void)moveIn:(UIView*)v;
+(void)back_button_action:(id)sender;
+(void)addHats;
+(void)addUnlockedHats:(NSMutableArray*)array;
+(void)addLockedHats:(NSMutableArray*)array;
+(void)hat_selected:(id)sender;
+(void)spawnIcons:(UIScrollView*)s view:(UIView*)v;
@end
