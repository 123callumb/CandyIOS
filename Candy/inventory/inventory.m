//
//  inventory.m
//  Candy
//
//  Created by Callum Beckwith on 09/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "inventory.h"
#import "slot1Data.h"

@implementation inventory

+(int)calculateValue {
    return 1;
}
+(int)slotCalculation: (int)slotNumber {
    
    int sweetType = [slot1Data getSweet:slotNumber];
    int sweetFlavour = [slot1Data getFlavour:slotNumber];
    int sS = [slot1Data getSweetness:slotNumber];
    
    //NSLog(@"Slot %d (Type:%d) (Flavour:%d) (Sweetness:%d)", slotNumber, sweetType, sweetFlavour, sS);
    
    int slotValue = 1;
    
    if(sweetType == 0){
        
        int mintSweetness = [self sweetnessReturn:sS v0:4 v1:3 v2:2 v3:1 v4:1 v5:1 v6:1 v7:1 v8:1];
        int colaSweetness = [self sweetnessReturn:sS v0:1 v1:2 v2:3 v3:3 v4:3 v5:3 v6:3 v7:3 v8:4];
        int strawberrySweetness = [self sweetnessReturn:sS v0:3 v1:3 v2:3 v3:3 v4:3 v5:4 v6:4 v7:4 v8:4];
        int chocolateSweetness = [self sweetnessReturn:sS v0:1 v1:1 v2:1 v3:1 v4:1 v5:1 v6:2 v7:3 v8:4];
        
        slotValue = [self sweetFlavourReturn:sweetFlavour f0:mintSweetness f1:colaSweetness f2:strawberrySweetness f3:chocolateSweetness];
    }
    if(sweetType == 1){
        
        int mintSweetness = [self sweetnessReturn:sS v0:6 v1:5 v2:4 v3:3 v4:2 v5:1 v6:1 v7:1 v8:1];
        int colaSweetness = [self sweetnessReturn:sS v0:1 v1:2 v2:3 v3:3 v4:3 v5:3 v6:4 v7:5 v8:6];
        int strawberrySweetness = [self sweetnessReturn:sS v0:5 v1:5 v2:5 v3:5 v4:5 v5:6 v6:6 v7:6 v8:6];
        int chocolateSweetness = [self sweetnessReturn:sS v0:4 v1:4 v2:4 v3:4 v4:4 v5:4 v6:5 v7:4 v8:3];
        
        slotValue = [self sweetFlavourReturn:sweetFlavour f0:mintSweetness f1:colaSweetness f2:strawberrySweetness f3:chocolateSweetness];
    }
    if(sweetType == 2){
        
        int mintSweetness = [self sweetnessReturn:sS v0:5 v1:5 v2:5 v3:5 v4:4 v5:1 v6:1 v7:1 v8:1];
        int colaSweetness = [self sweetnessReturn:sS v0:1 v1:2 v2:3 v3:3 v4:3 v5:3 v6:3 v7:3 v8:7];
        int strawberrySweetness = [self sweetnessReturn:sS v0:2 v1:3 v2:4 v3:5 v4:6 v5:7 v6:8 v7:9 v8:10];
        int chocolateSweetness = [self sweetnessReturn:sS v0:1 v1:1 v2:1 v3:2 v4:2 v5:2 v6:2 v7:2 v8:2];
        
        slotValue = [self sweetFlavourReturn:sweetFlavour f0:mintSweetness f1:colaSweetness f2:strawberrySweetness f3:chocolateSweetness];
    
    }

    return slotValue;
}

+(int)sweetFlavourReturn: (int)flavourValue f0:(int)f0 f1:(int)f1 f2:(int)f2 f3:(int)f3 {
    int Mint = 1;
    int Cola = 2;
    int Strawberrry = 3;
    int Chocolate = 4;
    
    if(flavourValue == Mint){
        return f0;
    }
    if(flavourValue == Cola){
        return f1;
    }
    if(flavourValue == Strawberrry){
        return f2;
    }
    if(flavourValue == Chocolate){
        return f3;
    }else {
        return f0;
    }
    
}

+(int)sweetnessReturn: (int)sweetnessValue v0:(int)v0 v1:(int)v1 v2:(int)v2 v3:(int)v3 v4:(int)v4 v5:(int)v5 v6:(int)v6  v7:(int)v7 v8:(int)v8 {
    
    if(sweetnessValue == 0){
        return v0;
    }
    if(sweetnessValue == 1){
        return v1;
    }
    if(sweetnessValue == 2){
        return v2;
    }
    if(sweetnessValue == 3){
        return v3;
    }
    if(sweetnessValue == 4){
        return v4;
    }
    if(sweetnessValue == 5){
        return v5;
    }
    if(sweetnessValue == 6){
        return v6;
    }
    if(sweetnessValue == 7){
        return v7;
    }
    if(sweetnessValue == 8){
        return v8;
    }else {
        return v0;
    }

}
@end
