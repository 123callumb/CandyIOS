//
//  candyMachines.m
//  Candy
//
//  Created by Killian Comerford on 02/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "candyMachines.h"
#import "determineSweetTap.h"

SKSpriteNode *machineBase;
SKSpriteNode *stamper;
SKSpriteNode *button;

@implementation candyMachines
+(void)addCandyMachines: (NSMutableArray*)machines {
    [self createCandyMachine:@"machine_default" onPressTexture:@"machine_default_1" machineList:machines];
}
+(NSMutableArray*)getCandyMachines {
    NSMutableArray *candyMachines = [[NSMutableArray alloc] init];
    [self addCandyMachines:candyMachines];
    return candyMachines;
}
+(void)createCandyMachine: (NSString*)texture1 onPressTexture:(NSString*)texturePressed machineList:(NSMutableArray*)machines {
    NSMutableDictionary *candyMachineData = [[NSMutableDictionary alloc] init];
    [candyMachineData setObject:texture1 forKey:@"texture"];
    [candyMachineData setObject:texturePressed forKey:@"texture_pressed"];
    [machines addObject:candyMachineData];
}
+(void)setCurrentCandyMachineID: (int)machineID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:machineID forKey:@"candyMachine_ID"];
    [nd synchronize];
}
+(int)getCurrentCandyMachineID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"candyMachine_ID"];
}
+(NSString*)getCurrentCandyMachineTexture {
    NSMutableDictionary *candyMachineData = [[self getCandyMachines] objectAtIndex:[self getCurrentCandyMachineID]];
    return [candyMachineData objectForKey:@"texture"];
}
+(NSString*)getCurrentCandyMachineTextureOnPress {
    NSMutableDictionary *candyMachineData = [[self getCandyMachines] objectAtIndex:[self getCurrentCandyMachineID]];
    return [candyMachineData objectForKey:@"texture_pressed"];
}
+(void)addCandyMachine: (SKSpriteNode*)s scale:(float)scale position:(CGPoint)pos {
    SKSpriteNode *candyMachine = [SKSpriteNode spriteNodeWithImageNamed:[self getCurrentCandyMachineTexture]];
    candyMachine.xScale = scale;
    candyMachine.yScale = scale;
    candyMachine.position = pos;
    candyMachine.name = @"candyMachine";
    [s addChild:candyMachine];
}
+(void)onTouch:(SKScene*)s{
    SKSpriteNode *desk = (SKSpriteNode*)[s childNodeWithName:@"desk"];
    SKSpriteNode *machine = (SKSpriteNode*)[desk childNodeWithName:@"candyMachine"];
    
    CGPoint deskSweetSpawnPlace = CGPointMake(desk.position.x - desk.frame.size.width/2, desk.position.y + desk.frame.size.height/2);
    
    [self animateMachine:machine scene:s position:deskSweetSpawnPlace];

    SKSpriteNode *floor = (SKSpriteNode*)[s childNodeWithName:@"levelFloor"];
    [floor enumerateChildNodesWithName:@"workstation" usingBlock:^(SKNode *workstation, BOOL *stop){
       
        SKSpriteNode *machine = (SKSpriteNode*)[workstation childNodeWithName:@"candyMachine"];
        
        CGPoint sweetSpawnPlace = CGPointMake(workstation.position.x - workstation.frame.size.width/10, workstation.position.y - workstation.frame.size.height/9);
        
        [self animateMachine:machine scene:s position:sweetSpawnPlace];

        
    }];
    
    
    
}
+(void)animateMachine: (SKSpriteNode*)node scene:(SKScene*)s position:(CGPoint)pos {
    node.texture = [SKTexture textureWithImageNamed:[self getCurrentCandyMachineTextureOnPress]];
    
    SKAction *delay = [SKAction waitForDuration:0.03];
    
    [node runAction:delay completion:^{
        node.texture = [SKTexture textureWithImageNamed:[self getCurrentCandyMachineTexture]];
    }];
    [determineSweetTap spawn:s location:pos];
}
@end
