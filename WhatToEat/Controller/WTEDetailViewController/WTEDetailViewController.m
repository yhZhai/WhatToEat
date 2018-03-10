//
//  WTEDetailViewController.m
//  WhatToEat
//
//  Created by 翟元浩 on 2018/3/10.
//  Copyright © 2018年 翟元浩. All rights reserved.
//

#import "WTEDetailViewController.h"
#import <Masonry.h>

@interface WTEDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *pictureImageView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *locationLabel;
@property (strong, nonatomic) UILabel *informationLabel;
@property (strong, nonatomic) UIButton *likeButton;
@property (strong, nonatomic) UIBarButtonItem *jumpButton;

@end

@implementation WTEDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:35.0f / 255.0f green:173.0f / 255.0f blue:229.0f / 255.0f alpha:1];
    self.navigationItem.rightBarButtonItem = self.jumpButton;
    
    [self.view addSubview:self.pictureImageView];
    [self.pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_width).multipliedBy(0.2);
        make.width.equalTo(self.pictureImageView.mas_height);
        make.top.equalTo(self.view.mas_top).offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [self.view addSubview:self.scrollView];
    //    self.scrollView.frame = self.view.bounds;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pictureImageView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [self.scrollView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_top);
        make.centerX.equalTo(self.scrollView.mas_centerX);
    }];
    [self.scrollView addSubview:self.locationLabel];
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.centerX.equalTo(self.scrollView.mas_centerX);
    }];
    [self.scrollView addSubview:self.informationLabel];
    [self.informationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.locationLabel.mas_bottom);
        make.centerX.equalTo(self.scrollView.mas_centerX);
    }];
    [self.scrollView addSubview:self.likeButton];
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.pictureImageView.mas_centerY);
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.width.equalTo(self.pictureImageView.mas_width).multipliedBy(0.25);
        make.height.equalTo(self.likeButton.mas_width);
    }];
    [self.scrollView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.informationLabel.mas_bottom);
        make.left.equalTo(self.scrollView.mas_left);
        make.right.equalTo(self.scrollView.mas_right);
    }];
}

- (void)jumpButtonDidClick:(UIBarButtonItem *)sender {
    
}

#pragma mark - TableView Delegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - Getter & Setter
- (void)setStoreItemViewModel:(StoreItemViewModel *)storeItemViewModel {
    _storeItemViewModel = storeItemViewModel;
    StoreItemModel *storeItemModel = storeItemViewModel.model;
    self.nameLabel.text = storeItemModel.name;
    self.locationLabel.text = storeItemModel.location;
    if (storeItemModel.isLike) {
        [self.likeButton setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    } else {
        [self.likeButton setImage:[UIImage imageNamed:@"unlike"] forState:UIControlStateNormal];
    }
    NSData *pictureData = [NSData dataWithContentsOfURL:storeItemModel.pictureURL];
    if (pictureData == nil) {
        self.pictureImageView.image = [UIImage imageNamed:@"food3"];
    } else {
        self.pictureImageView.image = [UIImage imageWithData:pictureData];
    }

}
//- (void)setStoreItemModel:(StoreItemModel *)storeItemModel {
//    _storeItemModel = storeItemModel;
//    self.nameLabel.text = storeItemModel.name;
//    self.locationLabel.text = storeItemModel.location;
//    if (storeItemModel.isLike) {
//        [self.likeButton setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
//    } else {
//        [self.likeButton setImage:[UIImage imageNamed:@"unlike"] forState:UIControlStateNormal];
//    }
//    NSData *pictureData = [NSData dataWithContentsOfURL:storeItemModel.pictureURL];
//    if (pictureData == nil) {
//        self.pictureImageView.image = [UIImage imageNamed:@"food3"];
//    } else {
//        self.pictureImageView.image = [UIImage imageWithData:pictureData];
//    }
//}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (UIImageView *)pictureImageView {
    if (_pictureImageView == nil) {
        _pictureImageView = [[UIImageView alloc] init];
        _pictureImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _pictureImageView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UILabel *)locationLabel {
    if (_locationLabel == nil) {
        _locationLabel = [[UILabel alloc] init];
        _locationLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _locationLabel;
}

- (UILabel *)informationLabel {
    if (_informationLabel == nil) {
        _informationLabel = [[UILabel alloc] init];
        _informationLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _informationLabel;
}

- (UIButton *)likeButton {
    if (_likeButton == nil) {
        _likeButton = [[UIButton alloc] init];
        _likeButton.imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _likeButton;
}

- (UIBarButtonItem *)jumpButton {
    if (_jumpButton == nil) {
        _jumpButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"purchase"] style:UIBarButtonItemStylePlain target:self action:@selector(jumpButtonDidClick:)];
    }
    return _jumpButton;
}

@end
