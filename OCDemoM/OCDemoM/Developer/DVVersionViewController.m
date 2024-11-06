//
//  DVVersionViewController.m
//  OCDemoM
//
//  Created by FlutterRole on 2024/10/31.
//

#import "DVVersionViewController.h"

@interface DVVersionViewController ()
@property (nonatomic, strong) UIView* drawView;
@property (nonatomic, strong) UIView* lastView;
@property (nonatomic, strong) NSMutableArray* lastViewArray;
@property (nonatomic, strong) NSMutableDictionary* lastViewDictionary;
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation DVVersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lastViewDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    self.lastViewArray = [NSMutableArray arrayWithCapacity:3];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //添加画布
    self.drawView = [self getView];
    [self.view addSubview:self.drawView];
    
    //添加开始按钮
    [self.view addSubview:[self getButton]];
    
    //增加小球:点击按钮事件中
    
    //产生小球颜色:getBollColor
    
    //增加小球移动
    [self addTimer];
    
    //碰撞反弹
    
}


//- (void) raFrame:(CGRect)bollFrame{
//
//    bollFrame = [self getBollFrame:bollFrame];
//    //[self.drawView.layer addSublayer:[self getBallLayer:bollFrame]];
//    self.lastView = [self getBollView:bollFrame];
//    [self.drawView addSubview:self.lastView];
//}

- (void) automaticScroll {
    //UIView* lastView = self.lastView;
    
    //[self raFrame:lastView.frame];
    
    for (NSString* key in self.lastViewArray) {
        [self automaticScrollDict:key];
    }
}

//-------------------------
- (void) raFrame:(CGRect)bollFrame key:(NSString*)viewKey{
    
    bollFrame = [self getBollFrame:bollFrame];
    //[self.drawView.layer addSublayer:[self getBallLayer:bollFrame]];
    UIView* lastView = [self getBollView:bollFrame];
    [self.lastViewDictionary setObject:lastView forKey:viewKey];
    [self.drawView addSubview:lastView];
}

- (void) automaticScrollDict:(NSString*)viewKey {
//    UIView* lastView = self.lastView;
    UIView* lastView = [self.lastViewDictionary objectForKey:viewKey];
    [self raFrame:lastView.frame key:viewKey];
}

//-------------------------


- (CGRect) addPeng:(CGRect) frame {
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

- (void) addTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (CGRect) getBollFrame:(CGRect)frame {
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
    
    resultFrame = [self addPeng:resultFrame];
    
    return resultFrame;
}

- (UIColor*) getBollColor {
    float resultRed = (rand() % 255);  //产生0～255的数
    float resultGreen = (rand() % 255);  //产生0～255的数
    float resultBlue = (rand() % 255);  //产生0～55的数
    UIColor* color = [UIColor colorWithRed:resultRed/255 green:resultGreen/255 blue:resultBlue/255 alpha:1];
    return color;
}

- (CGRect) getViewFrame {
    return CGRectMake(30, 100, 300, 300);
}

- (CGFloat) getBallWidth {
    return 30;
}

- (UIView*) getBollView:(CGRect)frame {
    UIView* view =  [[UIView alloc] init];
    view.backgroundColor = [self getBollColor];
    view.frame = frame;
    view.layer.cornerRadius = frame.size.width / 2;
    view.clipsToBounds = YES;
    return view;
}

- (UIButton*) getButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 450, 30, 30);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (UIView*) getView {
    UIView* view = [[UIView alloc] init];
    view.frame = [self getViewFrame];
    view.backgroundColor = [UIColor grayColor];
    return view;
}

- (void) onButtonClicked:(id)sender {
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
    [self raFrame:bollFrame key:key];

#ifdef DEBUG
    NSLog(@"onButtonClicked");
#endif
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
