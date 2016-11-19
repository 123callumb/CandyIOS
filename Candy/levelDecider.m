//
//  levelDecider.m
//  Candy
//
//  Created by Callum Beckwith on 16/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "levelDecider.h"
#import "defaultLevel.h"

@implementation levelDecider

int level = 0;

+(void)createLevel:(SKScene*)s{
    if(level == 0){
        [defaultLevel setLevel:s];
    }
}
@end
