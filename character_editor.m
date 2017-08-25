//
//  character_editor.m
//  Candy
//
//  Created by Killian Comerford on 22/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "character_editor.h"
#import "CE_menu_buttons.h"
#import "CE_continue_button.h"
#import "CE_hats_menu.h"
#import "CE_pants_menu.h"
#import "CE_shirts_menu.h"
#import "CE_shoes_menu.h"
#import "CE_skin_menu.h"
#import "display_character.h"


double scale = .3413;
@implementation character_editor
+(void)initializeTextures:(SKScene*)s view:(SKView*)v scene:(SKScene*)scene{
    UIView *view = [[UIView alloc] initWithFrame:v.frame];
    view.tag = 11112;
    //view.backgroundColor = [UIColor blueColor];
//    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background_character_editor"];
//    background.xScale = scale;
//    background.yScale = scale;
    UIImageView *back = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    [back setImage:[UIImage imageNamed:@"background_character_editor"]];

//    [s addChild:background];
    [view addSubview:back];
    [CE_menu_buttons initializeTextures:view];
    [CE_continue_button initializeTextures:view scene:scene];
    [CE_hats_menu initializeScrollView:view skScene:s];
    [CE_pants_menu initializeScrollView:view skScene:s];
    [CE_shirts_menu initializeScrollView:view skScene:s];
    [CE_shoes_menu initializeScrollView:view skScene:s];
    [CE_skin_menu initializeScrollView:view skScene:s];
    [v addSubview:view];
    [display_character display:view size:2.1 xPos:view.frame.size.width/2-((view.frame.size.width/2.1)/2)+15 yPos:0];
}
@end
