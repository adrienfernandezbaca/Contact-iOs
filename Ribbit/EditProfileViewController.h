//
//  EditProfileViewController.h
//  Connect
//
//  Created by Adrien Fernandez Baca on 30/10/2013.
//  Copyright (c) 2013 Adrien Fernandez Baca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFBAppDelegate.h"
#import <CoreData/CoreData.h>

@interface EditProfileViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (weak, nonatomic) IBOutlet UITextField *mobilePhoneField;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveProfile:(id)sender;

@end
