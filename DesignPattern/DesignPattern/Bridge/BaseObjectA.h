//
//  BaseObjectA.h
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/7.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObjectB.h"

@interface BaseObjectA : NSObject

//桥接模式的核心实现
@property (nonatomic, strong) BaseObjectB *objB;

//获取数据
- (void)handle;

@end

