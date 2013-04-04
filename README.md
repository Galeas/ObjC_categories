ObjC_categories
===============

Some little useful Objective C categories
===============

###NSColor+Extra
* *- (NSString\*)hexColor*
* *- (NSInteger\*)intColor*
* *- (NSColor\*)invertedColor*
* *- (CGColorRef)coreGraphicsColorWithAlpha:(CGFloat)alpha*
* *+ (NSColor\*)colorWithHex:(NSString\*)hexColor*
* * *
###NSPredicate+Extra
* *- (NSPredicate\*)predicateByRemovingSubpredicate:(NSPredicate\*)sub error:(NSError\*\*)error*
* * *
###NSString+Extra
* *- (NSString\*)stringBetweenString:(NSString\*)first andString:(NSString\*)second*
* *- (NSString\*)stringByStrippingHTML*
* *- (NSString\*)stringByReplacingOccurrencesOfCharacterSet:(NSCharacterSet\*)set*
