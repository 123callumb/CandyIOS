;//
//  mapBuildingUI.h
//  Candy
//
//  Created by Callum Beckwith on 17/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mapBuildingUI : UIView
+(void)openBuildingUIForBuildingWithID:(int)buildingID forView:(UIView*)view;
+(int)getCurrentMapBuildingID;
@end
