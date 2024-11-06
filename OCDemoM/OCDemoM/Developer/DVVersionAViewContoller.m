//
//  DVVersionAViewContoller.m
//  OCDemoM
//
//  Created by FlutterRole on 2024/11/1.
//

#import "DVVersionAViewContoller.h"

#define CALAYER_TEST 1

#define CADisplayLink_TEST 1

@interface DVVersionAViewContoller ()
@property (nonatomic, strong) UIView* drawView;
@property (nonatomic, strong) UIView* lastView;
@property (nonatomic, strong) NSMutableArray* lastViewArray;
@property (nonatomic, strong) NSMutableDictionary* lastViewDictionary;
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation DVVersionAViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lastViewDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.lastViewArray = [NSMutableArray arrayWithCapacity:3];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加画布
    self.drawView = [self getDrawView];
    [self.view addSubview:self.drawView];
    
    //添加开始按钮
    [self.view addSubview:[self generateButton]];
    
    //增加小球:参见onButtonClicked
    
    //产生小球颜色:参见getBollColor
    
    //移动小球
    [self moveBollWithTimer];
    
    //碰撞反弹:参见frameFromCheckCollision
    
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
    for (int index = 0; index < 100; index++ ) {
        [self generateBollTrack];
    }
    
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
    CGRect bollFrame = CGRectMake(150 + offsetX, 150 + offsetY, [self getBallWidth], [self getBallWidth]);
    NSString* key = [NSString stringWithFormat:@"%lu",(unsigned long)self.lastViewArray.count];
    [self.lastViewArray addObject:key];
    [self drawBoll:bollFrame key:key];
}

- (void) drawBoll:(CGRect)bollFrame key:(NSString*)viewKey{
    bollFrame = [self frameFromLastBoll:bollFrame];
#if CALAYER_TEST
    CAShapeLayer* lastLayer = [self createBollLayer:bollFrame];
    [self.lastViewDictionary setObject:lastLayer forKey:viewKey];
    [self.drawView.layer addSublayer:lastLayer];
#else
    UIView* lastView = [self createBollView:bollFrame];
    [self.lastViewDictionary setObject:lastView forKey:viewKey];
    [self.drawView addSubview:lastView];
#endif
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

- (CGRect) frameFromLastBoll:(CGRect)frame {
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
    
    resultFrame = [self frameFromCheckCollision:resultFrame];
    
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
#if CADisplayLink_TEST
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveBollTrack)];
    link.preferredFramesPerSecond = 3;
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
#else
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveBollTrack) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
#endif
}

- (void) moveBollTrack {
    for (NSString* key in self.lastViewArray) {
        [self moveBollWithKey:key];
    }
}

- (void) moveBollWithKey:(NSString*)viewKey {
#if CALAYER_TEST
    CAShapeLayer* lastLayer = [self.lastViewDictionary objectForKey:viewKey];
    UIBezierPath* path = [UIBezierPath bezierPathWithCGPath:lastLayer.path];
    [self drawBoll:path.bounds key:viewKey];
#else
    UIView* lastView = [self.lastViewDictionary objectForKey:viewKey];
    [self drawBoll:lastView.frame key:viewKey];
#endif
}

#pragma mark - Collision

- (CGRect) frameFromCheckCollision:(CGRect) frame {
    //上
    if (frame.origin.y < 0) {
        frame.origin.y = 10;
    }
    
    //下
    if (frame.origin.y + frame.size.height > 300) {
        frame.origin.y = frame.origin.y - 30;
    }
    
    //左
    if (frame.origin.x < 0) {
        frame.origin.x = 10;
    }
    
    //右
    if (frame.origin.x + frame.size.width > 300) {
        frame.origin.x = frame.origin.x - 30;
    }
    
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
