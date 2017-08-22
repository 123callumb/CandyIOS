//
//  CE_skin_menu.h
//  Candy
//
//  Created by Killian Comerford on 02/06/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface CE_skin_menu : UIView
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s;
+(void)moveIn:(UIView*)v;
+(void)back_button_action:(id)sender;
+(void)sliderValueChanged:(UISlider *)sender;
@end
