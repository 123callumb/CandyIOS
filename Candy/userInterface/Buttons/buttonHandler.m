//
//  buttonHandler.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "buttonHandler.h"
#import "inventoryButton.h"
#import "sweetsButton.h"
#import "coinButton.h"
#import "menuBackButton.h"
#import "packetButton.h"
#import "menuButton.h"

@implementation buttonHandler
+(void)registerButtons:(SKNode *)obj currentScene:(SKScene *)s view:(UIView*)v{
    
    if([obj.name isEqualToString:@"buttonInventory"]){
        [inventoryButton onTouch:obj cs:s view:v];
    }
    
    if([obj.name isEqualToString:@"buttonSweets"]){
        [sweetsButton touched:obj cs:s];
    }
    
    if([obj.name isEqualToString:@"buttonMoney"]){
        [coinButton touched:obj cs:s];
    }
    if([obj.name isEqualToString:@"buttonBack"]){
        [menuBackButton onTouch:obj currentScene:s view:v];
    }
    if([obj.name isEqualToString:@"buttonPacket"]){
        [packetButton onTouch:(SKSpriteNode*)obj scene:s];
    }
    if([obj.name isEqualToString:@"buttonMenu"]){
        [menuButton onTouch:(SKSpriteNode*)obj scene:s view:v];
    }
    if([obj.name isEqualToString:@"closeButton"]){
        [menuButton onCloseButton:(SKSpriteNode*)obj scene:s];
        [packetButton reCreate:s];
    }

}
@end
