//
//  sweetShop.m
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetShop.h"
#import "sweetShopUI.h"
#import "mainTransition.h"
#import "main.h"

@implementation sweetShop
-(void)didMoveToView:(SKView *)view {
    [sweetShopUI addUIView:view];
    self.name = @"sweetShopScene";
}
+(void)changeScene {
    main *scene = (main *)[SKScene nodeWithFileNamed:@"main"];
    [mainTransition switchScene:scene sceneTwo:@"main" Transition:[SKTransition doorsOpenVerticalWithDuration:0.4]];
}

@end
