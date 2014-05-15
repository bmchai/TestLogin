//
//  TestAppRegisterViewController.h
//  TestApp
//
//  Created by Bao Ming Chai on 4/15/14.
//  Copyright (c) 2014 Bao Ming Chai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAppRegisterViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *userName;
@property (nonatomic, strong) IBOutlet UITextField *companyName;
@property (nonatomic, strong) IBOutlet UITextField *password;

- (IBAction)registerUser:(id)sender;

@end
