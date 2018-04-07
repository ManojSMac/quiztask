//
//  Animation2VC.m
//  AnimationDemo
//
//  Created by Shenll-Mac-04 on 07/04/18.
//  Copyright © 2018 Shenll-Mac-04. All rights reserved.
//

#import "Animation2VC.h"
#import "AnimationTVCell.h"
#import "DetailViewController.h"

@interface Animation2VC ()<UIViewControllerTransitioningDelegate>
{
    NSArray *ImageArray;
}


@end

@implementation Animation2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    self.title = @"Animation Two";
    
    ImageArray = [NSArray arrayWithObjects:@"01.png",@"02.png",@"03.png",@"04.png",@"05.png", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIColor *)transitionSourceBackgroundColor
{
    return self.AnimationOneTblView.backgroundColor;
}

#pragma mark - TableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ImageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableIdentifier = @"AnimationTVCell";
    AnimationTVCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[AnimationTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableIdentifier];
    }
    cell.AnimationImage.image = [UIImage imageNamed:ImageArray[indexPath.row]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DetailSegue" sender:self];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {    
    DetailViewController *vc = segue.destinationViewController;
    NSIndexPath *selectedIndexPath = [self.AnimationOneTblView indexPathForSelectedRow];
    vc.index = selectedIndexPath.row;
    vc.mainImageView.image = [UIImage imageNamed:ImageArray[selectedIndexPath.row]];
    vc.transitioningDelegate = self;
}


#pragma mark ZoomTransitionAnimating

- (UIImageView *)transitionSourceImageView
{
    NSIndexPath *selectedIndexPath = [self.AnimationOneTblView indexPathForSelectedRow];
    AnimationTVCell *cell = (AnimationTVCell *)[self.AnimationOneTblView cellForRowAtIndexPath:selectedIndexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:cell.AnimationImage.image];
    imageView.contentMode = cell.AnimationImage.contentMode;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = NO;
    CGRect frameInSuperview = [cell.AnimationImage convertRect:cell.AnimationImage.frame toView:self.AnimationOneTblView.superview];
    frameInSuperview.origin.x -= cell.layoutMargins.left;
    frameInSuperview.origin.y -= cell.layoutMargins.top ;
    imageView.frame = frameInSuperview;
    return imageView;
}


- (CGRect)transitionDestinationImageViewFrame
{
    NSIndexPath *selectedIndexPath = [self.AnimationOneTblView indexPathForSelectedRow];
    AnimationTVCell *cell = (AnimationTVCell *)[self.AnimationOneTblView cellForRowAtIndexPath:selectedIndexPath];
    CGRect frameInSuperview = [cell.AnimationImage convertRect:cell.AnimationImage.frame toView:self.AnimationOneTblView.superview];
    frameInSuperview.origin.x -= cell.frame.origin.x;
    frameInSuperview.origin.y -= cell.layoutMargins.top - 74;
    return frameInSuperview;
}


#pragma mark - <UIViewControllerTransitioningDelegate>

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    id <CustomTransitionAnimating, CustomTransitionDelegate> sourceTransition = (id<CustomTransitionAnimating, CustomTransitionDelegate>)source;
    id <CustomTransitionAnimating, CustomTransitionDelegate> destinationTransition = (id<CustomTransitionAnimating, CustomTransitionDelegate>)presented;
    if ([sourceTransition conformsToProtocol:@protocol(CustomTransitionAnimating)] &&
        [destinationTransition conformsToProtocol:@protocol(CustomTransitionAnimating)]) {
        CustomTransitionAnimator *animator = [[CustomTransitionAnimator alloc] init];
        animator.goingForward = YES;
        animator.sourceTransition = sourceTransition;
        animator.destinationTransition = destinationTransition;
        return animator;
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    id <CustomTransitionAnimating, CustomTransitionDelegate> sourceTransition = (id<CustomTransitionAnimating, CustomTransitionDelegate>)dismissed;
    id <CustomTransitionAnimating, CustomTransitionDelegate> destinationTransition = (id<CustomTransitionAnimating, CustomTransitionDelegate>)self;
    if ([sourceTransition conformsToProtocol:@protocol(CustomTransitionAnimating)] &&
        [destinationTransition conformsToProtocol:@protocol(CustomTransitionAnimating)]) {
        CustomTransitionAnimator *animator = [[CustomTransitionAnimator alloc] init];
        animator.goingForward = NO;
        animator.sourceTransition = sourceTransition;
        animator.destinationTransition = destinationTransition;
        return animator;
    }
    return nil;
}

@end
