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

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NewsViewModel *newsVM;
@end

@implementation NewsViewController

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
}

#pragma mark -UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
