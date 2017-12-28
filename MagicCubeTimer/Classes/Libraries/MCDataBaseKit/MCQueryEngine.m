//
//  MCQueryEngine.m
//  MagicCubeTimer
//
//  Created by  zcating on 25/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "MCQueryEngine.h"

#import <FMDB/FMDB.h>


@interface MCQueryEngine()

@property (nonatomic, strong) FMDatabaseQueue* databaseQueue;


@end

@implementation MCQueryEngine

+(instancetype)main {
    static MCQueryEngine *engine;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        engine = [MCQueryEngine new];
    });
    return engine;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *cacheDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, NO)[0];
        NSString *sqlPath = [cacheDirectory stringByAppendingPathComponent:@"record.db"];
        self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:sqlPath];
        [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
            if ([db open]) {
                NSString *creatingTableSQL = [NSString stringWithFormat:
                                              @"CREATE TABLE IF NOT EXISTS 'recover_records'\
                                              (\
                                              'id' INTEGER PRIMARY KEY AUTOINCREMENT,\
                                              'recover_time' TEXT,\
                                              'disruption' TEXT\
                                              )"];
                
                BOOL result = [db executeUpdate:creatingTableSQL];
                if (result == YES) {
                    NSLog(@"Completed creating.");
                } else {
                    NSLog(@"Failed to creating.");
                }
                [db close];
            }
        }];
    }
    return self;
}

+(void)queryAllInTable:(NSString *)table inBlock:(void(^)(NSArray *array))block {
    NSString *queryAllSQL = [NSString stringWithFormat:@"SELECT * FROM %@", table];
    [[MCQueryEngine main].databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        FMResultSet *set = [db executeQuery:queryAllSQL];
        while ([set next]) {
            NSMutableDictionary *resultMap = [[NSMutableDictionary alloc] init];
            for (int index = 0; index < [set columnCount]; index++) {
                NSString *name = [set columnNameForIndex:index];
                NSString *value = [set objectForColumnIndex:index];
                [resultMap setObject:name forKey:value];
            }
            [resultArray addObject:resultMap];
        }
        block(resultArray);
    }];
}

+(void)select:(NSString *)selection from:(NSString *)table finish:(void(^)(NSArray *array))block {
    NSString *queryAllSQL = [NSString stringWithFormat:@"SELECT %@ FROM %@", selection, table];
    [[MCQueryEngine main].databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        FMResultSet *set = [db executeQuery:queryAllSQL];
        while ([set next]) {
            NSMutableDictionary *resultMap = [[NSMutableDictionary alloc] init];
            for (int index = 0; index < [set columnCount]; index++) {
                NSString *name = [set columnNameForIndex:index];
                NSString *value = [set objectForColumnIndex:index];
                [resultMap setObject:name forKey:value];
            }
            [resultArray addObject:resultMap];
        }
        block(resultArray);
    }];
}


@end
