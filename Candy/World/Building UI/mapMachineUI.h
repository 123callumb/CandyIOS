//
//  mapMachineUI.h
//  Candy
//
//  Created by Callum Beckwith on 19/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mapMachineUI : UIView
+(int)getCurrentMapMachineID;
+(void)createMachineUi:(UIView*)view machineID:(int)machineID;
@end
