//
//  CollectionViewController.m
//  CollectionViewProject
//
//  Created by Carlos Roig Salvador on 13/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "CollectionViewController.h"
#import "GotModel.h"
#import "Casa.h"
#import "Personaje.h"
#import "UIColor+RandomColor.h"
#import "GOTChatacterTableViewCell.h"

static UIEdgeInsets kCollectionInsets              = {0.0, 0.0 , 0.0 ,0.0};
static UIEdgeInsets kFlowLayoutInsets              = {10.0, 10.0, 30.0, 10.0};

static NSString *CollectionViewCellIdentifier      = @"CollectionViewCellIdentifier";

@interface CollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic)GotModel *model;

@end

@implementation CollectionViewController


#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCollectionView];
    [self.view addSubview:self.collectionView];
    
    self.model = [[GotModel alloc] init];
    [self.model cargaModelo];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}


#pragma mark - Setup UI Elements

- (void)setUpCollectionView {
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(120,140);
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.flowLayout.minimumInteritemSpacing = 2.0f;
    self.flowLayout.sectionInset = kFlowLayoutInsets;
    
    CGRect collectionFrame = UIEdgeInsetsInsetRect(self.view.bounds, kCollectionInsets);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:collectionFrame collectionViewLayout:self.flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    [self.collectionView registerClass:[GOTChatacterTableViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - Data Source Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.model.casas count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    Casa *casa = self.model.casas[section];
    return [casa.personajes count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GOTChatacterTableViewCell * cell = (GOTChatacterTableViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    
    Casa *casa = self.model.casas[indexPath.section];
    Personaje *personaje = casa.personajes[indexPath.row];
    
    [cell configViewWithPersonaje:personaje];
    cell.backgroundColor = [UIColor randomColorForCellBackground];
    
    return cell;
    
}





@end
