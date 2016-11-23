//
//  slot1Data.m
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "slot1Data.h"

@implementation slot1Data

+(int)getSweet: (int)no; {
    
    int s1Sweet = (int)[[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"slot%dSweet", no]];
    return s1Sweet;

}
+(void)setSweet: (int)num sweetNum:(int)no; {
    [[NSUserDefaults standardUserDefaults] setInteger:(num) forKey:[NSString stringWithFormat:@"slot%dSweet", no]];
}

+(int)getFlavour: (int)no; {
    
    int s1Flav = (int)[[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"slot%dFlavour", no]];
    return s1Flav;
}
+(void)setFlavour: (int)num sweetNum:(int)no;{
    [[NSUserDefaults standardUserDefaults] setInteger:(num) forKey:[NSString stringWithFormat:@"slot%dFlavour", no]];
}

+(int)getSweetness: (int)no; {
    
    int s1Sweetness = (int)[[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"slot%dSweetness", no]];
    return s1Sweetness;
}
+(void)setSweetness: (int)num sweetNum:(int)no; {
    [[NSUserDefaults standardUserDefaults] setInteger:(num) forKey:[NSString stringWithFormat:@"slot%dSweetness", no]];
}
@end
