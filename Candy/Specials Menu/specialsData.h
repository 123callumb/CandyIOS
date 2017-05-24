//
//  specialsData.h
//  Candy
//
//  Created by Callum Beckwith on 07/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface specialsData : NSObject
+(int)getSpecialActiveWithID;
+(void)activateSpecialWithID:(int)itemNumber;
+(int)getSpecialsMultiplier;
+(bool)getHoldDownValue;
+(void)checkForSpecialTimerCompletion;
+(int)getSpecialsTimeLeft;
+(NSString*)determineSpecialIcon;
@end
