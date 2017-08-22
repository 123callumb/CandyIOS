//
//  CE_pants_menu.h
//  Candy
//
//  Created by Killian Comerford on 02/06/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <UIKit/UIKit.h>

@interface CE_pants_menu : UIView
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s;
+(void)moveIn:(UIView*)v;
+(void)back_button_action:(id)sender;
+(void)addpants;
+(void)addUnlockedpants:(NSMutableArray*)array;
+(void)addLockedpants:(NSMutableArray*)array;
+(void)pants_selected:(id)sender;
+(void)spawnIcons:(UIScrollView*)s view:(UIView*)v;
@end
