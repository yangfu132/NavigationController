//
//  TestPropertyOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2024/12/26.
//

#import "TestPropertyOC.h"
#import <UIKit/UIKit.h>

static const NSString* gloableString = @"gloable";


@interface Sample : NSObject {
    const NSTimeInterval _constProperty;
    NSString* _lazyValue;
    
}
@property (nonatomic,assign) double no1;
@property (nonatomic,assign) double no2;
@property (nonatomic,assign) double length;
@property (nonatomic,assign) double breadth;
@property (nonatomic,assign) CGPoint middle;
@property (nonatomic,copy) NSString* lazyValue;
@property (nonatomic,assign) NSInteger counter;
@property (nonatomic,assign) const double noConst;
@end

@implementation Sample
- (instancetype) init {
    self = [super init];
    if (self) {
        self.no1 = 0.0;
        self.no2 = 0.0;
        self.length = 0.0;
        self.breadth = 0.0;
        [self addObserver:self forKeyPath:@"counter" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"counter"]) {
//        self.userNameLabel.text = change[NSKeyValueChangeNewKey];
        NSLog(@"new: %@, old:%@",change[NSKeyValueChangeNewKey],change[NSKeyValueChangeOldKey]);
    }
}

- (CGPoint) getMiddle {
    return CGPointMake(self.length / 2, self.breadth / 2);
}

- (void)setMiddle:(CGPoint)axis {
    self.no1 = axis.x - (self.length / 2);
    self.no2 = axis.y - (self.breadth / 2);
}

- (void)setCounter:(NSInteger)counter {
    //will set
    _counter = counter;
    //did set
}

- (NSDictionary*) origin {
    return @{
        @"no1": @(self.no1),
        @"no2": @(self.no2),
    };
}

//getter、setter方法都手动实现了，它将不会生成成员变量，并且会报错。
- (NSString*) lazyValue {
    if (!_lazyValue) {
        _lazyValue = @"lazyValue";
    }
    return _lazyValue;
}

- (void)setLazyValue:(NSString *)lazyValue{
    _lazyValue = [lazyValue copy];
}

- (void)setLength:(double)length {
    _length = length;
}


+ (NSString*) computedTypeProperty {
    return @"Sample";
}
@end


@implementation TestPropertyOC

- (void) testMain {
    
}

- (void) testStorageProperty {
    Sample* sampleDemo = [[Sample alloc] init];
    sampleDemo.no1 = 1;
    sampleDemo.no2 = 2;
    sampleDemo.noConst = 3;
}

- (void) testComputeProperty {
    Sample* sampleDemo = [[Sample alloc] init];
    NSLog(@"%f,%f",sampleDemo.middle.x,sampleDemo.middle.y);
}

- (void) testObserver {
    Sample* sampleDemo = [[Sample alloc] init];
    sampleDemo.counter = 100;
    sampleDemo.counter = 800;
}

- (void) testGloable {
    NSLog(@"%@",gloableString);
}

- (void) testClassProperty {
    NSLog(@"%@",[Sample computedTypeProperty]);
}

@end


