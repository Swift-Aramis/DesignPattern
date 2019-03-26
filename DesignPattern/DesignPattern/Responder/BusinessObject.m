//
//  BusinessObject.m
//  DesignPattern
//
//  Created by 提运佳 on 2019/2/26.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "BusinessObject.h"

@implementation BusinessObject

// 责任链入口方法
- (void)handle:(ResultBlock)result {
    CompletionBlock completion = ^(BOOL handled) {
        //当前业务处理掉了，上抛结果
        if (handled) {
            result(self, handled);
        }
        else {
            //沿着责任链，指派给下一个业务处理
            if (self.nextBusiness) {
                //精髓：同一类型同一方法的调用
                [self.nextBusiness handle:result];
            }
            else {
                //没有业务处理，上抛结果
                result(nil, NO);
            }
        }
    };
    
    //当前业务进行处理
    [self handleBusiness:completion];
}

- (void)handleBusiness:(CompletionBlock)completin {
    /**
     业务逻辑处理
     如网络请求、本地照片查询等
     */
}

@end
