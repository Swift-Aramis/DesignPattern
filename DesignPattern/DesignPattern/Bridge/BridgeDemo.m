//
//  BridgeDemo.m
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/7.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "BridgeDemo.h"
#import "ObjectA1.h"
#import "ObjectA2.h"

#import "ObjectB1.h"
#import "ObjectB2.h"

@interface BridgeDemo ()

@property (nonatomic, strong) BaseObjectA *objA;

@end

@implementation BridgeDemo

/**
 根据实际业务判断使用哪套具体数据
 A1 -> B1 B2 B3     3种
 A2 -> B1 B2 B3     3种
 A3 -> B1 B2 B3     3种
 */

- (void)fetch {
    
    //创建一个具体的ClassA
    _objA = [[ObjectA1 alloc] init];
    
    //创建一个具体的ClassB
    BaseObjectB *b1 = [[ObjectB1 alloc] init];
    //将一个具体的ClassB1 指定给抽象的ClassB
    _objA.objB = b1;
    
    //获取数据
    [_objA handle];
}

@end
