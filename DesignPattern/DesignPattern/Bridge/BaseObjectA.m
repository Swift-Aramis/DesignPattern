//
//  BaseObjectA.m
//  DesignPattern
//
//  Created by 提运佳 on 2019/3/7.
//  Copyright © 2019 Swift_Aramis. All rights reserved.
//

#import "BaseObjectA.h"

@implementation BaseObjectA

/**
 A1 -> B1 B2 B3     3种
 A2 -> B1 B2 B3     3种
 A3 -> B1 B2 B3     3种
 */

- (void)handle {
    // override for subclass
    [self.objB fetchData];
}

@end
