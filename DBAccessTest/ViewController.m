//
//  ViewController.m
//  DBAccessTest
//
//  Created by Jason on 2016/6/3.
//  Copyright © 2016年 HT. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createData];
    
    [self fetchData];
    
    [self queryData];
    
    [self removeData];
}

-(void)createData
{
    // Create a new object
    Person *thisPerson = [Person new];
    
    // Set some properties
    thisPerson.age = 27;
    thisPerson.email = @"happyboy@gmail.com";
    thisPerson.name = @"HappyBoy";
    thisPerson.phone = @"0987654321";
    
    // Persist the object into the datastore
    [thisPerson commit];
    
    // Create a new object
    Person *thatPerson = [Person new];
    
    // Set some properties
    thatPerson.age = 11;
    thatPerson.email = @"happygirl@gmail.com";
    thatPerson.name = @"HappyGirl";
    thatPerson.phone = @"0912345678";
    
    // Persist the object into the datastore
    [thatPerson commit];
}

-(void)fetchData
{
    DBResultSet *results = [[[[[Person query]
                               where:@"age <= 40"]
                              limit:99]
                             orderBy:@"name"]
                            fetch];
    
    for (Person *person in results) {
        NSString *result = [NSString stringWithFormat:@"name: %@, age: %li, email: %@", person.name, (long)person.age, person.email];
        NSLog(@"%@", result);
    }
    
    displayTV.text = [[results description] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
}

-(void)removeData
{
    for (Person* person in [[Person query] fetch]) {
        [person remove];
    }
    
    // or the shorthand is to use the removeAll method on the DBResultSet object
    [[[Person query] fetch] removeAll];
}

-(void)queryData
{
    /* count the rows within the Person table */
    int count = [[Person query] count];
    
    /* add all of the ages together */
    double total = [[Person query] sumOf:@"age"];
    
    /* group all the people together by the surname property */
    NSDictionary *peopleBySurname = [[Person query] groupBy:@"name"];
    
    /* get just the primary keys for a query, useful to save memory */
    NSArray *ids = [[Person query] ids];
}

@end
