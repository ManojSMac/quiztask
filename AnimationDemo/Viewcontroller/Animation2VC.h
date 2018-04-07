//
//  Animation2VC.h
//  AnimationDemo
//
//  Created by Shenll-Mac-04 on 07/04/18.
//  Copyright © 2018 Shenll-Mac-04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTransitionAnimator.h"

@interface Animation2VC : UIViewController<UITableViewDelegate,UITableViewDataSource,CustomTransitionAnimating,UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UITableView *AnimationOneTblView;

@end
