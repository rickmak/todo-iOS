//
//  DBManager.h
//  ToDoList
//
//  Created by d on 23/3/15.
//  Copyright (c) 2015 d. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;
    
@end