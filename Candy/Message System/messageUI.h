//
//  messageUI.h
//  Candy
//
//  Created by Callum Beckwith on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface messageUI : UIView
+(void)createMessageBox: (UIView*)v information:(NSString*)contentText representingImage:(NSString*)imageTexture imageScale:(float)scale messageBoxID:(int)boxID displayOnce:(bool)displayOnce;
+(void)createMultipleMessageBoxes: (NSArray*)infoStrings corrispondingTextures:(NSArray*)textures textureScales:(NSArray*)scales uiview:(UIView*)v endMessageIDAt:(int)messageID displayOnce:(bool)displayOnce;

@end
