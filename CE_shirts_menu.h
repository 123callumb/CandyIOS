//
//  CE_shirts_menu.h
//  Candy
//
//  Created by Killian Comerford on 02/06/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface CE_shirts_menu : UIView
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s;
+(void)moveIn:(UIView*)v;
+(void)back_button_action:(id)sender;
+(void)addshirts;
+(void)addUnlockedshirts:(NSMutableArray*)array;
+(void)addLockedshirts:(NSMutableArray*)array;
+(void)shirts_selected:(id)sender;
+(void)spawnIcons:(UIScrollView*)s view:(UIView*)v;
@end
