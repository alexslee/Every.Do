//
//  CustomTableViewCell.h
//  Every.Do
//
//  Created by Alex Lee on 2017-06-13.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface CustomTableViewCell : UITableViewCell

- (void)makeCellWithToDo:(Todo *)toDo;

@end
