#import "TriatlasIAPHelper.h"

@implementation TriatlasIAPHelper

+ (TriatlasIAPHelper *)sharedInstance {
    static dispatch_once_t once;
    static TriatlasIAPHelper * sharedInstance;
    dispatch_once(&once, ^{
        NSSet * productIdentifiers = [NSSet setWithObjects:
                                      @"nl.ddq.triatlas.memorecorder",
                                      nil];
        sharedInstance = [[self alloc] initWithProductIdentifiers:productIdentifiers];
    });
    return sharedInstance;
}

@end