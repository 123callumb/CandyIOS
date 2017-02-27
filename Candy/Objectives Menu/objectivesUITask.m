//
//  objectivesUITask.m
//  Candy
//
//  Created by Callum Beckwith on 14/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "objectivesUITask.h"
#import "objectivesData.h"
#import "messageUI.h"

@implementation objectivesUITask
+(void)createTasks: (UIView*)v {
    
    float taskW = v.frame.size.width/1.15;
    float taskH = v.frame.size.height/4.5;
    
    UIView *goldTask = [self createObjective:v
                        objType:0
                        objective:[[objectivesData goldObjs] objectAtIndex:[objectivesData getGoldProgress]]
                        frame:CGRectMake(v.frame.size.width, v.frame.size.height/5, taskW, taskH)];
    
    UIView *silverTask = [self createObjective:v
                               objType:1
                               objective:[[objectivesData silverObjs] objectAtIndex:[objectivesData getSilverProgress]]
                               frame:CGRectMake(v.frame.size.width, v.frame.size.height/2.3,taskW, taskH)];
    
    UIView *bronzeTask = [self createObjective:v
                               objType:2
                               objective:[[objectivesData bronzeObjs] objectAtIndex:[objectivesData getBronzeProgress]]
                               frame:CGRectMake(v.frame.size.width, v.frame.size.height/1.5, taskW, taskH)];
    
    [v addSubview:goldTask];
    [v addSubview:silverTask];
    [v addSubview:bronzeTask];
    
    [UIView animateWithDuration:0.6 animations:^{
        [goldTask setFrame:CGRectMake(v.frame.size.width/2 - taskW/2, v.frame.size.height/5, taskW, taskH)];
        [silverTask setFrame:CGRectMake(v.frame.size.width/2- taskW/2, v.frame.size.height/2.3,taskW, taskH)];
        [bronzeTask setFrame:CGRectMake(v.frame.size.width/2- taskW/2, v.frame.size.height/1.5, taskW, taskH)];
    }];
}

+(UIView*)createObjective: (UIView*)v objType:(int)objID objective:(NSString*)objString frame:(CGRect)frame {
    
    UIView *mainObj = [[UIView alloc] initWithFrame:frame];
    
    UIImage *bgType = [UIImage imageNamed:@"objGold"];
    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeCustom];

    if(objID == 0){
        bgType = [UIImage imageNamed:@"objGold"];
        skipButton.tag = 1447;
    }
    if(objID == 1){
        bgType = [UIImage imageNamed:@"objSilver"];
        skipButton.tag = 1448;
    }
    if(objID == 2){
        bgType = [UIImage imageNamed:@"objBronze"];
        skipButton.tag = 1449;
    }
    
    UIImageView *objView = [[UIImageView alloc] initWithImage:bgType];
    [objView setFrame:CGRectMake(0, 0, mainObj.frame.size.width, mainObj.frame.size.height)];
    
    UIImage *skipBg = [UIImage imageNamed:@"objSkip"];

    float skipDi = mainObj.frame.size.width/7.5;

    [skipButton setImage:skipBg forState:UIControlStateNormal];
    [skipButton setFrame:CGRectMake(mainObj.frame.size.width - skipDi - skipDi/8, mainObj.frame.size.height - skipDi - skipDi/8, skipDi, skipDi)];
    [skipButton addTarget:self action:@selector(onSkip:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *objText = [[UILabel alloc] initWithFrame:CGRectMake(mainObj.frame.size.width/3.6, mainObj.frame.size.height/4, mainObj.frame.size.width/1.6, mainObj.frame.size.height/3)];
    
    [objText setFont:[UIFont fontWithName:@"Coder's-Crux" size:20.0f]];
    [objText setText:objString];
    [objText setTextColor:[UIColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1]];
    [objText setLineBreakMode:0];
    [objText setNumberOfLines:0];
    
    [mainObj addSubview:objView];
    [mainObj addSubview:skipButton];
    [mainObj addSubview:objText];
    
    return mainObj;
    
}
+(void)onSkip:(id)sender{
    UIButton *skip = (UIButton*)sender;
    UIView *objV = [skip superview];
    UIView *v = [objV superview];
    
    [messageUI createConfirmMessageBox:v information:@"Are you sure you would like to skip this objective for 2 Gems?" representingImage:@"gem" imageScale:0.4 messageBoxID:80 displayOnce:false onConfirm:2 confTag:(int)skip.tag];
}
@end
