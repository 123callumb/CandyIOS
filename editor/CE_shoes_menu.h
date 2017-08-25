//
//  CE_shoes_menu.h
//  Candy
//
//  Created by Killian Comerford on 02/06/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface CE_shoes_menu : UIView
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s;
+(void)moveIn:(UIView*)v;
+(void)back_button_action:(id)sender;
+(void)addshoes;
+(void)addUnlockedshoes:(NSMutableArray*)array;
+(void)addLockedshoes:(NSMutableArray*)array;
+(void)shoes_selected:(id)sender;
+(void)spawnIcons:(UIScrollView*)s view:(UIView*)v;
@end
