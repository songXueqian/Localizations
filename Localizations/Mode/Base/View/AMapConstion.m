//
//  AMapConstion.m
//  Mode
//
//  Created by 宋学谦 on 2016/10/21.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "AMapConstion.h"

static AMapConstion *aMap = nil;

@implementation AMapConstion

+ (AMapConstion *)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        aMap = [[self alloc] init];
    });
    return aMap;
    
}


- (void)star{
    NSLog(@"star star star !!!!!!!");
}
@end
