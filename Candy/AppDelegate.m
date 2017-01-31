//
//  AppDelegate.m
//  Candy
//
//  Created by Callum Beckwith on 04/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "AppDelegate.h"
#import "Firebase.h"
#import "GADMAdapterAdColonyInitializer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    [GADMAdapterAdColonyInitializer startWithAppID:@"appe261e252c06f42bab4" andZones:@[@"vzd7e1b436f65940978d", @"vz15fca91cdcff41c88f"] andCustomID:@"appe261e252c06f42bab4"];
    [GADMobileAds configureWithApplicationID:@"ca-app-pub-1801714701929045~3500859617"];
    
    GADRequest *req = [GADRequest request];
    req.testDevices = @[@"1e69c118ffc7ac17572ce32296f9878fe6d58d46"];
    
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:req withAdUnitID:@"ca-app-pub-1801714701929045/4977592815"];

    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
