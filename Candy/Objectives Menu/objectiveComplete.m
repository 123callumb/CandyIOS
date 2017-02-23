//
//  objectiveComplete.m
//  Candy
//
//  Created by Callum Beckwith on 16/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "objectiveComplete.h"
#import "objectivesGold.h"
#import "objectivesSilver.h"
#import "objectivesBronze.h"
#import "objectivesData.h"
#import "gems.h"

@implementation objectiveComplete

+(void)createCompletionAnimation: (UIView*)v type0To2:(int)type {
    UIView *mainCompletion = [[UIView alloc] initWithFrame:CGRectMake(0, -v.frame.size.height/3, v.frame.size.width, v.frame.size.height/3)];
    
    UIImage *imagetopbar = [UIImage imageNamed:@"objGetTitle"];
    UIImage *imageType = [UIImage imageNamed:[self getTypeFromId:type]];
    
    UIImageView *topbar = [[UIImageView alloc] initWithImage:imagetopbar];
    UIImageView *typeView = [[UIImageView alloc] initWithImage:imageType];
    
    [topbar setFrame:CGRectMake(0, 0, mainCompletion.frame.size.width, mainCompletion.frame.size.height/2.5)];
    [typeView setFrame:CGRectMake(0, -mainCompletion.frame.size.height, mainCompletion.frame.size.width, mainCompletion.frame.size.height/1.35)];
    
    [mainCompletion addSubview:typeView];
    [mainCompletion addSubview:topbar];
    
    [v addSubview:mainCompletion];
    
    [UIView animateWithDuration:1.5 animations:^{
        [mainCompletion setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height/3)];
        [typeView setFrame:CGRectMake(0, topbar.frame.size.height/1.5, mainCompletion.frame.size.width, mainCompletion.frame.size.height/1.35)];
        [self onChallengeComplete:type];
        
    } completion:^(BOOL finished){
        [UIView animateWithDuration:5 animations:^{
            [mainCompletion setAlpha:0.0];
            
        }
        completion:^(BOOL finished){
            [mainCompletion removeFromSuperview];
        }];
    }];
    
}
+(NSString*)getTypeFromId:(int)typeNo {
    NSString *type;
    
    if(typeNo == 0){
        type = @"objGoldGet";
    }
    if(typeNo == 1){
        type = @"objSilverGet";
    }
    if(typeNo == 2){
        type = @"objBronzeGet";
    }
    
    return type;
}

+(void)onChallengeComplete: (int)rewardType {
    if(rewardType == 0){
        [gems addGems:1];
        [objectivesData setGoldProgress:[objectivesData getGoldProgress]+1];
    }
    if(rewardType == 1){
        [gems addMiniGems:10];
        [objectivesData setSilverProgress:[objectivesData getSilverProgress]+1];

    }
    if(rewardType == 2){
        [gems addMiniGems:5];
        [objectivesData setBronzeProgress:[objectivesData getBronzeProgress]+1];

    }
}
@end
