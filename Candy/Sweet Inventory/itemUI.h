//
//  itemUI.h
//  Candy
//
//  Created by Callum Beckwith on 26/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemUI : UIView
+(void)createNewItemUi: (UIView*)v slotId:(int)slotNo;
+(int)getCoinSelllingPrice: (NSString*)slotColor;
+(int)getGemSelllingPrice: (NSString*)slotColor;
@end
