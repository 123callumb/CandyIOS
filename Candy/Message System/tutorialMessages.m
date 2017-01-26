//
//  tutorialMessages.m
//  Candy
//
//  Created by Callum Beckwith on 09/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "tutorialMessages.h"
#import "messageUI.h"
#import "spinData.h"

@implementation tutorialMessages

+(void)firstTimeLoadMessages: (UIView*)v {
     [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"Hey there! Welcome to Candy! I see you're new here? Well then, we better show you around :)",
                                  @"This is your current base of operation, but don't worry, I'm sure you'll be able to improve it over time.",
                                  @"To get you started you're going to want some sweets, what better way to get sweets than by opening a packet of them, tap the sweet icon in the top right corner!"
                                  ]
     corrispondingTextures:@[@"dunnoButton", @"starterHouse", @"packetsButton"]
     textureScales:@[@0.3f, @0.15f, @0.3f]
     uiview:v
     endMessageIDAt:4
     displayOnce:true
     ];
}
+(void)firstTimePacktsButton: (UIView*)v {
    [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"This is the sweets packet menu. Here you can buy packets of sweets, each sweet packet will contain different rarities of a sweet, the more rare the sweet the more you will recieve from selling it",
                                  @"This is where all your unopened packets of sweets will go, after youve opened a packet the sweet will then go to your sweet inventory",
                                  @"Go Buy your first packet and open it!"
                                  ]
     corrispondingTextures:@[@"buyPacketsButton", @"myPacketsButton", @"buyPacketsButton"]
     textureScales:@[@0.15f, @0.15f, @0.15f]
     uiview:v
     endMessageIDAt:10
     displayOnce:true
     ];
}
+(void)firstTimeMenuButton: (UIView*)v {
    [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"This is the main menu. There are three main buttons.",
                                  @"This is the Utilities Menu. Here you can access the Coin Store, Gemerator, Player Attributes, Your Sweet Inventory and the Map",
                                  @"This is the Current Operation Menu. Here you can see your current building as well as the sweets you have in producion.",
                                  @"This is the Upgraded Menu, here you can upgrade your productivity skills which will increase the amount of money you generate!"
                                  ]
     corrispondingTextures:@[@"menuButton", @"moneyButton", @"pointlessButton", @"sweetStoreButtonBetter"]
     textureScales:@[@0.3f, @0.3f, @0.3f, @0.3f]
     uiview:v
     endMessageIDAt:20
     displayOnce:true
     ];
}
+(void)firstTimeGemeratorButton: (UIView*)v {
    [messageUI createMessageBox:v
                    information:@"This is the Gemerator. Here you can exchange your Mini Gems for full sized Gems. Tap to place a Mini Gem in the bag. Once 15 are inside a Gem will be created!"
    representingImage:@"gemBag" imageScale:0.4 messageBoxID:31 displayOnce:true];
}
+(void)firstTimeSweetInvButton: (UIView*)v {
    [messageUI createMessageBox:v
                    information:@"This is your Sweet Inventory. Here you can see the sweets you have opened from packets. You can sell these sweets for either Mini Gems or Coins, however, make sure you still have some left to use in production"
              representingImage:@"sweetMenuButton" imageScale:0.3 messageBoxID:32 displayOnce:true];
}
+(void)firstTimeStoreButton: (UIView*)v {
    [messageUI createMessageBox:v
                    information:@"This is the Store. Here you can buy building items such as desks and new floors to help you customise your place!"
              representingImage:@"coinStoreButton" imageScale:0.3 messageBoxID:33 displayOnce:true];
}
+(void)firstTimeTrends: (UIView*)v {
    [messageUI createMessageBox:v information:@"Here are the current Market Trends. Trends will determine how much your sweets are worth per tap. Trends will change every hour so always keep coming back here to maximise your profits!" representingImage:@"marketChart" imageScale:0.2 messageBoxID:34 displayOnce:true];
}
+(void)spinTimeLeft: (UIView*)v {
    [messageUI createMessageBox:v information:[NSString stringWithFormat:@"Come back in %d Hours for your Free Daily Spin! Your current Daily Spin streak is %d days!", [spinData getHoursLeft], [spinData getStreakValue]] representingImage:@"spinWheen" imageScale:0.1 messageBoxID:35 displayOnce:false];
}
@end
