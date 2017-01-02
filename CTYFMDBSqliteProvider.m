//
//  CTYFMDBSqliteProvider.m
//  ChuanTaiYi-Client
//
//  Created by yang on 16/1/21.
//  Copyright © 2016年 ChuanTaiYi. All rights reserved.
//
#import <FMDB/FMDB.h>
#import "CTYFMDBSqliteProvider.h"

@interface CTYFMDBSqliteProvider()
{
    FMDatabase *_dataBase;
}

@end

@implementation CTYFMDBSqliteProvider

+ (instancetype)defaultProvider
{
    static CTYFMDBSqliteProvider *_sqliteProvider = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sqliteProvider = [[CTYFMDBSqliteProvider alloc] initWithDatabase];
    });
    return _sqliteProvider;
}

- (instancetype)initWithDatabase
{
    if (self = [super init]) {
        NSString * path = [NSString stringWithFormat:@"%@/Documents/data.db",NSHomeDirectory()];
        _dataBase = [[FMDatabase alloc] initWithPath:path];
        if ([_dataBase open]) {
            NSLog(@"[ACTION]: open database success");
            [_dataBase executeUpdate:@"create table IF NOT EXISTS history(historyname)"];
        }else{
            NSLog(@"[ERROR]: failed to open database");
        }
    }
    return self;
}

- (BOOL)insertValueWithString:(NSString *)string
{
    FMResultSet *result = [_dataBase executeQuery:@"select * from history where historyname = ?", string];
    if ([result next]) {
        [_dataBase executeUpdate:@"delete from history where historyname = ?", string];
    }
    BOOL isInsertDataBase = [_dataBase executeUpdate:@"insert into history values(?)", string];
    if (isInsertDataBase) {
        NSLog(@"[ACTION]:insert a value to database");
    }else{
        NSLog(@"[ERROR]: failed to insert a value to database");
    }
    return isInsertDataBase;
}

- (void)deleteSQLite
{
    BOOL isDelete =  [_dataBase executeUpdate:@"delete from history"];
    if (isDelete) {
        NSLog(@"[VERBOSE]: delete the history table");
    }else{
        NSLog(@"[ERROR]: failed delete the history table");
    }
}

- (FMResultSet *)queryObjectFromDatabase
{
    FMResultSet * result = [_dataBase executeQuery:@"select * from history"];
    return result;
}

@end
