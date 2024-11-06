//
//  AnimationViewController.m
//  OCDemoM
//
//  Created by FlutterRole on 2024/10/31.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()<CAAnimationDelegate>
@property (nonatomic,strong) UIImageView *dong1;
@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AnimationViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:[self getButton]];
    [self.view addSubview:[self getButton1]];
}

- (UIButton*) getButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (UIButton*) getButton1 {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 100, 100, 100);
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(onButton1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void) onButton1Clicked:(id)sender {
    if (self.isPresent) {
        [self dismissViewControllerAnimated:YES completion:^{
                    
        }];
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void) onButtonClicked:(id)sender {
    float rate = [self imageRate];
    float offsetX = [self offsetX];
    float offsetY = [self offsetY];
    float dongDuration = 0.5;
    
    //转动骰子的载入
    NSArray *myImages = [NSArray arrayWithObjects:
                         [UIImage imageNamed:@"dong1.png"],
                         [UIImage imageNamed:@"dong2.png"],
                         [UIImage imageNamed:@"dong3.png"],nil];
    //骰子1的转动图片切换
    UIImageView *dong11 = [UIImageView alloc];
    dong11 = [dong11 initWithFrame:CGRectMake(85.0 * rate + offsetX, 115.0 * rate + offsetY, 45.0 * rate, 45.0 * rate)];
    dong11.animationImages = myImages;
    dong11.animationDuration = dongDuration;
    [dong11 startAnimating];
    [self.view addSubview:dong11];
    self.dong1 = dong11;
    
    
    //******************旋转动画******************
    //设置动画
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [spin setToValue:[NSNumber numberWithFloat:M_PI * 16.0 * rate]];
    [spin setDuration:4];
    //******************位置变化******************
    
    
    float positionDuration = 4.0f;
    //骰子1的位置变化
    CGPoint p1 = CGPointMake(85.0 * rate + offsetX, 115.0 * rate + offsetY);
    CGPoint p2 = CGPointMake(165.0 * rate + offsetX, 100.0 * rate + offsetY);
    CGPoint p3 = CGPointMake(240.0 * rate + offsetX, 160.0 * rate + offsetY);
    CGPoint p4 = CGPointMake(140.0 * rate + offsetX, 200.0 * rate + offsetY);
    NSArray *keypoint = [[NSArray alloc] initWithObjects:[NSValue valueWithCGPoint:p1],[NSValue valueWithCGPoint:p2],[NSValue valueWithCGPoint:p3],[NSValue valueWithCGPoint:p4], nil];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setValues:keypoint];
    [animation setDuration:positionDuration];
    [animation setDelegate:self];
    [dong11.layer setPosition:CGPointMake(140.0 * rate, 200.0 * rate + offsetY)];
    
    
    
    //******************动画组合******************
    float groupDuration = 4.0f;
    //骰子1的动画组合
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects: animation, spin,nil];
    animGroup.duration = groupDuration;
    [animGroup setDelegate:self];
    [[dong11 layer] addAnimation:animGroup forKey:@"position"];
    
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self finishAnimation];
}

- (void) finishAnimation {
    [self.dong1 stopAnimating];
}

- (CGFloat) offsetY
{
    return 40.0f;
}

- (CGFloat) offsetX
{
    return 10.0f * [self imageRate];
}

- (float) imageRate
{
    return [self rateWidth];
}

- (float) rateWidth
{
    float rateX = [self backgroundWith] / 320;
    
    return rateX;
}

- (CGFloat) backgroundWith
{
    CGRect rectScreen = [[UIScreen mainScreen] bounds];
    float widthBg = rectScreen.size.height > rectScreen.size.width ? rectScreen.size.width : rectScreen.size.height;
    
    return widthBg;
}


@end
