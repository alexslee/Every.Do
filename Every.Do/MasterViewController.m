//
//  MasterViewController.m
//  Every.Do
//
//  Created by Alex Lee on 2017-06-13.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    [self.tableView addGestureRecognizer:swipeGesture];
    
    Todo *toDoOne = [[Todo alloc] initWithTitle:@"Super long title to test multi line functionality lol" andDescription:@"More randomly long run-on sentences to test multi-line functionality, lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." andPriority:5];
    
    Todo *toDoTwo = [[Todo alloc] initWithTitle:@"Take notes" andDescription:@"Finish chapter 2, ECE302" andPriority:4];
    
    Todo *toDoThree = [[Todo alloc] initWithTitle:@"Finish editing photos" andDescription:@"Right Here, Write Now" andPriority:3];
    toDoTwo.isCompleted = YES;
    self.objects = [[NSMutableArray alloc] init];
    [self.objects addObject:toDoOne];
    [self.objects addObject:toDoTwo];
    [self.objects addObject:toDoThree];
    
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    [self performSegueWithIdentifier:@"SegueToAddItem" sender:self];
}

//delegate method
- (void)addToDoToList:(Todo *)toDo;
{
//    [self.objects addObject:toDo];
    [self.objects insertObject:toDo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
//    [self.tableView reloadData];
}

//handle swipe gestures to mark tasks as completed
- (void)swipeHandler:(UISwipeGestureRecognizer *)sender;
{
    CGPoint tap = [sender locationInView:self.tableView];
    //find the actual cell that was swiped on
    NSIndexPath *index = [self.tableView indexPathForRowAtPoint:tap];
    NSIndexPath *end = [NSIndexPath indexPathForRow:[self.objects count]-1 inSection:0];
    if (!(sender.direction == UISwipeGestureRecognizerDirectionRight)) {
        //if it wasn't in the right direction, do nothing
        return;
    } else {
        //mark as completed if it hasn't been already
        Todo *done = self.objects[index.row];
        if(done.isCompleted){
            return;
        }
        else {
            done.isCompleted = YES;
            //move to the end to trigger the redraw with the strikethrough??
            [self tableView:self.tableView moveRowAtIndexPath:index toIndexPath:end];
            [self.tableView reloadData];
        }
    }
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    } else if ([[segue identifier] isEqualToString:@"SegueToAddItem"]) {
        NewTodoViewController *controller = (NewTodoViewController *)[segue destinationViewController];
        controller.delegate = self;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Todo *object = self.objects[indexPath.row];
    [cell makeCellWithToDo:object];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Determine if it's in editing mode
    if (self.tableView.editing)
    {
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    if (fromIndexPath != toIndexPath) {
        Todo *todo = [self.objects objectAtIndex:fromIndexPath.row];
        [self.objects removeObjectAtIndex:fromIndexPath.row];
        [self.objects insertObject:todo atIndex:toIndexPath.row];
        [self.tableView reloadData];
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
