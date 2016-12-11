//
//  packetsScene.m
//  Candy
//
//  Created by Callum Beckwith on 11/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetsScene.h"
#import "packetSKUI.h"

@implementation packetsScene
-(void)didMoveToView:(SKView *)view {
    self.anchorPoint = CGPointMake(0.5, 0.5);
    [packetSKUI addPacketUI:self];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [packetSKUI onBackTouch:self obj:obj];
}
@end
