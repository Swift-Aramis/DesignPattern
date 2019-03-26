//
//  CommandManager.m
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/8.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "CommandManager.h"

@implementation CommandManager

+ (instancetype)sharedInstance {
    static CommandManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone {
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        //初始化命令容器
        _arrayCommands = [[NSMutableArray alloc] init];
    }
    return self;
}

//执行命令
+ (void)executeCommand:(Command *)cmd
            completion:(CommandCompletionCallBack)completion {
    if (cmd) {
        //如果命令正在执行不作处理，否则添加并执行命令
        if (![self _isExecutingCommand:cmd]) {
            //添加到命令容器中
            [[[self sharedInstance] arrayCommands] addObject:cmd];
            cmd.completion = completion;
            [cmd execute];
        }
    }
}

//取消命令
+ (void)cancleCommand:(Command *)cmd {
    if (cmd) {
        //从命令容器中移除
        [[[self sharedInstance] arrayCommands] removeObject:cmd];
        //取消命令执行
        [cmd cancle];
    }
}

//判断命令是否正在执行
+ (BOOL)_isExecutingCommand:(Command *)cmd {
    if (cmd) {
        NSArray *cmds = [[self sharedInstance] arrayCommands];
        for (Command *aCmd in cmds) {
            if (cmd == aCmd) {
                return YES;
            }
        }
    }
    return NO;
}


@end
