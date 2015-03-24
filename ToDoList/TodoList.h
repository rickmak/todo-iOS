//
//  TodoList.h
//  ToDoList
//
//  Created by Rick Mak on 15/5/15.
//  Copyright (c) 2015 d. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"

@interface TodoList : NSObject

@property NSMutableArray *items;
@property NSMutableArray *finsihedItems;

+ (TodoList *)defaultList;
- (TodoItem *)addTask:(NSString *)task;
- (void)save;

@end
