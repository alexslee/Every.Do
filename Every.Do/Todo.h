//
//  Todo.h
//  Every.Do
//
//  Created by Alex Lee on 2017-06-13.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *toDoDescription;
@property (nonatomic) NSInteger priority;
@property (strong, nonatomic) NSDate *date;
@property (nonatomic) BOOL isCompleted;

- (id)initWithTitle:(NSString *)title andDescription:(NSString *)desc andPriority:(NSInteger)priority andDate:(NSDate *)date;

@end
