//
//  DemoViewController.m
//  OCDemoM
//
//  Created by FlutterRole on 2024/10/31.
//

#import "DemoViewController.h"
#import "LCDemoViewController.h"
#import "AnimationViewController.h"
#import "DemoAnimationViewController.h"
@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"DemoView";
    // Do any additional setup after loading the view.

    [self.view addSubview:[self getButton]];
    [self.view addSubview:[self getButton1]];
    [self.view addSubview:[self getButton2]];
    
    
}

- (UILabel*) getLabel{
    UILabel* label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.text = @"DemoTableView";
    label.textColor = [UIColor blackColor];
    CGRect rect = [[UIScreen mainScreen] bounds];
    label.frame = CGRectMake((rect.size.width - 100) / 2, 0, 100, 100);
    return label;
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

- (UIButton*) getButton2 {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 210, 100, 100);
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(onButton2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}


- (void) onButtonClicked:(id)sender {
    LCDemoViewController* lcVC = [[LCDemoViewController alloc] init];
    [self.navigationController pushViewController:lcVC animated:YES];
#ifdef DEBUG
    NSLog(@"onButtonClicked");
#endif
}

- (void) onButton1Clicked:(id)sender {
    AnimationViewController* tableVC = [[AnimationViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
#ifdef DEBUG
    NSLog(@"onButtonClicked");
#endif
}

- (void) onButton2Clicked:(id)sender {
    DemoAnimationViewController* tableVC = [[DemoAnimationViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
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
