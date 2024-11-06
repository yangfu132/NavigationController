//
//  DemoAnimationViewController.m
//  OCDemoM
//
//  Created by FlutterRole on 2024/10/31.
//

#import "DemoAnimationViewController.h"
#import "AnimationViewController.h"

@interface DemoAnimationViewController ()

@property (nonatomic, assign) BOOL isPush;

@property (nonatomic, assign) NSTimeInterval transitionDuration;

@end

@implementation DemoAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DemoAnimationViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:[self getButton]];
}

- (UIButton*) getButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 100, 100, 100);
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void) onButtonClicked:(id)sender {
    [self beginAnimation];
}

- (void) beginAnimation {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [self.view.window.layer addAnimation:transition forKey:nil];
    
    AnimationViewController* viewCtrl = [[AnimationViewController alloc] init];
    viewCtrl.isPresent = YES;
    [self presentViewController:viewCtrl animated:YES completion:^{
            
    }];
    
}

- (void) aaa {
    [UIView beginAnimations: @"ZBarHelp"
            context: nil];
    self.view.alpha = 1;
    [UIView commitAnimations];
}

//------------

- (UIImage *)screenShotImage:(UIView *)view {
    // 第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，设置为[UIScreen mainScreen].scale可以保证转成的图片不失真。
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO,[UIScreen mainScreen].scale);
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    } else {
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return viewImage;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // 转场过渡的容器 如果是PUSH时候，A->B是，fromVC是A，toVC是B；如果是POP的时候，fromVC是B，toVC是A。
    // Transition container
    UIView *containerView = [transitionContext containerView];

    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromVC.view;
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;

    UIImage *fromImage = [self screenShotImage:fromView];
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectZero];
    //backView.image = fromImage;
    backView.backgroundColor = [UIColor blackColor];
    backView.frame = containerView.bounds;
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = backView.bounds;
    //[backView addSubview:effectView];

    UIImageView *viewMaskView = [[UIImageView alloc] initWithFrame:CGRectZero];
    viewMaskView.backgroundColor = [UIColor blackColor];
    viewMaskView.frame = containerView.bounds;
    
    // 判断是 push 还是 pop 操作
    // Determine if it is a push or pop operation
    if (self.isPush) {
        //[containerView addSubview:backView];
        [containerView addSubview:fromView];
        [containerView addSubview:viewMaskView];
        [containerView addSubview:toView];

    } else {
        //[containerView addSubview:backView];
        [containerView addSubview:toView];
        [containerView addSubview:viewMaskView];
        [containerView addSubview:fromView];
    }
    
    
    CGRect fromFrame;
    CGRect toFrame;

    CGFloat beginAlpha = 0.0;
    if (self.isPush) {
        fromFrame = containerView.bounds;
        fromView.frame = fromFrame;
        
        toFrame = CGRectMake(containerView.bounds.size.width, 0, containerView.bounds.size.width, containerView.bounds.size.height);
        toView.frame = toFrame;
        beginAlpha = 0.0;
    } else {
        fromFrame = containerView.bounds;
        fromView.frame = fromFrame;
        
        toFrame = CGRectMake(containerView.bounds.size.width, 0, containerView.bounds.size.width, containerView.bounds.size.height);
        
        toView.frame = fromFrame;
        
        beginAlpha = 0.3;
    }

    viewMaskView.alpha = beginAlpha;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (self.isPush) {
            //fromView.transform = CGAffineTransformMakeScale(0.9, 0.9);
            toView.frame = fromFrame;
            viewMaskView.alpha = 0.3;
        } else {
            fromView.frame = toFrame;
            //toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            viewMaskView.alpha = 0.0;
        }
    } completion:^(BOOL finished) {
        BOOL cancelled = [transitionContext transitionWasCancelled];
        
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;

        // 删除遮罩
        [backView removeFromSuperview];
        [viewMaskView removeFromSuperview];
        
        // 设置 transitionContext 通知系统动画执行完毕
        [transitionContext completeTransition:!cancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self.transitionDuration;
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
