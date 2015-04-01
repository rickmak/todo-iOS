//
//  AddToDoItemViewController.h
//  ToDoList
//
//  Created by d on 23/3/15.
//  Copyright (c) 2015 d. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface AddToDoItemViewController : UIViewController

- (IBAction)unwindToDoList:(UIStoryboardSegue *)segue;

@property ToDoItem *toDoItem;

@end
