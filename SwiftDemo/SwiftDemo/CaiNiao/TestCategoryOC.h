//
//  TestCategoryOC.h
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestCategoryBaseOC : NSObject
@end

@interface TestCategoryOC : TestCategoryBaseOC
@property (nonatomic,assign) CGFloat demoWidth;
@property (nonatomic,assign) CGFloat demoHeight;
@end


@interface TestCategoryOC(CaiNiao)
@property (nonatomic,assign) CGFloat demoArea;

- (instancetype) initWithWidth:(CGFloat)width height:(CGFloat)height;

- (void) printCaiNiao;
@end

NS_ASSUME_NONNULL_END
