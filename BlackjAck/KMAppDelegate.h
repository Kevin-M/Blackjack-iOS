//
//  KMAppDelegate.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 29/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
