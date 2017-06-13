//
//  CustomTableViewCell.m
//  Every.Do
//
//  Created by Alex Lee on 2017-06-13.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UILabel *priorityDisplay;

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)makeCellWithToDo:(Todo *)toDo;
{
    //different display if the task has been completed
    if (toDo.isCompleted) {
        self.title.textColor = [UIColor lightGrayColor];
        self.desc.textColor = [UIColor lightGrayColor];
        self.priorityDisplay.textColor = [UIColor lightGrayColor];
        
        NSMutableAttributedString *attributeTitleString = [[NSMutableAttributedString alloc] initWithString:toDo.title];
        [attributeTitleString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeTitleString length])];
        self.title.attributedText = attributeTitleString;
        
        NSMutableAttributedString *attributeDescString = [[NSMutableAttributedString alloc] initWithString:toDo.toDoDescription];
        [attributeDescString addAttribute:NSStrikethroughStyleAttributeName
                                     value:@2
                                     range:NSMakeRange(0, [attributeDescString length])];
        self.desc.attributedText = attributeDescString;
        
        NSString *tempPriority = [NSString stringWithFormat:@"%ld",toDo.priority ];
        
        NSMutableAttributedString *attributePriorityString = [[NSMutableAttributedString alloc] initWithString:tempPriority];
        [attributePriorityString addAttribute:NSStrikethroughStyleAttributeName
                                    value:@2
                                    range:NSMakeRange(0, [attributePriorityString length])];
        self.priorityDisplay.attributedText = attributePriorityString;
        
    } else {
        self.title.textColor = [UIColor blackColor];
        self.desc.textColor = [UIColor blackColor];
        self.priorityDisplay.textColor = [UIColor blackColor];
        
        self.title.text = toDo.title;
        self.desc.text = toDo.toDoDescription;
        self.priorityDisplay.text = [NSString stringWithFormat:@"%ld",toDo.priority ];
        
    }
}

@end
