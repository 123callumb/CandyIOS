//
//  scrollUpdate.h
//  Candy
//
//  Created by Killian Comerford on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface scrollUpdate : UIView
+(void)initializeScrollRegular:(SKScene*)s;
+(void)initializeScrollSpecial:(SKScene*)s;
+(void)Show:(UIView*)v;
+(void)Hide:(UIView*)v;
+(void)switchMenu:(UIView*)v;
@end
