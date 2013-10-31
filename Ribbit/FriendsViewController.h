//
//  FriendsViewController.h
//  Ribbit
//
//  Created by Adrien Fernandez Baca on 28/10/2013.
//  Copyright (c) 2013 Adrien Fernandez Baca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendsViewController : UITableViewController
@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSArray *friends;
@end
