//
//  EditFriendsViewController.m
//  Ribbit
//
//  Created by Adrien Fernandez Baca on 26/10/2013.
//  Copyright (c) 2013 Adrien Fernandez Baca. All rights reserved.
//

#import "EditFriendsViewController.h"

@interface EditFriendsViewController ()

@end

@implementation EditFriendsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error)
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else {
            self.allUsers = objects;
//            getting data asynchronisly from the back end so we need to reload to display the data
            [self.tableView reloadData];
        }
    }];
//     set the current user once, here we can get the currentUser thanks to the currentUser function ([PFUser currentUser])
    
    self.currentUser = [PFUser currentUser];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.allUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    // Checkmark for cells
    if ([self isFriend:user]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
// deletes the blue highlight of the line selected
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
//    reference to the cell selected
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // (1) find the user at index
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    // object relation (if not existing the relationkey "friendsRelation" will be created in parse.com)
    PFRelation *friendsRelation = [self.currentUser relationforKey:@"friendsRelation"];
    
    
    if ([self isFriend:user])
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        for (PFUser *friend in self.friends){
            if ([friend.objectId isEqualToString:user.objectId])
            {
                [self.friends removeObject:friend];
                break;
            }
        }
        [friendsRelation removeObject:user];
    }
    else
    {
        // mark cell with checkbox
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.friends addObject:user];
        //   (2) add the user in the PFRelation
        [friendsRelation addObject:user];

    }
    // (3) save it to Parse
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error)
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

# pragma mark - helper methods

- (BOOL) isFriend:(PFUser *)user {
    for (PFUser *friend in self.friends)
    {
        if ([friend.objectId isEqualToString:user.objectId])
        {
            return YES;
        }
    }
     return NO;
}

@end
