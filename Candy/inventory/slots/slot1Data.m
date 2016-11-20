//
//  slot1Data.m
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "slot1Data.h"

@implementation slot1Data

+(int)getSweet: (NSString*)no; {
    
    int s1Sweet = (int)[[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"slot%@Sweet", no]];
    
    if (s1Sweet ==! NULL) {
        return s1Sweet;
    }else {
        return 0;
    }
}
+(void)setSweet: (int)num sweetNum:(NSString*)no; {
    [[NSUserDefaults standardUserDefaults] setInteger:(num) forKey:[NSString stringWithFormat:@"slot%@Sweet", no]];
}

+(int)getFlavour: (NSString*)no; {
    
    int s1Flav = (int)[[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"slot%@Flavour", no]];
    
    if (s1Flav ==! NULL) {
        return s1Flav;
    }else {
        return 0;
    }
}
+(void)setFlavour: (int)num sweetNum:(NSString*)no;{
    [[NSUserDefaults standardUserDefaults] setInteger:(num) forKey:[NSString stringWithFormat:@"slot%@Flavour", no]];
}

+(int)getSweetness: (NSString*)no; {
    
    int s1Sweetness = (int)[[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"slot%@Sweetness", no]];
    
    if (s1Sweetness ==! NULL) {
        return s1Sweetness;
    }else {
        return 0;
    }
}
+(void)setSweetness: (int)num sweetNum:(NSString*)no; {
    [[NSUserDefaults standardUserDefaults] setInteger:(num) forKey:[NSString stringWithFormat:@"slot%@Sweetness", no]];
}
@end
