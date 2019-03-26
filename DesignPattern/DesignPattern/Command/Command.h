//
//  Command.h
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/8.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Command;
typedef void(^CommandCompletionCallBack)(Command *cmd);

@interface Command : NSObject

@property (nonatomic, copy) CommandCompletionCallBack completion;

- (void)execute;
- (void)cancle;

- (void)done;

@end
