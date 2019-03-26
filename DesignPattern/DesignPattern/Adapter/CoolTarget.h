//
//  CoolTarget.h
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/7.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target.h"

//适配对象
@interface CoolTarget : NSObject

//被适配对象
@property (nonatomic, strong) Target *target;

//对原有方法包装
- (void)request;

@end
