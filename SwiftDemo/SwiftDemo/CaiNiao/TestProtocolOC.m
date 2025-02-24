//
//  TestProtocolOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/18.
//

#import "TestProtocolOC.h"

@protocol TPCSomeProtocolFirst <NSObject>

@required
@property (nonatomic,copy) NSString* demoName;

- (void) printName;

@optional
- (void) showName;

@end

@interface TPCPropertyClass : NSObject<TPCSomeProtocolFirst>

@end

@implementation TPCPropertyClass

@synthesize demoName;

- (void)printName {
    NSLog(@"demoName:%@",self.demoName);
}

@end

#pragma mark - 对构造器的规定
@protocol TPCInitProtocol <NSObject>
@required
- (instancetype) initWithNo1:(NSInteger)no1;
@end

@interface TPCInitClass : NSObject<TPCInitProtocol>
@property (nonatomic,assign) NSInteger no1;
@end

@implementation TPCInitClass
- (instancetype)initWithNo1:(NSInteger)no1 {
    self = [super init];
    if (self) {
        self.no1 = no1;
    }
    return self;
}
@end

#pragma mark - 在扩展中添加协议成员

@interface TPCExtensionClass : NSObject

@end

@interface TPCExtensionClass()<TPCSomeProtocolFirst>

@end

@implementation TPCExtensionClass

@synthesize demoName;

- (void)printName {
    NSLog(@"demoName:%@",self.demoName);
}

@end


@implementation TestProtocolOC

#pragma mark - 对属性的规定
- (void) testMain {
    [self testProperty];
}

- (void) testProperty {
    TPCPropertyClass* demo = [TPCPropertyClass new];
    demo.demoName = @"testProperty";
    [demo printName];
}

- (void) testMutating {
    //struct 、enum不支持协议
}

- (void) testInit {
    TPCInitClass* demo = [[TPCInitClass alloc] initWithNo1:10];
    NSLog(@"TPCInitClass:%ld",demo.no1);
}

- (void) testType {
    
    NSDictionary<NSString*,id<TPCSomeProtocolFirst>>* dict = @{
        
    };
    
}

- (void) testExtension {
    TPCExtensionClass* demo = [TPCExtensionClass new];
    demo.demoName = @"testProperty";
    [demo printName];
}

@end
