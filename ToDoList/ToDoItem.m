//
//  ToDoItem.m
//  ToDoList
//
//  Created by d on 23/3/15.
//  Copyright (c) 2015 d. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.taskName forKey:@"taskName"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.taskName = [decoder decodeObjectForKey:@"taskName"];
    }
    return self;
}

@end