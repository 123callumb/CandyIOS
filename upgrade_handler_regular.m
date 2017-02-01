//
//  upgrade_handler_regular.m
//  Candy
//
//  Created by Killian Comerford on 01/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "upgrade_handler_regular.h"
#import "upgrades_regular.h"
#import "money.h"

@implementation upgrade_handler_regular

+(void)InitializeRegularUpgrade:(UIScrollView*)s ID:(int)ID yPos:(int)y{
    //backimage
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, y, s.frame.size.width, s.frame.size.width/4)];
    backImage.image = [UIImage imageNamed:@"upgradeBar"];
    
    
    //upgrade progress image
    UIImageView *progressImage = [[UIImageView alloc]initWithFrame:CGRectMake(29*(s.frame.size.width/128), y+3*(s.frame.size.width/128), 6*(s.frame.size.width/128), 24*(s.frame.size.width/128))];
    NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValue%i", ID];
    long upgrd = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
    upgradeValue = [NSString stringWithFormat:@"upgradeProgress%li",upgrd];
    progressImage.image = [UIImage imageNamed:upgradeValue];
    progressImage.tag = 450+ID;
    
    
    //upgrade button
    SEL aSel = @selector(buttonAction:);
    UIButton *upgradeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [upgradeButton addTarget:self
               action:aSel
     forControlEvents:UIControlEventTouchUpInside];
    [upgradeButton setTitle:@"" forState:UIControlStateNormal];
    upgradeButton.frame = CGRectMake(85*(s.frame.size.width / 128), y + 3*(s.frame.size.width/128), 40*(s.frame.size.width / 128), 24*(s.frame.size.width / 128));
    upgradeButton.tag = 400+ID;
    [upgradeButton setImage:[UIImage imageNamed:@"upgradeButtonPressed"]
            forState:UIControlStateSelected];
    [upgradeButton setImage:[UIImage imageNamed:@"upgradeButton"]
            forState:UIControlStateNormal];
    
    
    //info text
    UIFont *infoFont = [UIFont fontWithName:@"Coder's-Crux" size:17];
    UILabel *infoText = [[UILabel alloc]initWithFrame:CGRectMake(38*(s.frame.size.width/128), y+4*(s.frame.size.width/128), 37*(s.frame.size.width/128), 8*(s.frame.size.width/128))];
    infoText.font = infoFont;
    
    
    //money text
    UIFont *moneyFont = [UIFont fontWithName:@"Coder's-Crux" size:22];
    UILabel *moneyText =[[UILabel alloc]initWithFrame:CGRectMake(49*(s.frame.size.width/128), y+17*(s.frame.size.width/128), 37*(s.frame.size.width/128), 8*(s.frame.size.width/128))];
    moneyText.font = moneyFont;
    moneyText.tag = 60000+ID;
    
    
    //upgrade image
    UIImageView *upgradeImage = [[UIImageView alloc] initWithFrame:CGRectMake(5*(s.frame.size.width/128),y+4*(s.frame.size.width/128),22*(s.frame.size.width/128), 20*(s.frame.size.width/128))];
    
    
    //initializing the values for the upgrades
    [upgrades_regular addUpgrade:ID upgradeImage:upgradeImage upgradeText:infoText];
    [upgrades_regular fetchMoneyValue:ID moneyTextBox:moneyText];
    
    
    //adding items to the UIscrollView
    [s addSubview:backImage];
    [s addSubview:progressImage];
    [s addSubview:upgradeButton];
    [s addSubview:infoText];
    [s addSubview:moneyText];
    [s addSubview:upgradeImage];
}
+(void)buttonAction:(id)sender{
    UIButton *button = (UIButton*)sender;
    UIView *view = (UIView*)[sender superview];
    long newID = button.tag - 400;
    long barID = 450+newID;
    long moneyTextID = 60000 + newID;
    UILabel *moneyText = (UILabel*)[view viewWithTag:moneyTextID];
    
    [upgrades_regular fetchMoneyValue:newID moneyTextBox:moneyText];
    long unlockVal = moneyText.text.integerValue;
    long moneyVal = [money getBalanceAsString].integerValue;
    
    if(moneyVal >= unlockVal){
        button.selected = !button.selected;
        
        SEL selTemp = @selector(switchTexture:);
        [self performSelector:selTemp withObject:button afterDelay:0.2];
        
        //changes the NSValue for the update when the button is pressed
        NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValue%li",newID];
        long upgradeProgress = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
        if(upgradeProgress < 7){
            upgradeProgress++;
        }
        [[NSUserDefaults standardUserDefaults] setInteger:upgradeProgress forKey:upgradeValue];
        
        //handles all the updates when the update button is pressed
        [upgrades_regular fetchMoneyValue:newID moneyTextBox:moneyText];
        [upgrades_regular upgradeActions:newID];
        
        //changes the progress bar image
        NSString *newTexture = nil;
        newTexture = [NSString stringWithFormat:@"upgradeProgress%li",upgradeProgress];
        UIImageView *progressbar = (UIImageView*)[view viewWithTag:barID];
        [progressbar setImage:[UIImage imageNamed:newTexture]];
        
        [money addBalance:-(int)unlockVal];
    }
    else{
        //what happens if they dont have sufficient funds
        //needs to be added
    }
}
+(void)switchTexture:(id)sender{
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
}
@end
