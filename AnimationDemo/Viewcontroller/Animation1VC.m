//
//  Animation1VC.m
//  DemoAnimation
//
//  Created by Shenll-Mac-04 on 05/04/18.
//  Copyright © 2018 Shenll-Mac-04. All rights reserved.
//

#import "Animation1VC.h"
#import "AnimationTVCell.h"

@interface Animation1VC ()
{
    NSArray *ImageArray;
}

@end

@implementation Animation1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Animation One";
    ImageArray = [NSArray arrayWithObjects:@"01.png",@"02.png",@"03.png",@"04.png",@"05.png", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [UIView animateWithDuration:0.5f animations:^{
        cell.AnimationImage.transform = CGAffineTransformIdentity;
    }completion:nil];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationTVCell *cell = (AnimationTVCell *)[tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.5f animations:^{
        cell.AnimationImage.transform = CGAffineTransformMakeScale(0.9f, 0.9f);
        
    }completion:nil];
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationTVCell *cell = (AnimationTVCell *)[tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.5f animations:^{
        cell.AnimationImage.transform = CGAffineTransformIdentity;
    }completion:nil];
    
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    AnimationTVCell *cell = (AnimationTVCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.AnimationImage.transform = CGAffineTransformIdentity;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_AnimationOneTblView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"Did Scroll");
}



@end
