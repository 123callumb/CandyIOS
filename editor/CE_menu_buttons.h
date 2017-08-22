//
//  CE_menu_buttons.h
//  Candy
//
//  Created by Killian Comerford on 22/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface CE_menu_buttons : SKScene
+(void)initializeTextures:(UIView*)v;
+(void)hats_button_action:(id)sender;
+(void)shirt_button_action:(id)sender;
+(void)pants_button_action:(id)sender;
+(void)shoes_button_action:(id)sender;
+(void)skin_button_action:(id)sender;
+(void)moveButtonsToSide:(UIView*)v;
+(void)moveButtonsBack:(UIView*)v;
+(void)moveButtonsToSideLeft:(UIView*)v;
+(void)moveButtonsBackLeft:(UIView*)v;
@end
