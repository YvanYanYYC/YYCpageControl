//
//  YYCpageControlViewController.h
//  YYCpageControl
//
//  Created by Just_ on 2017/2/27.
//  Copyright © 2017年 Just_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYCpageControlViewCell.h"

@interface YYCpageControlViewController : UIViewController
typedef void(^YYCpageControlCellHandle)(YYCpageControlViewCell *cell,NSIndexPath* indexPath);
typedef void(^YYCpageControlFinishButton)(UIButton *button);

@property (nonatomic,strong,readonly) UICollectionView *collectionView;

@property (nonatomic,strong,readonly) UIPageControl *pageControl;



-(instancetype)initWithNum:(NSInteger)number cellHandle:(YYCpageControlCellHandle)cellHandle finishButton:(YYCpageControlFinishButton)finishButton;

@end
