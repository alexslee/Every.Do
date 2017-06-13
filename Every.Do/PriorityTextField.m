//
//  PriorityTextField.m
//  Every.Do
//
//  Created by Alex Lee on 2017-06-13.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "PriorityTextField.h"

@implementation PriorityTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        self.delegate = self;
    }
    return self;
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // Check for non-numeric characters
    NSUInteger lengthOfString = string.length;
    
    for (NSInteger loopIndex = 0; loopIndex < lengthOfString; loopIndex++) {
        unichar character = [string characterAtIndex:loopIndex];
        if (character < 48) return NO; // 48 unichar for 0
        if (character > 53) return NO; // 53 unichar for 5
    }
    
    // Check for total length
    NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
    if (proposedNewLength > 1) {
        return NO;
    }
    return YES;
}

@end
