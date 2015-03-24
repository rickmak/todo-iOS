//
//  TodoList.m
//  ToDoList
//
//  Created by Rick Mak on 15/5/15.
//  Copyright (c) 2015 d. All rights reserved.
//

#import "TodoList.h"

@implementation TodoList

+ (TodoList *)defaultList {
    static id defaultList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultList = [[TodoList alloc] initWithList];
    });
    return defaultList;
}

- (TodoList *)initWithList {
    self = [super init];
    if (self) {
        NSData *data;
        data = [[NSUserDefaults standardUserDefaults] objectForKey:@"active"];
        if (data.length > 0) {
            self.items = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        else {
            self.items = [[NSMutableArray alloc] init];
        }
        data = [[NSUserDefaults standardUserDefaults] objectForKey:@"finished"];
        if (data.length > 0) {
            self.finsihedItems = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        else {
            self.finsihedItems = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (TodoItem *)addTask:(NSString *)task {
    TodoItem *item = [[TodoItem alloc] init];
    item.taskName = task;
    [self.items addObject:item];
    [self save];
    return item;
}


- (void)save {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.items];
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:@"active"];
    encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.finsihedItems];
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:@"finished"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end