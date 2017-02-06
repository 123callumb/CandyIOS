//
//  inventoryDataHandler.m
//  Candy
//
//  Created by Callum Beckwith on 20/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "inventoryDataHandler.h"
#import "inventorySweetData.h"
#import "sweetUUID.h"

@implementation inventoryDataHandler
+(void)addSweet: (NSString*)textureName {
    
    NSString *grey = @"Grey";
    NSString *blue = @"Blue";
    NSString *red = @"Red";
    NSString *yellow = @"Yellow";
    
    //BonBon packet - there is a way to take the bon bon array and do this easier but idk how to yet!
    if([textureName isEqualToString:@"mintbonbonPacket"]){
        [inventorySweetData addSweet:@"Mint Bon Bon" sweetTextureName:@"bonbonMint" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"bonbonLimePacket"]){
        [inventorySweetData addSweet:@"Lime Bon Bon" sweetTextureName:@"bonbonLime" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"cokebonbonPacket"]){
        [inventorySweetData addSweet:@"Cola Bon Bon" sweetTextureName:@"bonbonCola" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"strawberrybonbonPacket"]){
        [inventorySweetData addSweet:@"Strawberry Bon Bon" sweetTextureName:@"bonbonStrawberry" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"bonbonLemonPacket"]){
        [inventorySweetData addSweet:@"Lemon Bon Bon" sweetTextureName:@"bonbonLemon" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"bubblegumbonbonPacket"]){
        [inventorySweetData addSweet:@"Bubblegum Bon Bon" sweetTextureName:@"bonbonBubblegum" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"bonbonTropicalPacket"]){
        [inventorySweetData addSweet:@"Tropical Bon Bon" sweetTextureName:@"bonbonTropical" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"cherrybonbonPacket"]){
        [inventorySweetData addSweet:@"Cherry Bon Bon" sweetTextureName:@"bonbonCherry" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"rainbowBonBonPacket"]){
        [inventorySweetData addSweet:@"Rainbow Bon Bon" sweetTextureName:@"bonbonRainbow" sweetColorRarity:yellow newUUID:[sweetUUID createNewSweetUUID]];
    }
    
    //Chew packet - there is a way to take the bon bon array and do this easier but idk how to yet!
    if([textureName isEqualToString:@"chewOrangePacket"]){
        [inventorySweetData addSweet:@"Orange Chew" sweetTextureName:@"chewOrange" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"chewCherryPacket"]){
        [inventorySweetData addSweet:@"Cherry Chew" sweetTextureName:@"chewCherry" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"chewVanillaPacket"]){
        [inventorySweetData addSweet:@"Vanilla Chew" sweetTextureName:@"chewVanilla" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"chewBubblegumPacket"]){
        [inventorySweetData addSweet:@"Bubblegum Chew" sweetTextureName:@"chewBubblegum" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"chewApplePacket"]){
        [inventorySweetData addSweet:@"Apple Chew" sweetTextureName:@"chewApple" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"chewSourLimePacket"]){
        [inventorySweetData addSweet:@"Sour Lime Chew" sweetTextureName:@"chewSourLime" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"chewCandyflossPacket"]){
        [inventorySweetData addSweet:@"Candyfloss Chew" sweetTextureName:@"chewCandyfloss" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"chewBananaPacket"]){
        [inventorySweetData addSweet:@"Banana Chew" sweetTextureName:@"chewBanana" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"chewFizzyColaPacket"]){
        [inventorySweetData addSweet:@"Fizzy Cola Chew" sweetTextureName:@"chewFizzyCola" sweetColorRarity:yellow newUUID:[sweetUUID createNewSweetUUID]];
    }
    
    
    //Wrapped packet - there is a way to take the bon bon array and do this easier but idk how to yet!
    if([textureName isEqualToString:@"wrappedMintPacket"]){
        [inventorySweetData addSweet:@"Mint Wrapped" sweetTextureName:@"wrappedMint" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"wrappedLimePacket"]){
        [inventorySweetData addSweet:@"Lime Wrapped" sweetTextureName:@"wrappedLime" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"wrappedCoffePacket"]){
        [inventorySweetData addSweet:@"Coffee Wrapped" sweetTextureName:@"wrappedCoffee" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"wrappedLemonPacket"]){
        [inventorySweetData addSweet:@"Lemon Wrapped" sweetTextureName:@"wrappedLemon" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"wrappedCherryPacket"]){
        [inventorySweetData addSweet:@"Cherry Wrapped" sweetTextureName:@"wrappedCherry" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"wrappedStrawberryPacket"]){
        [inventorySweetData addSweet:@"Strawberry Wrapped" sweetTextureName:@"wrappedStrawberry" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"wrappedOrangePacket"]){
        [inventorySweetData addSweet:@"Orange Wrapped" sweetTextureName:@"wrappedOrange" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"wrappedBlueberryPacket"]){
        [inventorySweetData addSweet:@"Blueberry Wrapped" sweetTextureName:@"wrappedBlueberry" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"wrappedTropicalPacket"]){
        [inventorySweetData addSweet:@"Tropical Wrapped" sweetTextureName:@"wrappedTropical" sweetColorRarity:yellow newUUID:[sweetUUID createNewSweetUUID]];
    }
    
    //Jawbreaker packet - there is a way to take the bon bon array and do this easier but idk how to yet!
    if([textureName isEqualToString:@"jawbreakerLiquoricePacket"]){
        [inventorySweetData addSweet:@"Liqourice Jawbreaker" sweetTextureName:@"jawbreakerLiquorice" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"jawbreakerLimePacket"]){
        [inventorySweetData addSweet:@"Lime Jawbreaker" sweetTextureName:@"jawbreakerLime" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"jawbreakerLemonPacket"]){
        [inventorySweetData addSweet:@"Lemon Jawbreaker" sweetTextureName:@"jawbreakerLemon" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"jawbreakerBlueberryPacket"]){
        [inventorySweetData addSweet:@"Blueberry Jawbreaker" sweetTextureName:@"jawbreakerBlueberry" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"jawbreakerStrawberryPacket"]){
        [inventorySweetData addSweet:@"Strawberry Jawbreaker" sweetTextureName:@"jawbreakerStrawberry" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"jawbreakerOrangePacket"]){
        [inventorySweetData addSweet:@"Orange Jawbreaker" sweetTextureName:@"jawbreakerOrange" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"jawbreakerCandyflossPacket"]){
        [inventorySweetData addSweet:@"Candyfloss Jawbreaker" sweetTextureName:@"jawbreakerCandyfloss" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"jawbreakerBubblegumPacket"]){
        [inventorySweetData addSweet:@"Bubblegum Jawbreaker" sweetTextureName:@"jawbreakerBubblegum" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"jawbreakerWatermelonPacket"]){
        [inventorySweetData addSweet:@"Watermelon Jawbreaker" sweetTextureName:@"jawbreakerWatermelon" sweetColorRarity:yellow newUUID:[sweetUUID createNewSweetUUID]];
    }
    
    //Lolly packet - there is a way to take the bon bon array and do this easier but idk how to yet!
    if([textureName isEqualToString:@"lollyMintPacket"]){
        [inventorySweetData addSweet:@"Mint Lolly" sweetTextureName:@"lollyMint" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"lollyLimePacket"]){
        [inventorySweetData addSweet:@"Lime Lolly" sweetTextureName:@"lollyLime" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"lollyLemonPacket"]){
        [inventorySweetData addSweet:@"Lemon Lolly" sweetTextureName:@"lollyLemon" sweetColorRarity:grey newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"lollyColaPacket"]){
        [inventorySweetData addSweet:@"Cola Lolly" sweetTextureName:@"lollyCola" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"lollyOrangePacket"]){
        [inventorySweetData addSweet:@"Orange Lolly" sweetTextureName:@"lollyOrange" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"lollyStrawberryPacket"]){
        [inventorySweetData addSweet:@"Strawberry Lolly" sweetTextureName:@"lollyStrawberry" sweetColorRarity:blue newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"lollyCherryPacket"]){
        [inventorySweetData addSweet:@"Cherry Lolly" sweetTextureName:@"lollyCherry" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"lollySherbetPacket"]){
        [inventorySweetData addSweet:@"Sherbert Lolly" sweetTextureName:@"lollySherbert" sweetColorRarity:red newUUID:[sweetUUID createNewSweetUUID]];
    }
    if([textureName isEqualToString:@"lollySourApplePacket"]){
        [inventorySweetData addSweet:@"Sour Apple Lolly" sweetTextureName:@"lollySourApple" sweetColorRarity:yellow newUUID:[sweetUUID createNewSweetUUID]];
    }
    
}
@end
