//
//  NSPredicate+Extra.m
//  VK Omnia
//
//  Created by Евгений Кратько on 04.04.13.
//  Copyright (c) 2013 Akki. All rights reserved.
//

#import "NSPredicate+Extra.h"

@implementation NSPredicate (Extra)

- (NSPredicate *)predicateByRemovingSubpredicate:(NSPredicate *)sub error:(NSError *__autoreleasing *)error
{
    NSCompoundPredicate *pred = [self copy];
    NSMutableArray *subs = [[pred subpredicates] mutableCopy];
    if (subs.count > 1) {
        NSCompoundPredicateType type = [pred compoundPredicateType];
        if ([subs containsObject:sub]) {
            [subs removeObject:sub];
            NSCompoundPredicate *result = [[NSCompoundPredicate alloc] initWithType:type subpredicates:subs];
            return result;
        }
        else {
            *error = [NSError errorWithDomain:@"Predicate doesn't contain given subpredicate" code:0 userInfo:nil];
        }
    }
    return nil;
}
@end
