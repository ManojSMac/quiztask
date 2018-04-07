

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark - <ZoomTransitionAnimating>

- (UIImageView *)transitionSourceImageView
{
    if([_strFrom  isEqual: @"Animation4"])
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.mainImageView.image];
        imageView.frame = CGRectMake(self.mainImageView.frame.origin.x + 20, self.mainImageView.frame.origin.y + 20, self.mainImageView.frame.size.width - 30, self.mainImageView.frame.size.height - 30);
        return imageView;
    }else{
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.mainImageView.image];
        imageView.contentMode = self.mainImageView.contentMode;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = NO;
        imageView.frame = self.mainImageView.frame;
        return imageView;
    }
   
}

- (UIColor *)transitionSourceBackgroundColor
{
    return self.view.backgroundColor;
}

- (CGRect)transitionDestinationImageViewFrame
{
   
        CGFloat width = CGRectGetWidth(self.view.frame);
        CGRect frame = self.mainImageView.frame;
        frame.size.width = width;
         return frame;
    
}

#pragma mark - <CustomTransitionDelegate>

- (void)zoomTransitionAnimator:(CustomTransitionAnimator *)animator
         didCompleteTransition:(BOOL)didComplete
      animatingSourceImageView:(UIImageView *)imageView
{
    self.mainImageView.image = imageView.image;
    
}

#pragma mark -

- (IBAction)closeButtonDidPush:(id)sender
{
     [self finishTransition];
    if([_strFrom  isEqual: @"Animation4"])
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"2.0" forKey:@"TimeInterval"];
        
        [UIView animateWithDuration:2.0f animations:^{
            self.view.backgroundColor = [UIColor whiteColor];
            self.mainView.transform = CGAffineTransformMakeScale(0.9f, 0.9f);
                        
        }completion:nil];        
        
        double delayInSeconds = 2.0f;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            [self dismissViewControllerAnimated:YES completion:nil];
        });
        
    }else
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"0.5" forKey:@"TimeInterval"];
       [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
- (void)finishTransition
{
    [UIView animateWithDuration:2.0 animations:^{
        self.backButton.alpha = 0.5;
       
    } completion:^(BOOL finished) {
        self.backButton.alpha = 0;
        self.backButton.transform = CGAffineTransformIdentity;
    }];
}

@end
