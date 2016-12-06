//
//  AddItem.h
//  Candy
//
//  Created by Killian Comerford on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItem : UIImageView
+(void)buttonActionn:(id)sender;
+(void)CreateItem:(NSString*)imageName buttonTexture:(NSString*)buttonName yPos:(double)y Scene:(UIScrollView*)s ID:(int)i;
+(void)switchTexture:(id)sender;
@end
