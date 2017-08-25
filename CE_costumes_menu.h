//
//  CE_costumes_menu.h
//  Candy
//
//  Created by Killian Comerford on 02/06/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface CE_costumes_menu : UIView
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s;
+(void)moveIn:(UIView*)v;
+(void)back_button_action:(id)sender;
+(void)addcostumes;
+(void)addUnlockedcostumes:(NSMutableArray*)array;
+(void)addLockedcostumes:(NSMutableArray*)array;
+(void)costumes_selected:(id)sender;
+(void)spawnIcons:(UIScrollView*)s view:(UIView*)v;
@end
