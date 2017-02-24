//
//  ViewController.m
//  PopoverDemo
//
//  Created by WangYatao on 16/5/23.
//  Copyright © 2016年 WangYatao. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>
@property(nonatomic,strong) InfoViewController *infoVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.65 green:0.78 blue:0.65 alpha:1];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    UIView *box = [[UIView alloc] initWithFrame:CGRectMake(0, 400, screenW, 80)];
    box.backgroundColor = [UIColor colorWithRed:0.65 green:0.85 blue:0.55 alpha:1];
    [self.view addSubview:box];
    
    CGFloat margin = 10;
    int buttonCount = 7;
    for (int i = 0; i<buttonCount; i++) {
        CGFloat buttonW = (screenW - margin)/buttonCount - margin;
        CGFloat buttonX = margin + (buttonW + margin)*i;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, margin, buttonW, 80 - margin*2)];
        [button addTarget:self action:@selector(popoverButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor greenColor]];
        [box addSubview:button];
    }
    
}

-(void)popoverButtonClick:(UIButton *)sender{
    self.infoVC = [[InfoViewController alloc] init];
    //设置弹出的样式为popover
    self.infoVC.modalPresentationStyle = UIModalPresentationPopover;
    //设置弹出控制器的尺寸
    self.infoVC.preferredContentSize = CGSizeMake(200, 30);
    //设置popoverPresentationController的sourceRect和sourceView属性
    self.infoVC.popoverPresentationController.sourceRect = sender.bounds;
    self.infoVC.popoverPresentationController.sourceView = sender;
    //设置箭头方向
    self.infoVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionDown;
    //设置北京色,包括箭头
    self.infoVC.popoverPresentationController.backgroundColor = [UIColor orangeColor];
    self.infoVC.popoverPresentationController.delegate = self;
    //弹出
    [self presentViewController:self.infoVC animated:YES completion:nil];
    //显示一秒后消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //关闭popover
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}


//实现该代理方法,返回UIModalPresentationNone值,可以在iPhone设备实现popover效果
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;//不适配(不区分ipad或iPhone)
}

@end
