

#import <UIKit/UIKit.h>
#import "CustomTransitionAnimator.h"

@interface DetailViewController : UIViewController<CustomTransitionAnimating, CustomTransitionDelegate>

@property (nonatomic) NSUInteger index;

@property (nonatomic, weak) IBOutlet UIImageView *mainImageView;
@property (nonatomic, weak)  NSString *strFrom;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (nonatomic, weak) IBOutlet UIImageView *backButton;
@end
