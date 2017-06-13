//
//  NewTodoViewController.h
//  Every.Do
//
//  Created by Alex Lee on 2017-06-13.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "PriorityTextField.h"

@protocol NewToDoDelegate <NSObject>

- (void)addToDoToList:(Todo *)toDo;

@end

@interface NewTodoViewController : UIViewController

@property (strong,nonatomic) id<NewToDoDelegate> delegate;

//- (void)sendEmptyToDo:(Todo *)toDo;

@end
