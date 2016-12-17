//
//  FirstViewController.m
//  Mode
//
//  Created by 宋学谦 on 2016/10/18.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "AMapConstion.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@", Localized(@"LeftBar")];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    self.view.backgroundColor = RedColor;
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%@", Localized(@"FirstTitle")] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.array = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%@", Localized(@"Chinese")], [NSString stringWithFormat:@"%@", Localized(@"English")], nil];
    self.segment = [[UISegmentedControl alloc] initWithItems:self.array];
    self.segment.frame = CGRectMake(100, 100, 150, 30);
    [self.segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segment];
    
    
    NSString *language = [[NSUserDefaults standardUserDefaults]objectForKey:@"appLanguage"];
    if ([language isEqualToString:@"en"]) {
        [self.segment setSelectedSegmentIndex:1];
    }else {
        [self.segment setSelectedSegmentIndex:0];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    AMapConstion *amap = [AMapConstion shareManager];
    [amap star];
    amap.hour = @"af";
    
}


- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)change:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
        {

            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@", Localized(@"AlerTitle")] message:@"" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%@", Localized(@"cancel")] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            
            [alertController addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%@", Localized(@"sure")] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
                AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                
                [delegate toMainView];

            }]];
            
            [self presentViewController:alertController animated:YES completion:^{

            }];

            
        }
            break;
            
        case 1:
        {
            
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@", Localized(@"AlerTitle")] message:@"" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%@", Localized(@"cancel")] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            
            [alertController addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%@", Localized(@"sure")] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
                
                AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                
                [delegate toMainView];
                

            }]];
            
            [self presentViewController:alertController animated:YES completion:^{

            }];

        }
            break;
            
        default:{
            
        }
            break;
    }
    

    
    
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
