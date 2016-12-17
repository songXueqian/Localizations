//
//  AMapConstion.h
//  Mode
//
//  Created by 宋学谦 on 2016/10/21.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMapConstion : NSObject


+ (AMapConstion *)shareManager;


@property (nonatomic, strong) NSString *hour;

- (void)star;
@end
