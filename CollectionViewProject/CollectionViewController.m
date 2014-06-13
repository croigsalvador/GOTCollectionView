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
#import "GOTChatacterTableViewCell.h"
#import "GOTHeaderCollectionView.h"

static UIEdgeInsets kCollectionInsets              = {0.0, 0.0 , 0.0 ,0.0};
static UIEdgeInsets kFlowLayoutInsets              = {30.0, 40.0, 50.0, 40.0};

static NSString *CollectionViewCellIdentifier      = @"CollectionViewCellIdentifier";
static NSString *CollectionViewHeaderIdentifier    = @"CollectionViewHeaderIdentifier";


@interface CollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic)UICollectionViewFlowLayout *flowLayout2;

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
    self.collectionView.frame = self.view.bounds;
}


#pragma mark - Setup UI Elements

- (void)setUpCollectionView {
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(200,240);
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumInteritemSpacing = 5.0f;
    self.flowLayout.minimumLineSpacing = 5.0f;
    self.flowLayout.sectionInset = kFlowLayoutInsets;
    self.flowLayout.headerReferenceSize = CGSizeMake(100, 100);
    
    self.flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout2.itemSize = CGSizeMake(200,240);
    self.flowLayout2.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout2.minimumInteritemSpacing = 5.0f;
    self.flowLayout2.minimumLineSpacing = 5.0f;
    self.flowLayout2.sectionInset = kFlowLayoutInsets;
    self.flowLayout2.headerReferenceSize = CGSizeMake(100, 100);
    
    CGRect collectionFrame = UIEdgeInsetsInsetRect(self.view.bounds, kCollectionInsets);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:collectionFrame collectionViewLayout:self.flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    [self.collectionView registerClass:[GOTChatacterTableViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    
    [self.collectionView registerClass:[GOTHeaderCollectionView  class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewHeaderIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Horizontal",@"Vertical"]];
    
    segmentedControl.frame = CGRectMake(0, 0, 200, 30);
    
    [segmentedControl addTarget:self action:@selector(changeSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentedControl;
    
}

#pragma mark - Action Methods

- (void)changeSegmentedControl:(UISegmentedControl *)segmented {
    if (segmented.selectedSegmentIndex == 0) {
        self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        [self.collectionView setCollectionViewLayout:self.flowLayout animated:YES];
    } else {
        self.flowLayout2.scrollDirection = UICollectionViewScrollDirectionVertical;
        [self.collectionView setCollectionViewLayout:self.flowLayout2 animated:YES];

    }
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
    
    return cell;
    
}

#pragma mark - UICollectionViewFlowLayout Methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(200, 240);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *resusableView ;
    
    if (kind == UICollectionElementKindSectionHeader) {
        GOTHeaderCollectionView *gotHeaderView = (GOTHeaderCollectionView *)[self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewHeaderIdentifier forIndexPath:indexPath];
        
        Casa *casa = self.model.casas[indexPath.section];

        
        [gotHeaderView configViewWithPersonaje:casa];
        gotHeaderView.backgroundColor = [UIColor redColor];
        resusableView = gotHeaderView;
    }
    return resusableView;
}




@end
