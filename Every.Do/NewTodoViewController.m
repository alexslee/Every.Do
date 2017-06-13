//
//  NewTodoViewController.m
//  Every.Do
//
//  Created by Alex Lee on 2017-06-13.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "NewTodoViewController.h"

@interface NewTodoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleEntry;

@property (weak, nonatomic) IBOutlet UITextView *descriptionEntry;

@property (weak, nonatomic) IBOutlet PriorityTextField *priorityEntry;

@property (weak, nonatomic) IBOutlet UIDatePicker *dateEntry;

@end

@implementation NewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapHandler:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (IBAction)donePressed:(UIButton *)sender {
    Todo *toDo = [[Todo alloc] initWithTitle:self.titleEntry.text andDescription:self.descriptionEntry.text andPriority:[self.priorityEntry.text integerValue] andDate:self.dateEntry.date];
    [self.delegate addToDoToList:toDo];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
