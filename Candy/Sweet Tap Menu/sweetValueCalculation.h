//
//  sweetValueCalculation.h
//  Candy
//
//  Created by Callum Beckwith on 30/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface sweetValueCalculation : UIView
+(int)calculateSkValue: (SKSpriteNode*)sweetNode;
+(int)calculateTextureValue: (NSString*)sweetTextureName;
@end
