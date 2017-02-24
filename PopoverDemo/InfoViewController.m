//
//  InfoViewController.m
//  PopoverDemo
//
//  Created by WangYatao on 16/5/23.
//  Copyright © 2016年 WangYatao. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor orangeColor];
    UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    info.text = @"1234567890";
    [self.view addSubview:info];
}

@end
