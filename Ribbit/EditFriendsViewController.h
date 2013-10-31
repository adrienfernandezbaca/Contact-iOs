//
//  EditFriendsViewController.h
//  Ribbit
//
//  Created by Adrien Fernandez Baca on 26/10/2013.
//  Copyright (c) 2013 Adrien Fernandez Baca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsViewController : UITableViewController

@property (strong, nonatomic) NSArray *allUsers;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) NSMutableArray *friends;


- (BOOL) isFriend: (PFUser *)user;

@end
