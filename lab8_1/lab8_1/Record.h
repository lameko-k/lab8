//
//  Record.h
//  lab8_1
//
//  Created by robert on 5/28/17.
//  Copyright (c) 2017 di. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Record : NSManagedObject

@property (nonatomic, retain) NSString * aviaCompany;
@property (nonatomic, retain) NSString * cityFrom;
@property (nonatomic, retain) NSString * cityTo;
@property (nonatomic, retain) NSNumber * price;

@end
