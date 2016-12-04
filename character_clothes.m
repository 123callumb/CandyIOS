//
//  character_clothes.m
//  Character_Maker
//
//  Created by Killian Comerford on 24/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import "character_clothes.h"
#import "selection_bar.h"
#import "skinColour.h"
#import "Save.h"

int imageState;
int hatsNum;
int shirtsNum;
int pantsNum;
int shoesNum;
int presetsNum;

int currentHat;
int currentShirt;
int currentPants;
int currentShoes;
int currentPre;

SKSpriteNode *hats = nil;
SKSpriteNode *shirts = nil;
SKSpriteNode *pants = nil;
SKSpriteNode *shoes = nil;
SKSpriteNode *pre = nil;

SKSpriteNode *nextbtn = nil;
SKSpriteNode *prevbtn = nil;

@implementation character_clothes
+(void)initializeSprites:(SKScene*)s imageState:(int)img{
    
    imageState = img;
    
    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"cEditorBgTemp"];
    SKSpriteNode *bgborder = [SKSpriteNode spriteNodeWithImageNamed:@"spr_gray_background_border_0"];
    SKSpriteNode *base = [SKSpriteNode spriteNodeWithImageNamed:@"spr_character_base_0"];
    
    bg.yScale = 1.35;
    bg.xScale = 1.35;
    bg.zPosition = 0;
    
    hats = [SKSpriteNode spriteNodeWithImageNamed:@"spr_hats_0"];
    shirts = [SKSpriteNode spriteNodeWithImageNamed:@"spr_shirts_0"];
    pants = [SKSpriteNode spriteNodeWithImageNamed:@"spr_pants_0"];
    shoes = [SKSpriteNode spriteNodeWithImageNamed:@"spr_shoes_0"];
    pre = [SKSpriteNode spriteNodeWithImageNamed:@"spr_presets_0"];
    
    nextbtn = [SKSpriteNode spriteNodeWithImageNamed:@"arrowRight"];
    prevbtn = [SKSpriteNode spriteNodeWithImageNamed:@"arrrowLeft"];
    
    hatsNum = 7;
    shirtsNum= 7;
    pantsNum = 7;
    shoesNum = 7;
    presetsNum = 7;
    
    currentHat = 0;
    currentPre = 0;
    currentShirt = 0;
    currentPants = 0;
    currentShoes = 0;
    
    nextbtn.anchorPoint = CGPointMake(0.5, 0.5);
    prevbtn.anchorPoint = CGPointMake(0.5, 0.5);
    
    nextbtn.name=@"next";
    prevbtn.name=@"prev";
    
    nextbtn.xScale = 0.43;
    nextbtn.yScale = 0.43;
    prevbtn.xScale = 0.43;
    prevbtn.yScale = 0.43;
    
    bg.position = CGPointMake(s.frame.size.width / 2, s.frame.size.height / 2);
    bgborder.position = CGPointMake(s.frame.size.width / 2, s.frame.size.height / 2);
    
    CGPoint personPos = CGPointMake(s.frame.size.width/1.9, s.frame.size.height/1.65);
    
    base.position = personPos;
    hats.position = personPos;
    shirts.position = personPos;
    pants.position = personPos;
    shoes.position = personPos;
    pre.position = personPos;
    nextbtn.position = CGPointMake(s.frame.size.width/2 + nextbtn.frame.size.width*2, s.frame.size.height / 1.7);
    prevbtn.position = CGPointMake(s.frame.size.width/2 - prevbtn.frame.size.width*2, s.frame.size.height / 1.7);
    
    [selection_bar spawn:s];
    
    [s addChild:bg];
    // [s addChild:bgborder];
    [s addChild:base];
    
    [skinColour SpawnTextures:s];
    
    [s addChild:shoes];
    [s addChild:pants];
    [s addChild:shirts];
    [s addChild:hats];
    
    [s addChild:pre];
    [s addChild:nextbtn];
    [s addChild:prevbtn];
}
+(void)onTouch:(SKNode*)n{
    if([n.name isEqualToString:@"next"]){
        if(imageState == 0)currentHat++;
        else if(imageState == 1)currentPants++;
        else if(imageState == 2)currentShirt++;
        else if(imageState == 3)currentShoes++;
        else if(imageState == 4)currentPre++;
        
        nextbtn.texture = [SKTexture textureWithImageNamed:@"arrowRight"];
        SKAction *delay = [SKAction waitForDuration:0.2];
        [nextbtn runAction:delay completion:^{
            nextbtn.texture = [SKTexture textureWithImageNamed:@"arrowRight"];
        }];
    }
    else if([n.name isEqualToString:@"prev"]){
        if(imageState == 0)currentHat-=1;
        else if(imageState == 1)currentPants-=1;
        else if(imageState == 2)currentShirt-=1;
        else if(imageState == 3)currentShoes-=1;
        else if(imageState == 4)currentPre-=1;
        
        prevbtn.texture = [SKTexture textureWithImageNamed:@"arrrowLeft"];
        SKAction *delay = [SKAction waitForDuration:0.2];
        [prevbtn runAction:delay completion:^{
            prevbtn.texture = [SKTexture textureWithImageNamed:@"arrrowLeft"];
        }];
        
    }
    
    
    if(imageState == 4){
        hats.hidden=true;
        shirts.hidden=true;
        pants.hidden=true;
        shoes.hidden=true;
        pre.hidden=false;
    }
    else if(imageState!=4){
        hats.hidden=false;
        shirts.hidden=false;
        pants.hidden=false;
        shoes.hidden=false;
        pre.hidden=true;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_0" forKey:@"hatsVal"];
    [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_0" forKey:@"shirtsVal"];
    [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_0" forKey:@"pantsVal"];
    [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_0" forKey:@"shoesVal"];
    [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_0" forKey:@"presetVal"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [character_clothes hatsSelector];
    [character_clothes shirtsSelector];
    [character_clothes pantsSelector];
    [character_clothes shoesSelector];
    [character_clothes preSelector];
}

+(void)hatsSelector{
    if(currentHat == -1){currentHat = hatsNum;}
    if(currentHat == (hatsNum + 1)){currentHat = 0;}
    if(currentHat == 0){
        hats.texture = [SKTexture textureWithImageNamed:@"spr_hats_0"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_0" forKey:@"hatsVal"];
    }
    if(currentHat == 1){
        hats.texture = [SKTexture textureWithImageNamed:@"spr_hats_1"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_1" forKey:@"hatsVal"];
    }
    if(currentHat == 2){
        hats.texture = [SKTexture textureWithImageNamed:@"spr_hats_2"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_2" forKey:@"hatsVal"];
    }
    if(currentHat == 3){
        hats.texture = [SKTexture textureWithImageNamed:@"spr_hats_3"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_3" forKey:@"hatsVal"];
    }
    if(currentHat == 4){
        hats.texture = [SKTexture textureWithImageNamed:@"spr_hats_4"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_4" forKey:@"hatsVal"];
    }
    if(currentHat == 5){
        hats.texture = [SKTexture textureWithImageNamed:@"spr_hats_5"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_5" forKey:@"hatsVal"];
    }
    if(currentHat == 6){
        hats.texture = [SKTexture textureWithImageNamed:@"spr_hats_6"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_6" forKey:@"hatsVal"];
    }
    if(currentHat == 7){
        hats.texture = [SKTexture textureWithImageNamed:@"spr_hats_7"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_hats_7" forKey:@"hatsVal"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)shirtsSelector{
    if(currentShirt == -1){currentShirt = shirtsNum;}
    if(currentShirt == (shirtsNum + 1)){currentShirt = 0;}
    if(currentShirt == 0){
        shirts.texture = [SKTexture textureWithImageNamed:@"spr_shirts_0"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_0" forKey:@"shirtsVal"];
    }
    if(currentShirt == 1){
        shirts.texture = [SKTexture textureWithImageNamed:@"spr_shirts_1"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_1" forKey:@"shirtsVal"];
    }
    if(currentShirt == 2){
        shirts.texture = [SKTexture textureWithImageNamed:@"spr_shirts_2"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_2" forKey:@"shirtsVal"];
    }
    if(currentShirt == 3){
        shirts.texture = [SKTexture textureWithImageNamed:@"spr_shirts_3"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_3" forKey:@"shirtsVal"];
    }
    if(currentShirt == 4){
        shirts.texture = [SKTexture textureWithImageNamed:@"spr_shirts_4"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_4" forKey:@"shirtsVal"];
    }
    if(currentShirt == 5){
        shirts.texture = [SKTexture textureWithImageNamed:@"spr_shirts_5"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_5" forKey:@"shirtsVal"];
    }
    if(currentShirt == 6){
        shirts.texture = [SKTexture textureWithImageNamed:@"spr_shirts_6"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_6" forKey:@"shirtsVal"];
    }
    if(currentShirt == 7){
        shirts.texture = [SKTexture textureWithImageNamed:@"spr_shirts_7"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shirts_7" forKey:@"shirtsVal"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)pantsSelector{
    if(currentPants == -1){currentPants = pantsNum;}
    if(currentPants == (pantsNum + 1)){currentPants = 0;}
    if(currentPants == 0){
        pants.texture = [SKTexture textureWithImageNamed:@"spr_pants_0"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_0" forKey:@"pantsVal"];
    }
    if(currentPants == 1){
        pants.texture = [SKTexture textureWithImageNamed:@"spr_pants_1"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_1" forKey:@"pantsVal"];
    }
    if(currentPants == 2){
        pants.texture = [SKTexture textureWithImageNamed:@"spr_pants_2"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_2" forKey:@"pantsVal"];
    }
    if(currentPants == 3){
        pants.texture = [SKTexture textureWithImageNamed:@"spr_pants_3"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_3" forKey:@"pantsVal"];
    }
    if(currentPants == 4){
        pants.texture = [SKTexture textureWithImageNamed:@"spr_pants_4"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_4" forKey:@"pantsVal"];
    }
    if(currentPants == 5){
        pants.texture = [SKTexture textureWithImageNamed:@"spr_pants_5"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_5" forKey:@"pantsVal"];
    }
    if(currentPants == 6){
        pants.texture = [SKTexture textureWithImageNamed:@"spr_pants_6"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_6" forKey:@"pantsVal"];
    }
    if(currentPants == 7){
        pants.texture = [SKTexture textureWithImageNamed:@"spr_pants_7"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_pants_7" forKey:@"pantsVal"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)shoesSelector{
    if(currentShoes == -1){currentShoes = shoesNum;}
    if(currentShoes == (shoesNum + 1)){currentShoes = 0;}
    if(currentShoes == 0){
        shoes.texture = [SKTexture textureWithImageNamed:@"spr_shoes_0"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_0" forKey:@"shoesVal"];
    }
    if(currentShoes == 1){
        shoes.texture = [SKTexture textureWithImageNamed:@"spr_shoes_1"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_1" forKey:@"shoesVal"];
    }
    if(currentShoes == 2){
        shoes.texture = [SKTexture textureWithImageNamed:@"spr_shoes_2"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_2" forKey:@"shoesVal"];
    }
    if(currentShoes == 3){
        shoes.texture = [SKTexture textureWithImageNamed:@"spr_shoes_3"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_3" forKey:@"shoesVal"];
    }
    if(currentShoes == 4){
        shoes.texture = [SKTexture textureWithImageNamed:@"spr_shoes_4"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_4" forKey:@"shoesVal"];
    }
    if(currentShoes == 5){
        shoes.texture = [SKTexture textureWithImageNamed:@"spr_shoes_5"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_5" forKey:@"shoesVal"];
    }
    if(currentShoes == 6){
        shoes.texture = [SKTexture textureWithImageNamed:@"spr_shoes_6"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_6" forKey:@"shoesVal"];
    }
    if(currentShoes == 7){
        shoes.texture = [SKTexture textureWithImageNamed:@"spr_shoes_7"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_shoes_7" forKey:@"shoesVal"];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)preSelector{
    if(currentPre == -1){currentPre = presetsNum;}
    if(currentPre == (presetsNum + 1)){currentPre = 0;}
    if(currentPre == 0){
        pre.texture = [SKTexture textureWithImageNamed:@"spr_presets_0"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_0" forKey:@"presetVal"];
    }
    if(currentPre == 1){
        pre.texture = [SKTexture textureWithImageNamed:@"spr_presets_1"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_1" forKey:@"presetVal"];
    }
    if(currentPre == 2){
        pre.texture = [SKTexture textureWithImageNamed:@"spr_presets_2"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_2" forKey:@"presetVal"];
    }
    if(currentPre == 3){
        pre.texture = [SKTexture textureWithImageNamed:@"spr_presets_3"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_3" forKey:@"presetVal"];
    }
    if(currentPre == 4){
        pre.texture = [SKTexture textureWithImageNamed:@"spr_presets_4"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_4" forKey:@"presetVal"];
    }
    if(currentPre == 5){
        pre.texture = [SKTexture textureWithImageNamed:@"spr_presets_5"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_5" forKey:@"presetVal"];
    }
    if(currentPre == 6){
        pre.texture = [SKTexture textureWithImageNamed:@"spr_presets_6"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_6" forKey:@"presetVal"];
    }
    if(currentPre == 7){
        pre.texture = [SKTexture textureWithImageNamed:@"spr_presets_7"];
        [[NSUserDefaults standardUserDefaults] setObject:@"spr_presets_7" forKey:@"presetVal"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
