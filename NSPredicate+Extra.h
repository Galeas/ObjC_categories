//
//  NSPredicate+Extra.h
//  VK Omnia
//
//  Created by Евгений Кратько on 04.04.13.
//  Copyright (c) 2013 Akki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPredicate (Extra)

- (NSPredicate*)predicateByRemovingSubpredicate:(NSPredicate*)sub error:(NSError**)error;

@end
