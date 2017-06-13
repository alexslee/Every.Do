//
//  Todo.m
//  Every.Do
//
//  Created by Alex Lee on 2017-06-13.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (id)initWithTitle:(NSString *)title andDescription:(NSString *)desc andPriority:(NSInteger)priority;
{
    if (self == [super init]) {
        _title = title;
        _toDoDescription = desc;
        _priority = priority;
        _isCompleted = NO;
    }
    return self;
}

@end
