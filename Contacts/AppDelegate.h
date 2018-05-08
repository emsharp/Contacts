//
//  AppDelegate.h
//  Contacts
//
//  Created by Ethan Sharp on 2018-05-08.
//  Copyright © 2018 Scenedoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

