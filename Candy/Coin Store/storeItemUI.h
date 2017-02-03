//
//  storeItemUI.h
//  Candy
//
//  Created by Callum Beckwith on 07/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface storeItemUI : UIView
+(void)createItemUI: (UIScrollView*)v itemID:(int)itemNumber shopTexture:(NSString*)shopStyle startTagAt:(int)tag itemTexture:(NSString*)itemTexture itemScale:(float)itemScale itemName:(NSString*)itemName itemPrice:(int)price owned:(bool)doesOwnItem;
+(void)nonOwnedItemUI: (UIScrollView*)v itemID:(int)itemNumber shopTexture:(NSString*)shopStyle startTagAt:(int)tag itemTexture:(NSString*)itemTexture itemScale:(float)itemScale itemName:(NSString*)itemName itemPrice:(int)price;
@end
