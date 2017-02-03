//
//  storeItemUI.m
//  Candy
//
//  Created by Callum Beckwith on 07/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "storeItemUI.h"
#import "floorStore.h"
#import "deskStore.h"
#import "workstationStore.h"
#import "packetStore.h"

@implementation storeItemUI
+(void)createItemUI: (UIScrollView*)v itemID:(int)itemNumber shopTexture:(NSString*)shopStyle startTagAt:(int)tag itemTexture:(NSString*)itemTexture itemScale:(float)itemScale itemName:(NSString*)itemName itemPrice:(int)price owned:(bool)doesOwnItem{
    
    float containerW = v.frame.size.width;
    float containerH = v.frame.size.height/2;
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, (containerH*itemNumber), containerW, containerH)];
    
    UIImage *containerBG = [UIImage imageNamed:shopStyle];
    UIImage *floorTexture = [UIImage imageNamed:itemTexture];
    
    float itemW = floorTexture.size.width * itemScale;
    float itemH = floorTexture.size.height * itemScale;
    
    UIImageView *containerBackgroundView = [[UIImageView alloc] initWithImage:containerBG];
    containerBackgroundView.frame = CGRectMake(0, 0, containerW, containerH);
    
    UIView *itemDisplayView = [[UIView alloc] initWithFrame:CGRectMake(containerW/2 - (containerW/1.07)/2, containerH/18, containerW/1.07, containerH/1.58)];
    
    UIImageView *itemInWindow = [[UIImageView alloc] initWithImage:floorTexture];
    itemInWindow.frame = CGRectMake(itemDisplayView.frame.size.width/2 - itemW/2, itemDisplayView.frame.size.height/2 - itemH/2, itemW, itemH);
    
    itemDisplayView.clipsToBounds = YES;
    
    UILabel *itemLabelName = [[UILabel alloc] initWithFrame:CGRectMake(containerW/20, containerH - containerH/3.4, containerW/2, containerH/4)];
    [itemLabelName setFont:[UIFont fontWithName:@"Coder's-Crux" size:30.0f]];
    [itemLabelName setText:itemName];
    
    UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buyButtonImage = [UIImage imageNamed:@"storeBuyButton"];
    [buyButton setImage:buyButtonImage forState:UIControlStateNormal];
    buyButton.frame = CGRectMake(containerW - containerW/20 -containerW/6, containerH - containerH/3.8, containerW/6, containerH/6);
    
    UIButton *equipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *equipImageButton = [UIImage imageNamed:@"useButton"];
    [equipButton setImage:equipImageButton forState:UIControlStateNormal];
    equipButton.frame = CGRectMake(containerW - containerW/20 - containerW/4.5, containerH - containerH/3.8, containerW/4.5, containerH/6);
    
    UIButton *priceAndEquipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *priceLabelTexture = [UIImage imageNamed:@"coinStorePrice"];
    [priceAndEquipButton setImage:priceLabelTexture forState:UIControlStateNormal];
    priceAndEquipButton.frame = CGRectMake(containerW - containerW/20 -containerW/2.5, containerH - containerH/3.8, containerW/4.5, containerH/6);
    
    UILabel *priceTag = [[UILabel alloc] initWithFrame:CGRectMake(containerW - containerW/2.15, containerH - containerH/3.8, containerW/4.5, containerH/6)];
    [priceTag setFont:[UIFont fontWithName:@"Coder's-Crux" size:20.0f]];
    [priceTag setText:[NSString stringWithFormat:@"%d", price]];
    [priceTag setTextAlignment:NSTextAlignmentRight];
    
    [itemDisplayView addSubview:itemInWindow];
    
    [container addSubview:containerBackgroundView];
    [container addSubview:itemDisplayView];
    [container addSubview:itemLabelName];
    
    
    if(!doesOwnItem){
        SEL onBuyPress = @selector(onBuyPress:);
        buyButton.tag = tag + itemNumber;
        [buyButton addTarget:self action:onBuyPress forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:priceAndEquipButton];
        [container addSubview:buyButton];
        [container addSubview:priceTag];
    }else {
        SEL onEquipPress = @selector(onEquipPress:);
        equipButton.tag = tag + itemNumber;
        [equipButton addTarget:self action:onEquipPress forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:equipButton];
    }
    
    container.tag = 40000;
    
    [v addSubview:container];
}
+(void)onBuyPress: (id)sender {
    UIButton *button = (UIButton*)sender;
    int buttonTag = (int)button.tag;
    [floorStore onBuy:buttonTag];
    [deskStore onBuy:buttonTag];
    [workstationStore onBuy:buttonTag];
    [self refreshItemUI:button];
    
}
+(void)onEquipPress: (id)sender {
    UIButton *button = (UIButton*)sender;
    int buttonTag = (int)button.tag;
    [floorStore onEquip:buttonTag];
    [deskStore onEquip:buttonTag];
    [workstationStore onEquip:buttonTag];
    [self refreshItemUI:button];
}
+(void)refreshItemUI: (UIButton*)button {
    UIView *v1 = [button superview];
    UIView *v = [v1 superview];
    [v removeFromSuperview];
}
+(void)nonOwnedItemUI: (UIScrollView*)v itemID:(int)itemNumber shopTexture:(NSString*)shopStyle startTagAt:(int)tag itemTexture:(NSString*)itemTexture itemScale:(float)itemScale itemName:(NSString*)itemName itemPrice:(int)price {
    
    float containerW = v.frame.size.width;
    float containerH = v.frame.size.height/2;
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, (containerH*itemNumber), containerW, containerH)];
    
    UIImage *containerBG = [UIImage imageNamed:shopStyle];
    UIImage *floorTexture = [UIImage imageNamed:itemTexture];
    
    float itemW = floorTexture.size.width * itemScale;
    float itemH = floorTexture.size.height * itemScale;
    
    UIImageView *containerBackgroundView = [[UIImageView alloc] initWithImage:containerBG];
    containerBackgroundView.frame = CGRectMake(0, 0, containerW, containerH);
    
    UIView *itemDisplayView = [[UIView alloc] initWithFrame:CGRectMake(containerW/2 - (containerW/1.07)/2, containerH/18, containerW/1.07, containerH/1.58)];
    
    UIImageView *itemInWindow = [[UIImageView alloc] initWithImage:floorTexture];
    itemInWindow.frame = CGRectMake(itemDisplayView.frame.size.width/2 - itemW/2, itemDisplayView.frame.size.height/2 - itemH/2, itemW, itemH);
    
    itemDisplayView.clipsToBounds = YES;
    
    UILabel *itemLabelName = [[UILabel alloc] initWithFrame:CGRectMake(containerW/20, containerH - containerH/3.4, containerW/2, containerH/4)];
    [itemLabelName setFont:[UIFont fontWithName:@"Coder's-Crux" size:30.0f]];
    [itemLabelName setText:itemName];
    
    UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buyButtonImage = [UIImage imageNamed:@"storeBuyButton"];
    [buyButton setImage:buyButtonImage forState:UIControlStateNormal];
    buyButton.frame = CGRectMake(containerW - containerW/20 -containerW/6, containerH - containerH/3.8, containerW/6, containerH/6);
    
    UIButton *equipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *equipImageButton = [UIImage imageNamed:@"useButton"];
    [equipButton setImage:equipImageButton forState:UIControlStateNormal];
    equipButton.frame = CGRectMake(containerW - containerW/20 - containerW/4.5, containerH - containerH/3.8, containerW/4.5, containerH/6);
    
    UIButton *priceAndEquipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *priceLabelTexture = [UIImage imageNamed:@"gemStorePrice"];
    [priceAndEquipButton setImage:priceLabelTexture forState:UIControlStateNormal];
    priceAndEquipButton.frame = CGRectMake(containerW - containerW/20 -containerW/2.5, containerH - containerH/3.8, containerW/4.5, containerH/6);
    
    UILabel *priceTag = [[UILabel alloc] initWithFrame:CGRectMake(containerW - containerW/2.15, containerH - containerH/3.8, containerW/4.5, containerH/6)];
    [priceTag setFont:[UIFont fontWithName:@"Coder's-Crux" size:20.0f]];
    [priceTag setText:[NSString stringWithFormat:@"%d", price]];
    [priceTag setTextAlignment:NSTextAlignmentRight];
    
    [itemDisplayView addSubview:itemInWindow];
    
    [container addSubview:containerBackgroundView];
    [container addSubview:itemDisplayView];
    [container addSubview:itemLabelName];
    
    SEL onBuyPress = @selector(onNonOwnedBuyPress:);
    buyButton.tag = tag + itemNumber;
    [buyButton addTarget:self action:onBuyPress forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:priceAndEquipButton];
    [container addSubview:buyButton];
    [container addSubview:priceTag];
    
    container.tag = 40000;
    
    [v addSubview:container];
}
+(void)onNonOwnedBuyPress: (id)sender {
    UIButton *button = (UIButton*)sender;
    int buttonTag = (int)button.tag;
    [packetStore onBuy:buttonTag];
}
@end
