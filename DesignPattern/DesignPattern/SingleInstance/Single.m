//
//  Single.m
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/7.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "Single.h"

@implementation Single

+ (instancetype)sharedInstance {
    //静态局部变量
    static Single *instance = nil;
    //通过dispatch_once方式，确保instance在多线程环境下只被创建一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //创建实例
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

// 重写方法【必不可少】
// 防止外部因alloc创建方式获取不到单例对象
+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

// 重写方法【必不可少】
// 保证外部 copy 获取到的仍是单例对象
- (id)copyWithZone:(struct _NSZone *)zone {
    return self;
}

@end
