//
//  TestProperty.h
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestProperty : NSObject {
    @public
    NSString* publicVar;
    
    @protected
    NSString* protectVar;
    
    @private
    NSString* privateVar;
}


@property (nonatomic,copy) NSString* propertyVar;

@end

NS_ASSUME_NONNULL_END
