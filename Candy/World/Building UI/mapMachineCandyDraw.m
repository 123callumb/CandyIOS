//
//  mapMachineCandyDraw.m
//  Candy
//
//  Created by Callum Beckwith on 24/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "mapMachineCandyDraw.h"

@implementation mapMachineCandyDraw

+(void)createSweetDraw:(UIView*)view {
    float viewHeight = view.frame.size.height/1.35;
    float viewWidth = view.frame.size.width/1.1;
    
    UIView *machineView = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width, view.frame.size.height/2 - viewHeight/2, viewWidth, viewHeight)];
    UIImage *viewBacking = [UIImage imageNamed:@"mapMachineUI"];
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    [backView setImage:viewBacking];
    
    //Cross Button
    UIImage *crossImage = [UIImage imageNamed:@"crossButton"];
    UIButton *cross = [UIButton buttonWithType:UIButtonTypeCustom];
    [cross setFrame:CGRectMake(viewWidth/26, viewWidth/4.6, viewWidth/6, viewWidth/6)];
    [cross setImage:crossImage forState:UIControlStateNormal];
   // [cross addTarget:self action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:0.15 animations:^{
        [view addSubview:machineView];
        [machineView setFrame:CGRectMake(view.frame.size.width/2 - viewWidth/2, view.frame.size.height/2 - viewHeight/2, viewWidth, viewHeight)];
    } completion:^(BOOL finished){
      
    }];
}

@end
