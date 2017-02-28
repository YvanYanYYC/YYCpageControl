//
//  YYCpageControlViewController.m
//  YYCpageControl
//
//  Created by Just_ on 2017/2/27.
//  Copyright © 2017年 Just_. All rights reserved.
//

#import "YYCpageControlViewController.h"

@interface YYCpageControlViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property(nonatomic,copy) YYCpageControlCellHandle cellHandle;
@property(nonatomic,copy) YYCpageControlFinishButton finishButton;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,assign) NSInteger number;

@end

@implementation YYCpageControlViewController

-(instancetype)initWithNum:(NSInteger)number cellHandle:(YYCpageControlCellHandle)cellHandle finishButton:(YYCpageControlFinishButton)finishButton{
    if(self = [super initWithNibName:nil bundle:nil]){
        _number = number;
        _cellHandle = cellHandle;
        _finishButton = finishButton;
        
        [self.view addSubview:self.collectionView];
        [self.view addSubview:self.pageControl];
        
        [self.collectionView registerClass:[YYCpageControlViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return self;
}

#pragma mark - collectionView
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.number;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YYCpageControlViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if(indexPath.row != self.number-1){
        cell.button.hidden = YES;
    }else{
        cell.button.hidden = NO;
        [cell.button addTarget:self action:@selector(finishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if(self.cellHandle){
        self.cellHandle(cell,indexPath);
    }
    
    return cell;
}

-(void)finishButton:(UIButton *)button{
    if(self.finishButton){
        self.finishButton(button);
    }
}

#pragma mark - scrollView
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger pageNum = scrollView.contentOffset.x/scrollView.bounds.size.width + 0.5;
    if(pageNum != self.pageControl.currentPage){
        self.pageControl.currentPage = pageNum;
    }
}


#pragma mark - init
-(UICollectionView *)collectionView{
    
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.view.bounds.size;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.showsHorizontalScrollIndicator = NO;//不显示水平滚动条
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _collectionView = collectionView;
    }
    
    return _collectionView;
}

-(UIPageControl *)pageControl{
    if(!_pageControl){
        UIPageControl *pageControl = [[UIPageControl alloc]init];
        pageControl.numberOfPages = self.number;
        pageControl.currentPage = 0;
        CGSize pageControlSize = [pageControl sizeForNumberOfPages:self.number];
        
        pageControl.frame = CGRectMake((self.view.bounds.size.width-pageControlSize.width)/2, self.view.bounds.size.height - pageControlSize.height-70.0f, pageControlSize.width, pageControlSize.height);
        _pageControl = pageControl;
    }
    return _pageControl;
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
