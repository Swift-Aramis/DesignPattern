//
//  BusinessObject.h
//  DesignPattern
//
//  Created by 提运佳 on 2019/2/26.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BusinessObject;
typedef void(^CompletionBlock)(BOOL handled);
typedef void(^ResultBlock)(BusinessObject *handler, BOOL handled);

@interface BusinessObject : NSObject

//责任链模式的构成描述(画链表)：某一个对象/类含有一个成员变量也是当前类的同类型的成员变量

// 下一个响应者（响应链构成的关键）
@property (nonatomic, strong) BusinessObject *nextBusiness;

// 响应者的处理方法
- (void)handle:(ResultBlock)result;

// 各个业务在该方法当中做实际业务处理
// CompletionBlock为了方便异步操作（网络、图片加载等）
- (void)handleBusiness:(CompletionBlock)completin;

@end
