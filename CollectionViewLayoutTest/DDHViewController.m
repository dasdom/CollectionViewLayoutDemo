//
//  DDHViewController.m
//  CollectionViewDemo
//
//  Created by dasdom on 29.12.13.
//  Copyright (c) 2013 dasdom. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Dominik Hauser
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "DDHViewController.h"
#import "DDHCollectionViewDelegateAndDataSource.h"
#import "DDHRecipeCollectionViewFlowLayout.h"

@interface DDHViewController ()
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) DDHCollectionViewDelegateAndDataSource *delegateAndDataSource;
@end

@implementation DDHViewController

- (void)loadView {
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    DDHRecipeCollectionViewFlowLayout *layout = [[DDHRecipeCollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(320.0f, 44.0f);
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [contentView addSubview:_collectionView];

    _delegateAndDataSource = [[DDHCollectionViewDelegateAndDataSource alloc] init];
    _collectionView.delegate = _delegateAndDataSource;
    _collectionView.dataSource = _delegateAndDataSource;

    [_delegateAndDataSource registerCellsForCollectionView:_collectionView];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_collectionView);
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_collectionView]|" options:0 metrics:nil views:viewsDictionary]];
    [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:nil views:viewsDictionary]];
    
    self.view = contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
