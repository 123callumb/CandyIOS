//
//  settingsUI.m
//  Candy
//
//  Created by Callum Beckwith on 12/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "settingsUI.h"
#import "settingsData.h"

@implementation settingsUI

+(void)createSettingsMenu: (UIView*)v {
    UIView *mainSettings = [[UIView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    UIImage *settingsBack = [UIImage imageNamed:@"settingsBG"];
    UIImageView *settingsBG = [[UIImageView alloc] initWithFrame:mainSettings.frame];
    [settingsBG setImage:settingsBack];
    
    UIImage *mainAreaImage = [UIImage imageNamed:@"settingsMain"];
    UIImageView *mainArea = [[UIImageView alloc] initWithImage:mainAreaImage];
    
    UIImage *crossImage = [UIImage imageNamed:@"crossButton"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    float mainAreaW = mainSettings.frame.size.width/1.2;
    float mainAreaH = mainSettings.frame.size.height/1.6;
    
    [mainArea setFrame:CGRectMake(mainSettings.frame.size.width, mainSettings.frame.size.height/2.2 - mainAreaH/2, mainAreaW, mainAreaH)];
    
    [backButton setImage:crossImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(mainArea.frame.size.width/26, mainArea.frame.size.width/6, mainArea.frame.size.width/6, mainArea.frame.size.width/6)];
    [backButton addTarget:self action:@selector(onBackPress:) forControlEvents:UIControlEventTouchUpInside];

    
    [self addButtons:mainArea];
    
    [mainArea addSubview:backButton];
    [mainSettings setAlpha:0.0];
    [mainSettings setUserInteractionEnabled:YES];
    [settingsBG setUserInteractionEnabled:YES];
    [mainArea setUserInteractionEnabled:YES];
    
    [mainSettings addSubview:settingsBG];
    [mainSettings addSubview:mainArea];
    [v addSubview:mainSettings];
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainSettings setAlpha:1];
        [mainArea setFrame:CGRectMake(mainSettings.frame.size.width/2 - mainAreaW/2,mainSettings.frame.size.height/2.2 - mainAreaH/2, mainAreaW, mainAreaH)];
    }];
    
    
}
+(void)addButtons: (UIView*)v {
    UIButton *sfxButton = [self createButtonWithState:v state:[settingsData isMusicEnabled] yPos:v.frame.size.height/3.5];
    UIButton *tipsButton = [self createButtonWithState:v state:[settingsData isTipsEnabled] yPos:v.frame.size.height/2.1];
    UIButton *graphicsButton = [self createButtonWithState:v state:[settingsData isFancyGraphicsEnabled] yPos:v.frame.size.height/1.5];
    
    [sfxButton addTarget:self action:@selector(onSFXPress:) forControlEvents:UIControlEventTouchUpInside];
    [tipsButton addTarget:self action:@selector(onTipsPress:) forControlEvents:UIControlEventTouchUpInside];
    [graphicsButton addTarget:self action:@selector(onFGPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [v addSubview:sfxButton];
    [v addSubview:tipsButton];
    [v addSubview:graphicsButton];
}
+(void)onSFXPress:(id)sender {
    UIButton *but = (UIButton*)sender;
    if([settingsData isMusicEnabled] == 0){
        [settingsData toggleMusic:false];
    }else {
        [settingsData toggleMusic:true];
    }
    [but setImage:[UIImage imageNamed:[NSString stringWithFormat:@"toggleButton_%d", [settingsData isMusicEnabled]]] forState:UIControlStateNormal];
}
+(void)onTipsPress:(id)sender {
    UIButton *but = (UIButton*)sender;
    if([settingsData isTipsEnabled] == 0){
        [settingsData toggleTips:false];
    }else {
        [settingsData toggleTips:true];
    }
    [but setImage:[UIImage imageNamed:[NSString stringWithFormat:@"toggleButton_%d", [settingsData isTipsEnabled]]] forState:UIControlStateNormal];

}
+(void)onFGPress:(id)sender {
    UIButton *but = (UIButton*)sender;
    if([settingsData isFancyGraphicsEnabled] == 0){
        [settingsData toggleFancyGraphics:false];
    }else {
        [settingsData toggleFancyGraphics:true];
    }
    [but setImage:[UIImage imageNamed:[NSString stringWithFormat:@"toggleButton_%d", [settingsData isFancyGraphicsEnabled]]] forState:UIControlStateNormal];
}
+(UIButton*)createButtonWithState: (UIView*)v state:(int)state yPos:(float)yPosition {
    
    NSString *textureName = [NSString stringWithFormat:@"toggleButton_%d", state];
    UIImage *buttonImage = [UIImage imageNamed:textureName];
    UIButton *toggleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [toggleButton setImage:buttonImage forState:UIControlStateNormal];
    
    float buttonW = v.frame.size.width/3;
    float buttonH = v.frame.size.height/12;
    
    [toggleButton setFrame:CGRectMake(v.frame.size.width/2 - buttonW/2, yPosition, buttonW, buttonH)];
    
    return toggleButton;
    
}
+(void)onBackPress:(id)sender {
    UIButton *back = (UIButton*)sender;
    UIView *mainArea = [back superview];
    UIView *main = [mainArea superview];
    
    float mainAreaW = main.frame.size.width/1.2;
    float mainAreaH = main.frame.size.height/1.6;
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainArea setFrame:CGRectMake(main.frame.size.width, main.frame.size.height/2.2 - mainAreaH/2, mainAreaW, mainAreaH)];
        [main setAlpha:0.1];
    } completion:^(BOOL finsihed){
        [main removeFromSuperview];
    }];
    
    
}
@end
