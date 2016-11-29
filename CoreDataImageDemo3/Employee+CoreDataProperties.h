//
//  Employee+CoreDataProperties.h
//  CoreDataImageDemo3
//
//  Created by Student-002 on 26/10/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *empid;
@property (nullable, nonatomic, retain) NSString *empname;
@property (nullable, nonatomic, retain) NSData *empimg;

@end

NS_ASSUME_NONNULL_END
