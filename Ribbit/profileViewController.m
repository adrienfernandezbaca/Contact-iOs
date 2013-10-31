//
//  profileViewController.m
//  Connect
//
//  Created by Adrien Fernandez Baca on 29/10/2013.
//  Copyright (c) 2013 Adrien Fernandez Baca. All rights reserved.
//

#import "profileViewController.h"


@interface profileViewController ()

@end

@implementation profileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [_scroller setScrollEnabled:YES];
    [_scroller setContentSize:CGSizeMake(320, 650)];
    _scroller.backgroundColor = [UIColor whiteColor];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
