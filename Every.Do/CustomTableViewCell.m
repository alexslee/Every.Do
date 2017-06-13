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
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:toDo.title];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeString length])];
        self.title.attributedText = attributeString;
        
    } else {
        
        self.title.text = toDo.title;
        self.desc.text = toDo.toDoDescription;
        self.priorityDisplay.text = [NSString stringWithFormat:@"%ld",toDo.priority ];
        
    }
}

@end
