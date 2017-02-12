//
//  settingsData.h
//  Candy
//
//  Created by Callum Beckwith on 12/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface settingsData : NSObject
+(void)toggleMusic: (bool)onOff;
+(int)isMusicEnabled;
+(void)toggleTips: (bool)onOff;
+(int)isTipsEnabled;
+(void)toggleFancyGraphics: (bool)onOff;
+(int)isFancyGraphicsEnabled;
@end
