//
//  TestAppViewController.m
//  TestApp
//
//  Created by Bao Ming Chai on 4/15/14.
//  Copyright (c) 2014 Bao Ming Chai. All rights reserved.
//

#import "TestAppViewController.h"
#import "TestAppUserDetailViewController.h"

@interface TestAppViewController ()

@end

@implementation TestAppViewController {
    NSDictionary *status;
}

- (IBAction)login:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/login/ajaxLogin"];
    
    NSString *post =[NSString stringWithFormat:@"username=%@&password=%@", self.userName.text, self.password.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lud",[postData length]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSError *error;
    NSURLResponse *response;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSString *str=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    if (data.length > 0 && error == nil)
    {
        status = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        BOOL success = [[status objectForKey:@"success"] stringValue];
        if (success == YES) {
            [self performSegueWithIdentifier:@"LoginButtonToUserDetail" sender:sender];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"LoginButtonToUserDetail"])
    {
        TestAppUserDetailViewController *vc = [segue destinationViewController];
        [vc setUsername:self.userName.text];
        [vc setStatus:status];
        vc.companyId.text = @"companyidmlmllmlml";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
