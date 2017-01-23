//
//  AddItem.m
//  Candy
//
//  Created by Killian Comerford on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "AddItem.h"
#import "box1.h"
#import "money.h"
#import "upgrades.h"

int currentValue = 0;
UIImageView *upgradeProgress = nil;
UILabel *moneyText;
@implementation AddItem

+(void)CreateItem:(NSString*)imageName buttonTexture:(NSString*)buttonName yPos:(double)y Scene:(UIScrollView*)s ID:(int)i{
    //backImage
    upgradeProgress = [[UIImageView alloc] initWithFrame:CGRectMake(29*(s.frame.size.width/128), y+3*(s.frame.size.width/128), 6*(s.frame.size.width/128), 24*(s.frame.size.width/128))];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, y, s.frame.size.width, s.frame.size.width/4)];
    
    //img to be used for the box later on
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(5*(s.frame.size.width/128),y+4*(s.frame.size.width/128),22*(s.frame.size.width/128), 20*(s.frame.size.width/128))];
    img.image = [UIImage imageNamed:imageName];
    back.image = [UIImage imageNamed:@"upgradeBar"];
    
    //info label
    UIFont *infoFont = [UIFont fontWithName:@"Coder's-Crux" size:17];
    UIFont *moneyFont = [UIFont fontWithName:@"Coder's-Crux" size:22];
    
    UILabel *infoText = [[UILabel alloc]initWithFrame:CGRectMake(38*(s.frame.size.width/128), y+4*(s.frame.size.width/128), 37*(s.frame.size.width/128), 8*(s.frame.size.width/128))];
    infoText.font = infoFont;
    infoText.text = @"test";
    
    //money label
    moneyText = [[UILabel alloc]initWithFrame:CGRectMake(49*(s.frame.size.width/128), y+17*(s.frame.size.width/128), 37*(s.frame.size.width/128), 8*(s.frame.size.width/128))];
    moneyText.font = moneyFont;
    moneyText.tag = 60000+i;
    
    //locked image
    UIImageView *lockedTexture = [[UIImageView alloc] initWithFrame:CGRectMake(0, y, s.frame.size.width, s.frame.size.width/4)];
    lockedTexture.image = [UIImage imageNamed:@"lockedUpgrade"];
    lockedTexture.tag = 500+i;
    
    //unlcock cost
    UIImageView *unlockCostBar = [[UIImageView alloc] initWithFrame:CGRectMake(35*(s.frame.size.width/128), y+6*(s.frame.size.width/128), 48*(s.frame.size.width/128), 18*(s.frame.size.width/128))];
    unlockCostBar.image = [UIImage imageNamed:@"upgradeCost"];
    unlockCostBar.tag = 600+i;
    
    //setting the upgradeValue(NSuserDefault(out of 7))and initializing the progress sprite
    NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValue%i", i];
    long upgrd = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
    upgradeValue = [NSString stringWithFormat:@"upgradeProgress%li",upgrd];
    upgradeProgress.image = [UIImage imageNamed:upgradeValue];
    
    //adding Upgrades
    //this is where each upgrade is loaded - go to the *upgrades* class for more info
    [upgrades addUpgrade:i upgradeImage:img upgradeText:infoText];
    [upgrades fetchMoneyValue:i moneyTextBox:moneyText];
    
    //upgradeButton
    SEL aSel = @selector(buttonActionn:);
    UIImage *btnImage = [UIImage imageNamed:buttonName];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:aSel
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"" forState:UIControlStateNormal];
    button.frame = CGRectMake(85*(s.frame.size.width / 128), y + 3*(s.frame.size.width/128), 40*(s.frame.size.width / 128), 24*(s.frame.size.width / 128));
    [button setImage:btnImage forState:UIControlStateNormal];
    button.tag = 400+i;
    upgradeProgress.tag = 450+i;
    button.hidden = true;
    [button setImage:[UIImage imageNamed:@"upgradeButtonPressed"]
            forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"upgradeButton"]
            forState:UIControlStateNormal];
    
    //unlock button
    SEL unlockSel = @selector(UnlockButtonAction:);
    UIButton *unlock = [UIButton buttonWithType:UIButtonTypeCustom];
    [unlock addTarget:self
               action:unlockSel
     forControlEvents:UIControlEventTouchUpInside];
    [unlock setTitle:@"" forState:UIControlStateNormal];
    unlock.frame = CGRectMake(85*(s.frame.size.width / 128), y + 6*(s.frame.size.width/128), 40*(s.frame.size.width / 128), 18*(s.frame.size.width / 128));
    [unlock setImage:btnImage forState:UIControlStateNormal];
    unlock.tag = 550+i;
    [unlock setImage:[UIImage imageNamed:@"unlockButtonPressed"]
            forState:UIControlStateSelected];
    [unlock setImage:[UIImage imageNamed:@"unlockButton"]
            forState:UIControlStateNormal];

    //NSUserValues
    NSString *Locked = [NSString stringWithFormat:@"Unlocked%i",i];
    long lockedID = [[NSUserDefaults standardUserDefaults] integerForKey:Locked];
    
    //adding all the elements to the scene
    [s addSubview:back];
    [s addSubview:upgradeProgress];
    [s addSubview:img];
    [s addSubview:button];
    [s addSubview:infoText];
    [s addSubview:moneyText];
    if((int)lockedID == 1)
    {
        button.hidden = false;
    }
    //locked Texture on top
    if((int)lockedID != 1){
        [s addSubview:lockedTexture];
        [s addSubview:unlock];
        [s addSubview:unlockCostBar];
    }
}

//this method is run when the upgrade button is pressed.
+(void)buttonActionn:(id)sender{
    //initializes all the variables needed for all the updates
    UIButton *button = (UIButton*)sender;
    UIView *view = (UIView*)[sender superview];
    long newID = button.tag - 400;
    long barID = 450+newID;
    long moneyTextID = 60000 + newID;
    UILabel *moneyText = (UILabel*)[view viewWithTag:moneyTextID];
    
    //this checks whether the update is locked or not, if it is then the button does nothing
    NSString *lockedString = [NSString stringWithFormat:@"Unlocked%li",newID];
    long locked = [[NSUserDefaults standardUserDefaults] integerForKey:lockedString];
    
    if((int)locked == 1){
        //this checks whether the user has enough money
        [upgrades fetchMoneyValue:newID moneyTextBox:moneyText];
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
            [upgrades fetchMoneyValue:newID moneyTextBox:moneyText];
            [upgrades upgradeActions:newID];
       
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
}
//this method swithes button textures so it looks like its been pressed down
+(void)switchTexture:(id)sender{
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
}
//this method unlocks the upgrade
+(void)UnlockButtonAction:(id)sender{
    UIButton *button = (UIButton*)sender;
    UIView *view = (UIView*)[sender superview];
    
    long newID = button.tag - 550;
    long imageID = 500+newID;
    long buttonID = 400+newID;
    long costID = 600+newID;
    
    UIButton *upgradeButton = (UIButton*)[view viewWithTag:buttonID];
    UIImageView *lockedImage = (UIImageView*)[view viewWithTag:imageID];
    UIImageView *costImage = (UIImageView*)[view viewWithTag:costID];
    [lockedImage removeFromSuperview];
    upgradeButton.hidden = false;
    [button removeFromSuperview];
    [costImage removeFromSuperview];
    
    NSString *Locked = [NSString stringWithFormat:@"Unlocked%i",(int)newID];
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:Locked];
    
    
    //switches texture
    button.selected = !button.selected;
    SEL selTemp = @selector(switchTexture:);
    [self performSelector:selTemp withObject:button afterDelay:0.2];
}

@end
