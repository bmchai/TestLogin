//
//  TestAppUserDetailViewController.h
//  TestApp
//
//  Created by Bao Ming Chai on 4/15/14.
//  Copyright (c) 2014 Bao Ming Chai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAppUserDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *userName;
@property (nonatomic, strong) IBOutlet UILabel *companyName;
@property (nonatomic, strong) IBOutlet UILabel *userId;
@property (nonatomic, strong) IBOutlet UILabel *companyId;

- (void)setStatus:(NSDictionary *)status;
- (void)setUsername:(NSString *)name;

@end
