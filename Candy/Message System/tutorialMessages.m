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
                                  @"Hey there! Welcome to Candy!",
                                  @"You're the fine player behind that desk over there and you're about to start making Candy!",
                                  @"To get started access the Menu by either swiping right or pressing the Menu Button"
                                  ]
     corrispondingTextures:@[@"dunnoButton", @"desk_wood", @"menuButton"]
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
                                  @"This is where all your packets of sweets are stored.",
                                  @"Everytime you open a packet you will be given a sweet. You use sweets in your candy machines to produce money.",
                                  @"Go open your first pack of sweets and see what you get! Remember some sweets are worth more than others."
                                  ]
     corrispondingTextures:@[@"myPacketsSmallButton", @"sweetMenuButton", @"dunnoButton"]
     textureScales:@[@0.3f, @0.3f, @0.4f]
     uiview:v
     endMessageIDAt:10
     displayOnce:true
     ];
}
+(void)firstTimeMenuButton: (UIView*)v {
    [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"The Menu is where you will access most things to help you run your Candy company",
                                  @"The first time you access an item on the menu you will be taught how to use it.",
                                  @"Lets start by scrolling down the menu and tapping the 'My Packets' Button",
                                  ]
     corrispondingTextures:@[@"menuButton", @"dunnoButton", @"myPacketsSmallButton"]
     textureScales:@[@0.3f, @0.3f, @0.3f]
     uiview:v
     endMessageIDAt:20
     displayOnce:true
     ];
}
+(void)firstTimeOpenedPacket: (UIView*)v {
    [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"Great Job! You can access all the sweets you currently own by pressing the 'Sweets' Button in the menu",
                                  @"To start making money you can place a sweet in your candy machine.",
                                  @"Hold down on the candy machine you would like to interact with.",
                                  ]
     corrispondingTextures:@[@"sweetMenuButton", @"coin", @"machine_default"]
     textureScales:@[@0.3f, @0.6f, @0.6f]
     uiview:v
     endMessageIDAt:80
     displayOnce:true
     ];
}
+(void)firstTimeMachine: (UIView*)v {
    [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"To equip a sweet to the machine click on a slot and select a sweet from your sweet inventory.",
                                  @"You can upgrade your machine when you have enough money. When upgraded the machine will produce sweets automatically.",
                                  @"A slot upgrade will increase the amount of sweets your machine produces.",
                                  ]
     corrispondingTextures:@[@"sweetDrawSlot", @"machineUpgradeButton", @"machineSlotUpgradeButton"]
     textureScales:@[@0.2f, @0.2f, @0.2f]
     uiview:v
     endMessageIDAt:90
     displayOnce:true
     ];
}
+(void)firstTimeAfterMachine: (UIView*)v {
    [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"Well Done! I'm sure you'll get the hang of this quickly.",
                                  @"To help your Candy operation grow faster I suggest going to complete some tasks, to access these tasks tap the 'Objectives' Button in the menu. ",
                                  @"I'll leave you to do things on your own for now then! Good Luck :)",
                                  ]
     corrispondingTextures:@[@"dunnoButton", @"achievementsButton", @"dunnoButton"]
     textureScales:@[@0.3f, @0.3f, @0.3f]
     uiview:v
     endMessageIDAt:100
     displayOnce:true
     ];
}
+(void)firstTimeObjectives: (UIView*)v {
    [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"This is your curent Objective list, when you complete an objective you are rewarded with Gems and Mini Gems",
                                  @"If you are unable to complete an objective you have the ability to skip it, however it will cost you!",
                                  ]
     corrispondingTextures:@[@"achievementsButton", @"gem"]
     textureScales:@[@0.2f, @0.2f, @0.2f]
     uiview:v
     endMessageIDAt:110
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
    [
     messageUI
     createMultipleMessageBoxes:@[
                                  @"This is the Store. Here you can buy items such as new packets of sweets and desks!",
                                  @"Some items require coins, others require gems.",
                                  ]
     corrispondingTextures:@[@"coinStoreButton", @"coin"]
     textureScales:@[@0.3f, @0.4f]
     uiview:v
     endMessageIDAt:120
     displayOnce:true
     ];
}
+(void)firstTimeDailySpin: (UIView*)v {
    [messageUI createMessageBox:v information:@"This is the Daily Spin, here you can claim a reward every day by spinning this wheel. To spin tap as fast as you can!" representingImage:@"spinWheen" imageScale:0.08 messageBoxID:124 displayOnce:true];
}
+(void)firstTimeTrends: (UIView*)v {
    [messageUI createMessageBox:v information:@"Here are the current Market Trends. Trends will determine how much your sweets are worth per tap. Trends will change every hour so always keep coming back here to maximise your profits!" representingImage:@"marketChart" imageScale:0.2 messageBoxID:34 displayOnce:true];
}
+(void)spinTimeLeft: (UIView*)v {
    [messageUI createMessageBox:v information:[NSString stringWithFormat:@"Come back in %d Hours for your Free Daily Spin! Your current Daily Spin streak is %d days!", [spinData getHoursLeft], [spinData getStreakValue]] representingImage:@"spinWheen" imageScale:0.1 messageBoxID:35 displayOnce:false];
}
@end
