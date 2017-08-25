//
//  mapBuildingUI.m
//  Candy
//
//  Created by Callum Beckwith on 17/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "mapBuildingUI.h"
#import "buildingData.h"
#import "buildingType.h"
#import "mapBuildingSlots.h"

@implementation mapBuildingUI

int currentMapBuilding = -1;

+(void)openBuildingUIForBuildingWithID:(int)buildingID forView:(UIView*)view {
    
    currentMapBuilding = buildingID;
    
    float viewHeight = view.frame.size.height/1.35;
    float viewWidth = view.frame.size.width/1.1;
    
    UIView *buildingUIView = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width, view.frame.size.height/2 - viewHeight/2, viewWidth, viewHeight)];
    [buildingUIView setTag:8000 + currentMapBuilding];
    UIImage *uiBackingImage = [UIImage imageNamed:@"mapBuildingBacking"];
    UIImageView *backingView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    
    //Cross /Exit Button
    UIImage *crossImage = [UIImage imageNamed:@"crossButton"];
    UIButton *cross = [UIButton buttonWithType:UIButtonTypeCustom];
    [cross setFrame:CGRectMake(viewWidth/26, viewWidth/4.6, viewWidth/6, viewWidth/6)];
    [cross setImage:crossImage forState:UIControlStateNormal];
    [cross addTarget:self action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];
    
    //Upgrade Button
    UIImage *upgradeButtoonImage = [UIImage imageNamed:@"buildingUpgradeButton"];
    UIButton *upgradeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [upgradeButton setFrame:CGRectMake(viewWidth/2 - viewWidth/6, viewWidth/4.6, viewWidth/1.6, viewWidth/6)];
    [upgradeButton setImage:upgradeButtoonImage forState:UIControlStateNormal];
    
    //Current Building Display NOT RELEVANT RIGHT NOW UNTIL I DECIDE WHERE TO PUT IT
    
    int buildingDisplayInt = [[[buildingData getBuildingDisplayData] objectAtIndex:buildingID] intValue];
    
    /* NSString *buildingTexture = [[[buildingData buildingTypes] objectAtIndex:buildingDisplayInt] objectForKey:@"texture"];
    UIImage *buildingImage = [UIImage imageNamed:buildingTexture];
    UIImageView *buildingView = [[UIImageView alloc] initWithImage:buildingImage];
      */ CGSize buildingSize = CGSizeMake(viewWidth/4.5, viewWidth/4.3);
    //[buildingView setFrame:CGRectMake(viewWidth/1.25, viewHeight/6.25, buildingSize.width, buildingSize.height)];
    
 
    //Next Building Display
    UIImageView *nextBuildingView;
    UILabel *pricePrice;
    
    if(buildingDisplayInt < 8){
        
        //Building Image
        NSString *nextBuildingTexture = [[[buildingData buildingTypes] objectAtIndex:buildingDisplayInt + 1] objectForKey:@"texture"];
        UIImage *nextBuildingImage = [UIImage imageNamed:nextBuildingTexture];
        nextBuildingView = [[UIImageView alloc] initWithImage:nextBuildingImage];
        [nextBuildingView setFrame:CGRectMake(viewWidth/10, viewHeight/1.275, buildingSize.width, buildingSize.height)];
        
        //Building Price
        NSString *priceTextValue = [[[[buildingData buildingTypes] objectAtIndex:buildingDisplayInt + 1] objectForKey:@"price"] stringValue];
        pricePrice = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth/2, viewHeight/1.1425, viewWidth/2, viewHeight/20)];
        [pricePrice setFont:[UIFont fontWithName:@"Coder's-Crux" size:30.0]];
        [pricePrice setText:priceTextValue];
        [pricePrice setTextColor:[UIColor blackColor]];
        [pricePrice setTextAlignment:NSTextAlignmentLeft];
    }
        
    [backingView setImage:uiBackingImage];
    
    [buildingUIView addSubview:backingView];
    [buildingUIView addSubview:cross];
    //[buildingUIView addSubview:buildingView];
    
    //Add slots that defo wont work
    [mapBuildingSlots addSlotsForBuildingWithID:buildingID onView:buildingUIView];
    
    //If building is fully upgraded then this is irrelevant to add!
    if(buildingDisplayInt < 8){
        [buildingUIView addSubview:nextBuildingView];
        [buildingUIView addSubview:pricePrice];
        [buildingUIView addSubview:upgradeButton];
    }
    
    [UIView animateWithDuration:0.15 animations:^{
        [view addSubview:buildingUIView];
        [buildingUIView setFrame:CGRectMake(view.frame.size.width/2 - viewWidth/2, view.frame.size.height/2 - viewHeight/2, viewWidth, viewHeight)];
    } completion:^(BOOL finished){
        NSLog(@"Opened UI for building with id: %d", buildingID);
    }];
}
+(void)onClose:(id)sender {
    UIButton *cross = (UIButton*)sender;
    UIView *mainView = [cross superview];
    [UIView animateWithDuration:0.15 animations:^{
        [mainView setFrame:CGRectMake(-mainView.frame.size.width, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
    } completion:^(BOOL finished){
        [mainView removeFromSuperview];
        currentMapBuilding = -1;
    }];
}
+(int)getCurrentMapBuildingID {
    return currentMapBuilding;
}
@end
