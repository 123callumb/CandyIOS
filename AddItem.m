//
//  AddItem.m
//  Candy
//
//  Created by Killian Comerford on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "AddItem.h"
#import "box1.h"
int currentValue = 0;
UIImageView *upgradeProgress = nil;
@implementation AddItem

+(void)CreateItem:(NSString*)imageName buttonTexture:(NSString*)buttonName yPos:(double)y Scene:(UIScrollView*)s ID:(int)i{
    //backImage
    upgradeProgress = [[UIImageView alloc] initWithFrame:CGRectMake(29*(s.frame.size.width/128), y+3*(s.frame.size.width/128), 6*(s.frame.size.width/128), 24*(s.frame.size.width/128))];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, y, s.frame.size.width, s.frame.size.width/4)];
    //img to be used for the box later on
    //UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0,y,s.frame.size.width, (s.frame.size.height/8))];
    //img.image = [UIImage imageNamed:imageName];
    back.image = [UIImage imageNamed:@"upgradeBar"];
    
    //locked image
    UIImageView *lockedTexture = [[UIImageView alloc] initWithFrame:CGRectMake(0, y, s.frame.size.width, s.frame.size.width/4)];
    lockedTexture.image = [UIImage imageNamed:@"lockedUpgrade"];
    lockedTexture.tag = 500+i;
    
    //setting the upgradeValue(NSuserDefault(out of 7))
    NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValue%i", i];
    long upgrd = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
    upgradeValue = [NSString stringWithFormat:@"upgradeProgress%li",upgrd];
    upgradeProgress.image = [UIImage imageNamed:upgradeValue];
    
    
    //upgradeButton
    SEL aSel = @selector(buttonActionn:);
    UIImage *btnImage = [UIImage imageNamed:buttonName];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:aSel
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"" forState:UIControlStateNormal];
    button.frame = CGRectMake(85*(s.frame.size.width / 128), y + 6*(s.frame.size.width/128), 38*(s.frame.size.width / 128), 20*(s.frame.size.width / 128));
    [button setImage:btnImage forState:UIControlStateNormal];
    button.tag = 400+i;
    upgradeProgress.tag = 450+i;
    button.hidden = true;
    [button setImage:[UIImage imageNamed:@"upgradeButtonPressed"]
            forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"upgradeButton"]
            forState:UIControlStateNormal];
    
    
    //Unlock Button
    SEL unlockSel = @selector(UnlockButtonAction:);
    UIButton *unlock = [UIButton buttonWithType:UIButtonTypeCustom];
    [unlock addTarget:self
               action:unlockSel
     forControlEvents:UIControlEventTouchUpInside];
    [unlock setTitle:@"" forState:UIControlStateNormal];
    unlock.frame = CGRectMake(85*(s.frame.size.width / 128), y + 6*(s.frame.size.width/128), 38*(s.frame.size.width / 128), 20*(s.frame.size.width / 128));
    [unlock setImage:btnImage forState:UIControlStateNormal];
    unlock.tag = 550+i;
    [unlock setImage:[UIImage imageNamed:@"unlockButtonPressed"]
            forState:UIControlStateSelected];
    [unlock setImage:[UIImage imageNamed:@"unlockButton"]
            forState:UIControlStateNormal];

    //NSUserValues
    NSString *Locked = [NSString stringWithFormat:@"Unlocked%i",i];
    long lockedID = [[NSUserDefaults standardUserDefaults] integerForKey:Locked];
    
    [s addSubview:back];
    [s addSubview:upgradeProgress];
    //[s addSubview:img];
    [s addSubview:button];
    
    if((int)lockedID == 1)
    {
        button.hidden = false;
    }
    
    //locked Texture on top
    if((int)lockedID != 1){
        [s addSubview:lockedTexture];
        [s addSubview:unlock];
    }
}
+(void)buttonActionn:(id)sender{
    
    UIButton *button = (UIButton*)sender;
    UIView *view = (UIView*)[sender superview];
    
    long newID = button.tag - 400;
    long barID = 450+newID;
    
    NSString *lockedString = [NSString stringWithFormat:@"Unlocked%li",newID];
    long locked = [[NSUserDefaults standardUserDefaults] integerForKey:lockedString];
    
    if((int)locked == 1){
        button.selected = !button.selected;
    
        SEL selTemp = @selector(switchTexture:);
        [self performSelector:selTemp withObject:button afterDelay:0.2];
    
        NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValue%li",newID];
        long upgradeProgress = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
        if(upgradeProgress < 7){
            upgradeProgress++;
        }
        [[NSUserDefaults standardUserDefaults] setInteger:upgradeProgress forKey:upgradeValue];
        NSString *newTexture = [NSString stringWithFormat:@"upgradeProgress%li",upgradeProgress];
    
        UIImageView *progressbar = (UIImageView*)[view viewWithTag:barID];
        [progressbar setImage:[UIImage imageNamed:newTexture]];
    
        NSLog(@"%li",barID);
        NSLog(@"%li",upgradeProgress);
        NSLog(@"%@",newTexture);
        NSLog(@"%@",upgradeValue);
    
        if(newID == 0){
            if(upgradeProgress < 5){
                [box1 setUnlockedSlots:(int)(upgradeProgress+1)];
            }
        }
    }
}
+(void)switchTexture:(id)sender{
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
}
+(void)UnlockButtonAction:(id)sender{
    UIButton *button = (UIButton*)sender;
    UIView *view = (UIView*)[sender superview];
    
    long newID = button.tag - 550;
    long imageID = 500+newID;
    long buttonID = 400+newID;
    
    UIButton *upgradeButton = (UIButton*)[view viewWithTag:buttonID];
    UIImageView *lockedImage = (UIImageView*)[view viewWithTag:imageID];
    [lockedImage removeFromSuperview];
    upgradeButton.hidden = false;
    [button removeFromSuperview];
    
    NSString *Locked = [NSString stringWithFormat:@"Unlocked%i",(int)newID];
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:Locked];
    long test = [[NSUserDefaults standardUserDefaults]integerForKey:Locked];
    
    NSLog(@"%li",test);
    NSLog(@"%@",Locked);
    
    //switches texture
    button.selected = !button.selected;
    SEL selTemp = @selector(switchTexture:);
    [self performSelector:selTemp withObject:button afterDelay:0.2];
}

@end
