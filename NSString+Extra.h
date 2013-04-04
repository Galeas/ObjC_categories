//
//  NSString+Extra.h
//  VKAPI
//
//  Created by Евгений Кратько on 29.03.13.
//  Copyright (c) 2013 Akki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extra)

- (NSString *)stringBetweenString:(NSString *)first andString:(NSString *)second;
- (NSString*)stringByStrippingHTML;
- (NSString*)stringByReplacingOccurrencesOfCharacterSet:(NSCharacterSet*)set;

@end
