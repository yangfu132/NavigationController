//
//  NSObject+KVCDefener.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/2.
//

#import "NSObject+KVCDefener.h"
#import "NSObject+Safe.h"

@implementation NSObject (KVCDefener)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSString *crashMessages = [NSString stringWithFormat:@"crashMessages : [<%@ %p> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key: %@,value:%@'",NSStringFromClass([self class]),self,key,value];
    NSLog(@"%@", crashMessages);
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSString *crashMessages = [NSString stringWithFormat:@"crashMessages :[<%@ %p> valueForUndefinedKey:]: this class is not key value coding-compliant for the key: %@",NSStringFromClass([self class]),self,key];
    NSLog(@"%@", crashMessages);

    return self;
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject safeDefenderSwizzlingClassMethod:@selector(setValue:forKey:) withMethod:@selector(safe_SetValue:forKey:) withClass:[NSObject class]];
    });
}

- (void) safe_SetValue:(id)value forKey:(NSString*)key {
    if (key == nil) {
        NSString *crashMessages = [NSString stringWithFormat:@"crashMessages : [<%@ %p> setNilValueForKey]: could not set nil as the value for the key %@.",NSStringFromClass([self class]),self,key];
        NSLog(@"%@", crashMessages);
        NSLog(@"%@", crashMessages);
        return;
    }
    
    [self safe_SetValue:value forKey:key];
}

- (void)setNilValueForKey:(NSString *)key {
    NSString *crashMessages = [NSString stringWithFormat:@"crashMessages : [<%@ %p> setNilValueForKey]: could not set nil as the value for the key %@.",NSStringFromClass([self class]),self,key];
    NSLog(@"%@", crashMessages);
}

@end
