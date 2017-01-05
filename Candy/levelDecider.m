//
//  levelDecider.m
//  Candy
//
//  Created by Callum Beckwith on 16/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

// Each level will hae these dependent variables which will base how it looks
//  - The amount of work stations
//  - The floor style like depends what they have bought from the shop e.g. disco floor etc
//  - So the type of building you own will determine the size of work stations it can have
//  - It will be as simple as zooming out and lookng at the work stations in a smaller view, can be like an saved int
//  - The workstation amount should determine the amount of workers, 3 workers = 3 work stations = 3 * inventory draw
//  - The look of he wall will determine what biulding you are in, they should all have a window and have a dynamic background behind them!
//  - The main characters position and size
//  -

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
