//
//  AppDelegate.m
//  DBAccessTest
//
//  Created by Jason on 2016/6/3.
//  Copyright © 2016年 HT. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [DBAccess setDelegate:self];
    [DBAccess openDatabaseNamed:@"happyDatabase"];

    return YES;
}



@end
