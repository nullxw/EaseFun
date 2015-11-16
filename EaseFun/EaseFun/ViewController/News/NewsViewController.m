//
//  NewsViewController.m
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsViewModel.h"
#import "AllNewsCell.h"
#import "iCarousel.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NewsViewModel *newsVM;
@end

@implementation NewsViewController
{
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLB;
    NSTimer *_timer;
}

-(UIView *)headerView{
    [_timer invalidate];
    
    if(!self.newsVM.focusImageCount){
        return nil;
    }
    
    /**头部视图 origin无效  ，宽度无效，与tableView同宽*/
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW*0.618)];
    /**headerView的底部*/
    UIView *bottomView=[UIView new];
    bottomView.backgroundColor=kRGBColor(240, 240, 240);
    [headerView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLB=[UILabel new];
    [bottomView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _titleLB.text=[self.newsVM titleForRow:0];
    
    _pageControl=[UIPageControl new];
    _pageControl.numberOfPages=self.newsVM.focusImageCount;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_greaterThanOrEqualTo(20);
        make.width.mas_lessThanOrEqualTo(60);
        make.left.mas_equalTo(_titleLB.mas_right).mas_equalTo(10);
    }];
    
    
    _ic=[iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate=self;
    _ic.dataSource=self;
    _ic.pagingEnabled=YES;
    _ic.type=3;
    _ic.scrollSpeed=1;
    _pageControl.hidesForSinglePage=YES;
    _pageControl.userInteractionEnabled=NO;
    _ic.scrollEnabled=self.newsVM.focusImageCount != 1;
    _pageControl.pageIndicatorTintColor=[UIColor blackColor];
    _pageControl.currentPageIndicatorTintColor=[UIColor redColor];
    
    if(self.newsVM.focusImageCount > 1){
        _timer=[NSTimer bk_scheduledTimerWithTimeInterval:6 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    
    return headerView;
}

-(NewsViewModel *)newsVM{
    if(!_newsVM){
        _newsVM=[NewsViewModel new];
    }
    return _newsVM;
}

-(UITableView *)tableView{
    if(!_tableView){
        _tableView=[UITableView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableFooterView=[UIView new];
        [_tableView registerClass:[NewsCommonCell class] forCellReuseIdentifier:@"CommonCell"];
        [_tableView registerClass:[NewsBigCoverCell class] forCellReuseIdentifier:@"BigCoverCell"];
        [_tableView registerClass:[NewsImagesCell class] forCellReuseIdentifier:@"ImagesCell"];
        _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.newsVM refreshDataCompletionHandle:^(NSError *error) {
               if(error){
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   _tableView.tableHeaderView=[self headerView];
                   [_tableView reloadData];
               }
               [_tableView.mj_header endRefreshing];
           }];
        }];
        _tableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
           [self.newsVM getMoreDataCompletionHandle:^(NSError *error) {
               if(error){
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   [_tableView reloadData];
               }
               [_tableView.mj_footer endRefreshing];
           }];
        }];
    }
    return _tableView;
}

-(id)init{
    if(self=[super init]){
        self.title=@"新闻";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark -UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsVM.rowNumber - self.newsVM.focusImageCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //第0行数据其实是第0+头部图片数个数据
    NSInteger index = indexPath.row + self.newsVM.focusImageCount;
    //三张图片的Cell
    if([self.newsVM containsImagesForRow:index]){
        NewsImagesCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ImagesCell"];
        
        cell.titleLB.text=[self.newsVM titleForRow:index];
        NSArray *iconIVs=@[cell.iconIV1.imageView,cell.iconIV2.imageView,cell.iconIV3.imageView];
        NSArray *URLs=[self.newsVM imageURLsForRow:index];
        for(int i=0;i<3;i++){
            [iconIVs[i] setImageWithURL:URLs[i] placeholderImage:[UIImage imageNamed:@"no_data"]];
        }
        cell.commentLB.text=[self.newsVM commentCountForRow:index];
        
        return cell;
    }else if([self.newsVM containsBigCoverForRow:index] || [self.newsVM containsVideoForRow:index]){//有大封面的Cell
        NewsBigCoverCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BigCoverCell"];
        UIButton *btn=(UIButton *)[cell viewWithTag:1000];
        [btn removeFromSuperview];
        cell.titleLB.text=[self.newsVM titleForRow:index];
        if([self.newsVM containsVideoForRow:index]){
            [cell.coverIV.imageView setImageWithURL:[self.newsVM iconURLForRow:index] placeholderImage:[UIImage imageNamed:@"no_data"]];
            UIButton *playBtn=[UIButton buttonWithType:0];
            [cell.contentView addSubview:playBtn];
            [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(50, 50));
            }];
            playBtn.tag=1000;
            [playBtn setBackgroundImage:[UIImage imageNamed:@"no_data"] forState:UIControlStateNormal];
            [playBtn bk_addEventHandler:^(id sender) {
                DDLogVerbose(@"click==========");
            } forControlEvents:UIControlEventTouchUpInside];
        }else{
            [cell.coverIV.imageView setImageWithURL:[self.newsVM bigCoverURLForRow:index] placeholderImage:[UIImage imageNamed:@"no_data"]];
        }
        cell.commentLB.text=[self.newsVM commentCountForRow:index];
        
        return cell;
    }else{//普通Cell
        NewsCommonCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CommonCell"];
        
        [cell.iconIV.imageView setImageWithURL:[self.newsVM iconURLForRow:index] placeholderImage:[UIImage imageNamed:@"no_data"]];
        cell.titleLB.text=[self.newsVM titleForRow:index];
        cell.descLB.text=[self.newsVM introForRow:index];
        cell.commentLB.text=[self.newsVM commentCountForRow:index];
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark -iCarouselDelegate,iCarouselDataSource

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.newsVM.focusImageCount;
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if(option == iCarouselOptionWrap){
        return YES;
    }
    if(option == iCarouselOptionSpacing){
        return value*1.5;
    }
    return value;
}

-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _titleLB.text=[self.newsVM titleForRow:carousel.currentItemIndex];
    _pageControl.currentPage=carousel.currentItemIndex;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if(!view){
        view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW *0.618-35)];
        UIImageView *imageView=[UIImageView new];
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        imageView.contentMode=UIViewContentModeScaleAspectFill;
        imageView.tag=100;
        view.clipsToBounds=YES;
    }
    UIImageView *imageView=(UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:self.newsVM.focusImages[index] placeholderImage:[UIImage imageNamed:@"no_data"]];
    return view;
}

@end
