//
//  quickSelectUI.m
//  Candy
//
//  Created by Callum Beckwith on 27/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "quickSelectUI.h"
#import "sweetDrawSlots.h"
#import "sweetDrawData.h"

@implementation quickSelectUI

+(void)addUI: (UIView*)v {
    float uiWidth = v.frame.size.width/1.32;
    float uiHeight = v.frame.size.height/5.05;
    
    UIScrollView *main = [[UIScrollView alloc] initWithFrame:CGRectMake(v.frame.size.width/2 - uiWidth/2, v.frame.size.height/1.77, uiWidth, uiHeight)];
    main.contentSize = CGSizeMake(uiWidth/2.2 * ([sweetDrawData getDrawsUnlocked] + 1) + uiWidth/30 , main.frame.size.height);
    main.backgroundColor = [UIColor clearColor];
    main.tag = 9000;
    
    [sweetDrawSlots addSlots:main layoutStyle:0];
    
    [v addSubview:main];
}
+(void)removeUI: (UIView*)v {
    UIScrollView *main = (UIScrollView*)[v viewWithTag:9000];
    [main removeFromSuperview];
}
@end
