//
//  CE_skin_menu.m
//  Candy
//
//  Created by Killian Comerford on 22/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "CE_skin_menu.h"
#import "CE_menu_buttons.h"
#import "display_character.h"

@implementation CE_skin_menu
+(void)initializeScrollView:(UIView*)v skScene:(SKScene*)s{
    //pull bar
    UIImageView *pull_bar_skin = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pull_bar_skin"]];
    pull_bar_skin.frame = CGRectMake(v.frame.size.width, v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    pull_bar_skin.tag=1240;
    
    //skin slider
    //----INITIALIZING SLIDER----
    UISlider *skin_slider = [[UISlider alloc]initWithFrame:CGRectMake(((v.frame.size.width - v.frame.size.width/1.1)/2)+v.frame.size.width, v.frame.size.height/1.5, v.frame.size.width/1.1, 50)];
    skin_slider.minimumValue = 0;
    skin_slider.maximumValue = 10;
    skin_slider.continuous = YES;
    skin_slider.tag = 123333;
    [skin_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [skin_slider setMinimumTrackTintColor:[UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:(skin_slider.value/10)]];
    
    //block
    UIImageView *block = [[UIImageView alloc]initWithFrame:CGRectMake(v.frame.size.width/2-(v.frame.size.width/7)+v.frame.size.width, v.frame.size.height/2, v.frame.size.width/3.5, v.frame.size.width/3.5)];
    [block setImage:[UIImage imageNamed:@"base_hue"]];
    block.tag = 1222230;
    
    UIImageView *block_top = [[UIImageView alloc]initWithFrame:CGRectMake(v.frame.size.width/2-(v.frame.size.width/7)+v.frame.size.width, v.frame.size.height/2, v.frame.size.width/3.5, v.frame.size.width/3.5)];
    [block_top setImage:[UIImage imageNamed:@"top_hue"]];
    block_top.tag = 1222231;
    block_top.alpha = 0;
    
    //add back button
    SEL aSel_back = @selector(back_button_action:);
    UIButton *back_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [back_button addTarget:self action:aSel_back forControlEvents:UIControlEventTouchUpInside];
    back_button.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    [back_button setImage:[UIImage imageNamed:@"button_back"]forState:UIControlStateNormal];
    back_button.tag = 10411113;
    
    [v addSubview:skin_slider];
    //[v addSubview:selection_Bar];
    //[v addSubview:selection_Lever];
    [v addSubview:block];
    [v addSubview:block_top];
    [v addSubview:back_button];
    [v addSubview:pull_bar_skin];
}

+(void)moveIn:(UIView*)v{
    UIButton *btn = [v viewWithTag:10411113];
    [UIView animateWithDuration:0.3 animations:^{
        btn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height - 16*((v.frame.size.width/2)/45),v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIButton *continueBtn = [v viewWithTag:11114];
    [UIView animateWithDuration:0.3 animations:^{
        continueBtn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIImageView *pull = [v viewWithTag:1240];
    [UIView animateWithDuration:0.3 animations:^{
        pull.frame = CGRectMake(v.frame.size.width - v.frame.size.width/4, v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    }];
    UISlider *sldr = [v viewWithTag:123333];
    [UIView animateWithDuration:0.3 animations:^{
        sldr.frame = CGRectMake(((v.frame.size.width - v.frame.size.width/1.1)/2), v.frame.size.height/1.5, v.frame.size.width/1.1, 50);
    }];
    UIImageView *backHue = [v viewWithTag:1222230];
    [UIView animateWithDuration:0.3 animations:^{
        backHue.frame = CGRectMake(v.frame.size.width/2-(v.frame.size.width/7), v.frame.size.height/2, v.frame.size.width/3.5, v.frame.size.width/3.5);
    }];
    UIImageView *topHue = [v viewWithTag:1222231];
    [UIView animateWithDuration:0.3 animations:^{
        topHue.frame = CGRectMake(v.frame.size.width/2-(v.frame.size.width/7), v.frame.size.height/2, v.frame.size.width/3.5, v.frame.size.width/3.5);
    }];
    [CE_menu_buttons moveButtonsToSideLeft:v];
}
+(void)back_button_action:(id)sender{
    UIView *v = [sender superview];
    UIScrollView *scroll = [v viewWithTag:10411111];
    [UIView animateWithDuration:0.3 animations:^{
        scroll.frame = CGRectMake(v.layer.position.x + v.frame.size.width, v.layer.position.y - v.frame.size.height/11.8, v.layer.frame.size.width, v.frame.size.height/2.1);
    }];
    
    UIButton *btn = [v viewWithTag:10411113];
    UIButton *continueBtn = [v viewWithTag:11114];
    
    [UIView animateWithDuration:0.3 animations:^{
        continueBtn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height - 16*((v.frame.size.width/2)/45),v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.frame = CGRectMake(v.frame.size.width/2 - v.frame.size.width/4,v.frame.size.height,v.frame.size.width/2, 14*((v.frame.size.width/2)/45));
    }];
    UIImageView *pull = [v viewWithTag:1240];
    [UIView animateWithDuration:0.3 animations:^{
        pull.frame = CGRectMake(v.frame.size.width, v.layer.position.y - v.frame.size.height/11.8-(11*(1.5*(v.frame.size.width/4)/24)), v.frame.size.width/4, 11*((v.frame.size.width/4)/24));
    }];
    UISlider *sldr = [v viewWithTag:123333];
    [UIView animateWithDuration:0.3 animations:^{
        sldr.frame = CGRectMake(((v.frame.size.width - v.frame.size.width/1.1)/2)+v.frame.size.width, v.frame.size.height/1.5, v.frame.size.width/1.1, 50);
    }];
    UIImageView *backHue = [v viewWithTag:1222230];
    [UIView animateWithDuration:0.3 animations:^{
        backHue.frame = CGRectMake(v.frame.size.width/2-(v.frame.size.width/7)+v.frame.size.width, v.frame.size.height/2, v.frame.size.width/3.5, v.frame.size.width/3.5);
    }];
    UIImageView *topHue = [v viewWithTag:1222231];
    [UIView animateWithDuration:0.3 animations:^{
        topHue.frame = CGRectMake(v.frame.size.width/2-(v.frame.size.width/7)+v.frame.size.width, v.frame.size.height/2, v.frame.size.width/3.5, v.frame.size.width/3.5);
    }];
    [CE_menu_buttons moveButtonsBackLeft:v];
}

//slider selector
+(void)sliderValueChanged:(UISlider*)sender {
    UIView *vw = [sender superview];
    UISlider *sldr = [vw viewWithTag:123333];
    [sldr setMinimumTrackTintColor:[UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:(sldr.value/10)]];
    UIImageView *blk = [vw viewWithTag:1222231];
    blk.alpha = sldr.value/10;
    UIImageView *mg = [vw viewWithTag:10105];
    mg.alpha = sldr.value/10;
}
@end
