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
    NSMutableArray *subpredicates = [[NSPredicate simpleSubpredicatesFrom:self] mutableCopy];
    if ((subpredicates.count > 1) && [self isKindOfClass:[NSCompoundPredicate class]]) {
        NSCompoundPredicateType type = [(NSCompoundPredicate*)self compoundPredicateType];
        if ([subpredicates containsObject:sub]) {
            [subpredicates removeObject:sub];
            NSPredicate *result = [[NSCompoundPredicate alloc] initWithType:type subpredicates:subpredicates];
            return result;
        }
        else {
            *error = [NSError errorWithDomain:@"Predicate doesn't contains given subpredicate" code:0 userInfo:nil];
            return self;
        }
    }
    else if (subpredicates.count == 1) {
        if ([[[subpredicates objectAtIndex:0] predicateFormat] isEqualToString:sub.predicateFormat]) {
            return nil;
        }
        else {
            *error = [NSError errorWithDomain:@"Predicate doesn't contains given subpredicate" code:0 userInfo:nil];
            return self;
        }
    }
    else
        return nil;
}

+ (NSArray*)simpleSubpredicatesFrom:(NSPredicate*)predicate
{
    if ([predicate isKindOfClass:[NSCompoundPredicate class]]) {
        NSCompoundPredicate *source = (NSCompoundPredicate*)predicate;
        NSMutableArray *result = [NSMutableArray new];
        if (source.subpredicates.count == 1) {
            [result addObject:source];
        }
        else {
            for (NSPredicate *pred in [source subpredicates]) {
                if (![pred isKindOfClass:[NSCompoundPredicate class]]) {
                    [result addObject:pred];
                }
                else {
                    [result addObjectsFromArray:[self simpleSubpredicatesFrom:pred]];
                }
            }
        }
        return (NSArray*)result;
    }
    return nil;
}
@end
