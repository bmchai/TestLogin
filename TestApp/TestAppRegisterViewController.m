//
//  TestAppRegisterViewController.m
//  TestApp
//
//  Created by Bao Ming Chai on 4/15/14.
//  Copyright (c) 2014 Bao Ming Chai. All rights reserved.
//

#import "TestAppRegisterViewController.h"

@interface TestAppRegisterViewController ()

@end

@implementation TestAppRegisterViewController

- (IBAction)registerUser:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/register/register"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSDictionary *requestData = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 self.userName.text, @"email",
                                 self.companyName.text, @"companyName",
                                 self.password.text, @"password",
                                 @"Asia/Hong_Kong", @"timezone",
                                 nil];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:requestData options:0 error:NULL];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    NSError *error;
    NSURLResponse *response;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (data.length > 0 && error == nil)
    {
        NSDictionary *status = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSString *success = [[status objectForKey:@"success"] stringValue];
        if (success != nil && [success isEqualToString:@"true"]) {
            [self performSegueWithIdentifier:@"RegisterSuccessToUserDetail" sender:sender];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
