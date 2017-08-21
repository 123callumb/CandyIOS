//
//  Charcter_Maker.m
//  Candy
//
//  Created by Killian Comerford on 29/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "Character_Maker.h"
#import "character_editor.h"
#import "mainTransition.h"
#import "CE_continue_button.h"

int imageState;

@implementation Character_Maker{
    SKScene *scen_;
}
- (void)didMoveToView:(SKView *)view {
    [character_editor initializeTextures:self.scene view:self.view scene:self];
}
- (void)tapMove:(SKScene*)s location:(CGPoint)p node:(SKNode*)n {
    
}
- (void)touchMovedToPoint:(CGPoint)pos {
    
}
- (void)touchUpAtPoint:(CGPoint)pos{
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
-(void)update:(CFTimeInterval)currentTime {
    [CE_continue_button testForChange:self.scene];
}

@end
