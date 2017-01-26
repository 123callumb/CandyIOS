//
//  spinData.h
//  Candy
//
//  Created by Callum Beckwith on 19/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface spinData : NSObject
+(BOOL)isEligibleForDailySpin;
+(void)setCurrentDate;
+(int)getHoursLeft;
+(int)getStreakValue;
@end
