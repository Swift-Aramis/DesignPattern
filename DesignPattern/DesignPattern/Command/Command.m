//
//  Command.m
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/8.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "Command.h"
#import "CommandManager.h"

@implementation Command

- (void)execute {
    //override to subclass
    
    [self done];
}

- (void)cancle {
    
    self.completion = nil;
}

- (void)done {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (self.completion) {
            self.completion(self);
        }
        
        //释放
        self.completion = nil;
        
        //移除任务
        [[CommandManager sharedInstance].arrayCommands removeObject:self];
    });
}

@end
