//
//  TestAppUserDetailViewController.m
//  TestApp
//
//  Created by Bao Ming Chai on 4/15/14.
//  Copyright (c) 2014 Bao Ming Chai. All rights reserved.
//

#import "TestAppUserDetailViewController.h"

@interface TestAppUserDetailViewController ()

@end

@implementation TestAppUserDetailViewController {
    NSDictionary *status;
    NSString *Username;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.userName.text = Username;
    self.companyName.text = @"";
    self.userId.text = [status objectForKey:@"actorId"];
    //self.companyId.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setStatus:(NSDictionary *)statusData
{
    status = statusData;
}

- (void)setUsername:(NSString *)name {
    Username = name;
}

@end
