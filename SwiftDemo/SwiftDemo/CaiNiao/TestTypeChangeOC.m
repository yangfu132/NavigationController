//
//  TestTypeChangeOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/7.
//

#import "TestTypeChangeOC.h"

@interface Subjects : NSObject
@property (nonatomic,copy) NSString* physics;
@end

@implementation Subjects

- (instancetype) initWithPhysics:(NSString*)physics {
    self = [super init];
    if (self) {
        self.physics = physics;
    }
    return self;
}

@end

@interface Chemistry : Subjects
@property (nonatomic,copy) NSString* equations;
@end

@implementation Chemistry
- (instancetype) initWithPhysics:(NSString*)physics equations:(NSString*)equations {
    self = [super init];
    if (self) {
        self.physics = physics;
        self.equations = equations;
    }
    return self;
}
@end

@interface Maths : Subjects
@property (nonatomic,copy) NSString* formulae;
@end

@implementation Maths
- (instancetype) initWithPhysics:(NSString*)physics formulae:(NSString*)formulae {
    self = [super init];
    if (self) {
        self.physics = physics;
        self.formulae = formulae;
    }
    return self;
}
@end

@implementation TestTypeChangeOC
- (void) testMain {
    [self testIsType];
    [self testAsType];
    [self testAny];
    [self testAnyObject];
}

- (void) testIsType {
    NSArray* sa = @[
        [[Chemistry alloc] initWithPhysics:@"固体物理" equations:@"赫兹"],
        [[Maths alloc] initWithPhysics:@"流体动力学" formulae:@"千兆赫"],
        [[Chemistry alloc] initWithPhysics:@"热物理学" equations:@"分贝"],
        [[Maths alloc] initWithPhysics:@"天体物理学" formulae:@"兆赫"],
        [[Maths alloc] initWithPhysics:@"微分方程" formulae:@"余弦级数"],
    ];
    
    Chemistry* samplechem = [[Chemistry alloc] initWithPhysics:@"热物理学" equations:@"分贝"];
    NSLog(@"实例物理学是:%@",samplechem.physics);
    NSLog(@"实例方程式:%@",samplechem.equations);
    
    
    Maths* samplemaths = [[Maths alloc] initWithPhysics:@"流体动力学" formulae:@"千兆赫"];
    NSLog(@"实例物理学是:%@",samplemaths.physics);
    NSLog(@"实例方程式:%@",samplemaths.formulae);
    
    NSInteger chemCount = 0;
    NSInteger mathsCount = 0;
    
    for (NSObject* item in sa) {
        if ([item isKindOfClass:[Maths class]]) {
            mathsCount++;
        } else if ([item isKindOfClass:[Chemistry class]]) {
            chemCount++;
        }
    }
    NSLog(@"化学科目包含 %ld 个主题，数学包含 %ld 个主题",chemCount,mathsCount);
    
}

- (void) testAsType {
    NSArray* sa = @[
        [[Chemistry alloc] initWithPhysics:@"固体物理" equations:@"赫兹"],
        [[Maths alloc] initWithPhysics:@"流体动力学" formulae:@"千兆赫"],
        [[Chemistry alloc] initWithPhysics:@"热物理学" equations:@"分贝"],
        [[Maths alloc] initWithPhysics:@"天体物理学" formulae:@"兆赫"],
        [[Maths alloc] initWithPhysics:@"微分方程" formulae:@"余弦级数"],
    ];
    
    Chemistry* samplechem = [[Chemistry alloc] initWithPhysics:@"热物理学" equations:@"分贝"];
    NSLog(@"实例物理学是:%@",samplechem.physics);
    NSLog(@"实例方程式:%@",samplechem.equations);
    
    
    Maths* samplemaths = [[Maths alloc] initWithPhysics:@"流体动力学" formulae:@"千兆赫"];
    NSLog(@"实例物理学是:%@",samplemaths.physics);
    NSLog(@"实例方程式:%@",samplemaths.formulae);
    
    for (NSObject* item in sa) {
        if ([item isKindOfClass:[Maths class]]) {
            Maths* example = (Maths*)item;
            NSLog(@"化学主题是: %@,%@",example.physics,example.formulae);
        } else if ([item isKindOfClass:[Chemistry class]]) {
            Chemistry* example = (Chemistry*)item;
            NSLog(@"化学主题是: %@,%@",example.physics,example.equations);
        }
    }
}

- (void) testAny {
    //OC中应该不存在Any类型的数组
    void* exampleany[4];
    int a = 12;
    exampleany[0] = &a;
    
    double b = 3.14;
    exampleany[1] = &b;
    
    exampleany[2] = @"Any 示例";
    
    Chemistry* demo = [[Chemistry alloc] initWithPhysics:@"热物理学" equations:@"分贝"];
    exampleany[3] = (__bridge void *)(demo);
//    exampleany[3] = CFBridgingRetain(demo);
    
    int* someInt = exampleany[0];
    NSLog(@"someInt:%d",*someInt);
    
    double* someDouble = exampleany[1];
    NSLog(@"someDouble:%f",*someDouble);
    
    NSString* someString = (__bridge NSString *)(exampleany[2]);
    NSLog(@"someString:%@",someString);
    
    Chemistry* someChemistry = (__bridge Chemistry *)(exampleany[3]);
    NSLog(@"someChemistry:%@,%@",someChemistry.physics,someChemistry.equations);
    
//    CFBridgingRelease(exampleany[3]);
}

- (void) testAnyObject {
 //与testAsType类似
    
}

- (void) testDynamic {
    id aa = @(12);
    aa = @(3.14);
    aa = @"String";
    
}
@end
