//
//  BaseViewController.m
//  Mode
//
//  Created by 宋学谦 on 2016/10/10.
//  Copyright © 2016年 宋学谦. All rights reserved.
//


/*
 一. 本地化国际化
 1.工程info里创建你共要添加的语言（同时选取storyBoard XIb根据需要）
 2.创建 .strings 多语言文件 plist多语言文件
 3.  .strings 多语言文件 在代码中怎么用见appDelegate,BaseViewController,FirstViewController里详解 用[NSUserDefaults standardUserDefaults]本地缓存
 4. plist多语言文件 见 infoPlist.strings (手机系统设置切换语言)
 5. storyBoard XIb .strings见 LaunchScreen.storyboard
 
 二. 项目框架
 三. .pch     build Setting中搜pch 添加 $(SRCROOT)/Mode/Model.pch
 
 */



#import "BaseViewController.h"
#import "FirstViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@", Localized(@"FirstTitle")];

    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%@", Localized(@"LeftBar")] style:UIBarButtonItemStylePlain target:self action:@selector(next)];
    
    self.view.backgroundColor = RedColor;
    
    
    
}

- (void)next{
    FirstViewController *fiVC = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:fiVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
