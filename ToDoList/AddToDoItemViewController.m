//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by d on 23/3/15.
//  Copyright (c) 2015 d. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (IBAction)unwindToDoList:(id)sender {
    if (self.textField.text.length > 0) {
        self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
    }
    
    ToDoItem *item = self.toDoItem;
    if (item != nil) {
        NSArray* cur = [[NSUserDefaults standardUserDefaults] stringArrayForKey:@"active"];
        NSMutableArray* newArray = [NSMutableArray arrayWithArray:cur];
        [newArray addObject:item.itemName];
        [[NSUserDefaults standardUserDefaults] setObject:newArray forKey:@"active"];
        if (![[NSUserDefaults standardUserDefaults] synchronize]) {
            NSLog(@"NSUserDefaults synchronize fail");
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
