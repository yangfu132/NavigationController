//
//  LCAnimationViewContoller.m
//  OCDemoM
//
//  Created by FlutterRole on 2024/11/1.
//

#import "LCAnimationViewContoller.h"

#define CALAYER_TEST 1

@interface LCAnimationViewContoller ()
@property (nonatomic, strong) UIView* drawView;
@property (nonatomic, strong) UIView* protectView;
@property (nonatomic, strong) UIView* lastView;
@property (nonatomic, strong) NSMutableArray* lastViewArray;
@property (nonatomic, strong) NSMutableDictionary* lastViewDictionary;
@property (nonatomic, strong) NSMutableDictionary* abilityDictionary;
@property (nonatomic, strong) NSMutableDictionary* collisionDictionary;
@property (nonatomic, strong) NSMutableDictionary* xDictionary;
@property (nonatomic, strong) NSMutableDictionary* yDictionary;
@property (nonatomic, strong) NSMutableDictionary* widthDictionary;
@property (nonatomic, strong) NSMutableDictionary* heightDictionary;
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation LCAnimationViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lastViewDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.abilityDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.collisionDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.xDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.yDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.widthDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.heightDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.lastViewArray = [NSMutableArray arrayWithCapacity:3];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加画布
    self.drawView = [self getDrawView];
    [self.view addSubview:self.drawView];
    
    //增加保护区
    self.protectView = [self getProtectView];
    [self.drawView addSubview:self.protectView];
    
    //进入保护区增加分裂能力：参见updateAbility
    
    //碰撞到边缘分裂成两个新的小球，新的小球不具有分裂能力:参见generateCollision
    
    //添加开始按钮
    [self.view addSubview:[self generateButton]];
    
    //增加小球:参见onButtonClicked
    
    //产生小球颜色:参见getBollColor
    
    //移动小球
    [self moveBollWithTimer];
    
    //碰撞反弹:参见frameFromCheckCollision
    
}

//进入保护区增加分裂能力
- (void) updateAbility:(NSString*)viewKey {
    if ([self checkEnter:viewKey]) {
        [self.abilityDictionary setObject:@(YES) forKey:viewKey];
    } // else nothing
}

- (BOOL) checkEnter:(NSString*)viewKey {
    CAShapeLayer* lastLayer = [self.lastViewDictionary objectForKey:viewKey];
    UIBezierPath* path = [UIBezierPath bezierPathWithCGPath:lastLayer.path];
    CGRect frame = path.bounds;
    CGRect protectFrame = self.protectView.frame;
    BOOL bResult = NO;
    BOOL bResultLeft = NO;
    if (frame.origin.x >= protectFrame.origin.x && frame.origin.y >= protectFrame.origin.y) {
        bResultLeft = YES;
    }
    
    if (frame.origin.x + frame.size.width <= protectFrame.origin.x + protectFrame.size.width && frame.origin.y + frame.size.height <= protectFrame.origin.y + protectFrame.size.height) {
        if (bResultLeft) {
            bResult = YES;
        }
    }
    
    return bResult;
    
}

//碰撞到边缘分裂成两个新的小球，新的小球不具有分裂能力

- (void) generateCollision:(NSString*)viewKey {
    BOOL bCollision = [[self.collisionDictionary objectForKey:viewKey] boolValue];
    BOOL bAbility = [[self.abilityDictionary objectForKey:viewKey] boolValue];
    if (bCollision && bAbility) {
        
        CGPoint point = [self getCollisionPoint:viewKey];
        CGRect bollFrame = CGRectMake(point.x, point.y, [self getBallWidth], [self getBallWidth]);
        [self generateBollTrackCollision:bollFrame];
        [self generateBollTrackCollision:bollFrame];
    }
}

- (void) generateBollTrackCollision:(CGRect)bollFrame {
    NSString* key = [NSString stringWithFormat:@"%lu",(unsigned long)self.lastViewArray.count];
    [self.lastViewArray addObject:key];
    [self drawBoll:bollFrame key:key];
}

- (CGPoint) getCollisionPoint:(NSString*)viewKey {
    CGFloat x = [[self.xDictionary objectForKey:viewKey] doubleValue];
    CGFloat y = [[self.yDictionary objectForKey:viewKey] doubleValue];
    return CGPointMake(x, y);
}

#pragma mark - protect View

- (CGRect) getProtectViewFrame {
    CGFloat width = 200;
    CGFloat height = 200;
    CGFloat x = ([self getDrawViewFrame].size.width - width) / 2;
    CGFloat y = ([self getDrawViewFrame].size.height - height) / 2;
    return CGRectMake(x, y, width, height);
}

- (UIView*) getProtectView {
    UIView* view = [[UIView alloc] init];
    view.frame = [self getProtectViewFrame];
    view.backgroundColor = [UIColor redColor];
    return view;
}

#pragma mark - Draw View

- (CGRect) getDrawViewFrame {
    return CGRectMake(30, 100, 300, 300);
}

- (UIView*) getDrawView {
    UIView* view = [[UIView alloc] init];
    view.frame = [self getDrawViewFrame];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

#pragma mark - Start Button

- (UIButton*) generateButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 450, 30, 30);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}


- (void) onButtonClicked:(id)sender {
    [self generateBollTrack];
    
#ifdef DEBUG
    NSLog(@"onButtonClicked");
#endif
}

#pragma mark - Generate Boll Track

