//
//  taps.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "taps.h"
#import "coinBarSprite.h"
#import "money.h"
#import "combo.h"
#import "comboBar.h"
#import "comboTimer.h"
#import "defaultSweet.h"
#import "nodeToParticle.h"
#import "menuHandler.h"
#import "sweetnessSlider.h"
#import "determineSweetTap.h"
#import "fiftyTapBonus.h"
#import "box1.h"
#import "sweetInventoryData.h"
#import "gems.h"
#import "candyMachineInteraction.h"
#import "trendsData.h"
#import "candyMachineUI.h"
#import "objectivesBronze.h"
#import "objectivesSilver.h"

@implementation taps
+(void)onPressed: (SKScene *)s location:(CGPoint)p view:(UIView*)v {
    SKNode *obj = [s nodeAtPoint:p];
    if([menuHandler getCurrentMenu] == 4){
            [self randomTapTests];
            [coinBarSprite updateText:s];
            [fiftyTapBonus tapCollector:s];
            [fiftyTapBonus onTouchofBonus:(SKSpriteNode*)obj scene:s];
            [candyMachineInteraction animateAllCandyMachinesOnTap:s];
           // [candyMachineInteraction onCandyMachineTouch:(SKSpriteNode*)obj scene:s view:v];
            [objectivesBronze object3:v];
            [objectivesSilver object2:v];
    }else {
        //Menu interaction here!
        [candyMachineInteraction onBackButton:(SKSpriteNode*)obj view:v];
        [candyMachineUI onUpgradeMachine:s machineID:[candyMachineInteraction getCurrentSelectedMachine] node:(SKSpriteNode*)obj view:v];
    }
    [trendsData keepTrendsUpdated];
}

+(void)onRelease: (SKScene*)s {

}

+(void)onMovement: (SKScene*)s location:(CGPoint)p node:(SKNode*)n {
    
}

+(void)randomTapTests {

}
@end
