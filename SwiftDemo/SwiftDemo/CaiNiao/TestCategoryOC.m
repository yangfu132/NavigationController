//
//  TestCategoryOC.m
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/16.
//

#import "TestCategoryOC.h"
@implementation TestCategoryBaseOC
- (void) printDemo {
    NSLog(@"TestCategoryBaseOC");
}
@end

@implementation TestCategoryOC
- (void) printDemo {
    NSLog(@"TestCategoryOC");
}
@end

@implementation TestCategoryOC(CaiNiao)

- (instancetype) initWithWidth:(CGFloat)width height:(CGFloat)height {
    self = [super init];
    if (self) {
        self.demoWidth = width;
        self.demoHeight = height;
        
    }
    return self;
}

- (void) printCaiNiao {
    NSLog(@"CaiNiao");
}

- (CGFloat)demoArea {
    return self.demoWidth * self.demoHeight;
}

- (void)setDemoArea:(CGFloat)demoArea {
    self.demoWidth = 100;
    self.demoHeight = demoArea / self.demoWidth;
}

@end