- (void) generateBollTrack {
    int rax = rand() % 2;
    if (0 == rax) {
        rax = -1;
    }
    int ray = rand() % 2;
    if (0 == ray) {
        ray = -1;
    }
    CGFloat offsetX =  rand() % 100 * rax;
    CGFloat offsetY =  rand() % 100 * ray;
    CGFloat width = [self getDrawViewFrame].size.width;
    CGFloat height = [self getDrawViewFrame].size.height;
    CGRect bollFrame = CGRectMake(width / 2 + offsetX, height / 2 + offsetY, [self getBallWidth], [self getBallWidth]);
    NSString* key = [NSString stringWithFormat:@"%lu",(unsigned long)self.lastViewArray.count];
    [self.lastViewArray addObject:key];
    [self drawBoll:bollFrame key:key];
}

- (void) drawBoll:(CGRect)bollFrame key:(NSString*)viewKey{
    bollFrame = [self frameFromLastBoll:bollFrame key:viewKey];
#if CALAYER_TEST
    CAShapeLayer* lastLayer = [self createBollLayer:bollFrame];
    [self.lastViewDictionary setObject:lastLayer forKey:viewKey];
    [self.drawView.layer addSublayer:lastLayer];
#else
    UIView* lastView = [self createBollView:bollFrame];
    [self.lastViewDictionary setObject:lastView forKey:viewKey];
    [self.drawView addSubview:lastView];
#endif
    [self updateAbility:viewKey];
    [self generateCollision:viewKey];
}

- (UIView*) createBollView:(CGRect)frame {
    UIView* view =  [[UIView alloc] init];
    view.backgroundColor = [self generateBollColor];
    view.frame = frame;
    view.layer.cornerRadius = frame.size.width / 2;
    view.clipsToBounds = YES;
    return view;
}

- (CAShapeLayer*) createBollLayer:(CGRect)frame {
    CAShapeLayer* layer =  [[CAShapeLayer alloc] init];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:frame];
    layer.path = path.CGPath;
    layer.fillColor = [self generateBollColor].CGColor;
    return layer;
}

- (CGRect) frameFromLastBoll:(CGRect)frame key:(NSString*)viewKey{
    CGRect resultFrame = frame;
    int rax = rand() % 2;
    if (0 == rax) {
        rax = -1;
    }
    
    int ray = rand() % 2;
    if (0 == ray) {
        ray = -1;
    }
    
    CGFloat rx = rand() % 10;
    CGFloat ry = rand() % 10;
    
    resultFrame.origin.x = resultFrame.origin.x + rx * rax;
    resultFrame.origin.y = resultFrame.origin.y + ry * ray;
    
    resultFrame = [self frameFromCheckCollision:resultFrame key:viewKey];
    
    return resultFrame;
}

- (CGFloat) getBallWidth {
    return 30;
}

#pragma mark - Genreate Boll Color

- (UIColor*) generateBollColor {
    float resultRed = (rand() % 255);  //产生0～255的数
    float resultGreen = (rand() % 255);  //产生0～255的数
    float resultBlue = (rand() % 255);  //产生0～255的数
    UIColor* color = [UIColor colorWithRed:resultRed/255 green:resultGreen/255 blue:resultBlue/255 alpha:1];
    return color;
}

#pragma mark - Move Boll

- (void) moveBollWithTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveBollTrack) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void) moveBollTrack {
    NSArray* array = [self.lastViewArray copy];
    for (NSString* key in array) {
        [self moveBollWithKey:key];
    }
}

- (void) moveBollWithKey:(NSString*)viewKey {
#if CALAYER_TEST
    BOOL bCollision = [[self.collisionDictionary objectForKey:viewKey] boolValue];;
    BOOL bAbility = [[self.abilityDictionary objectForKey:viewKey] boolValue];
    if (bCollision && bAbility) {
        
    } else {
        CAShapeLayer* lastLayer = [self.lastViewDictionary objectForKey:viewKey];
        UIBezierPath* path = [UIBezierPath bezierPathWithCGPath:lastLayer.path];
        [self drawBoll:path.bounds key:viewKey];
    }

#else
    UIView* lastView = [self.lastViewDictionary objectForKey:viewKey];
    [self drawBoll:lastView.frame key:viewKey];
#endif
}

#pragma mark - Collision

- (CGRect) frameFromCheckCollision:(CGRect) frame key:(NSString*)viewKey{
    CGFloat width = [self getDrawViewFrame].size.width;
    CGFloat height = [self getDrawViewFrame].size.height;
    BOOL bCollision = NO;
    //上
    if (frame.origin.y < 0) {
        frame.origin.y = 10;
        bCollision = YES;
    }
    
    //下
    if (frame.origin.y + frame.size.height > height) {
        frame.origin.y = frame.origin.y - 30;
        bCollision = YES;
    }
    
    //左
    if (frame.origin.x < 0) {
        frame.origin.x = 10;
        bCollision = YES;
    }
    
    //右
    if (frame.origin.x + frame.size.width > width) {
        frame.origin.x = frame.origin.x - 30;
        bCollision = YES;
    }
    
    [self.xDictionary setObject:@(frame.origin.x) forKey:viewKey];
    [self.yDictionary setObject:@(frame.origin.y) forKey:viewKey];
    [self.widthDictionary setObject:@(frame.size.width) forKey:viewKey];
    [self.heightDictionary setObject:@(frame.size.height) forKey:viewKey];
    
    [self.collisionDictionary setObject:@(bCollision) forKey:viewKey];
    
    return frame;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
