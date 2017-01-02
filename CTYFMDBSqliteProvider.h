//
//  CTYFMDBSqliteProvider.h
//  ChuanTaiYi-Client
//
//  Created by yang on 16/1/21.
//  Copyright © 2016年 CTY. All rights reserved.
/*
 a Singleton that provide a search list history in local based on FMDB.
 */


#import <Foundation/Foundation.h>

@interface CTYFMDBSqliteProvider : NSObject

+ (instancetype)defaultProvider; /*create a table to store the search list information*/
- (BOOL)insertValueWithString:(NSString *)string;/*insert to the table, if exist, it will be the top*/
- (void)deleteSQLite; /* delete all historyName, means clear the search information*/
- (FMResultSet *)queryObjectFromDatabase; /* query all historyName */
@end
