 //
//  NSString+Extra.m
//  VKAPI
//
//  Created by Евгений Кратько on 29.03.13.
//  Copyright (c) 2013 Akki. All rights reserved.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)

- (NSString *)stringBetweenString:(NSString *)first andString:(NSString *)second
{
    NSScanner* scanner = [NSScanner scannerWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    [scanner scanUpToString:first intoString:NULL];
    if ([scanner scanString:first intoString:NULL]) {
        NSString* result = nil;
        if ([scanner scanUpToString:second intoString:&result]) {
            return result;
        }
    }
    return nil;
}

- (NSString *)stringByStrippingHTML
{
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

- (NSString *)stringByReplacingOccurrencesOfCharacterSet:(NSCharacterSet *)set
{
    NSRange range;
    NSString *s = [self copy];
    while ((range = [s rangeOfCharacterFromSet:set]).location != NSNotFound) {
        s = [s stringByReplacingCharactersInRange:range withString:@""];
    }
    return s;
}
@end
