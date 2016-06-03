//
//  Person.h
//  DBAccessTest
//
//  Created by Jason on 2016/6/3.
//  Copyright © 2016年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DBAccess/DBAccess.h>

@interface Person : DBObject

@property NSString *name;
@property NSInteger age;
@property NSString *email;
@property NSString *phone;

@end
