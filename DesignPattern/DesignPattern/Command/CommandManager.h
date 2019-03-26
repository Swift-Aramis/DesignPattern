//
//  CommandManager.h
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/8.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@interface CommandManager : NSObject

//命令管理容器
@property (nonatomic, strong) NSMutableArray <Command *> *arrayCommands;

//命令管理者以单例方式呈现
+ (instancetype)sharedInstance;

//执行命令
+ (void)executeCommand:(Command *)cmd
            completion:(CommandCompletionCallBack)completion;

//取消命令
+ (void)cancleCommand:(Command *)cmd;

@end

