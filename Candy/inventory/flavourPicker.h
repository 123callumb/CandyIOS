//
//  flavourPicker.h
//  Candy
//
//  Created by Callum Beckwith on 22/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface flavourPicker : UIView
+(void)addFlavourPickerToView: (UIScrollView*)scrollView scene:(UIView*)v;
+(void)showUi: (UIView*)v;
+(void)hideUi: (UIView*)v;
@end
