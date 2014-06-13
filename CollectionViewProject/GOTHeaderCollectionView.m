//
//  GOTHeaderCollectionView.m
//  CollectionViewProject
//
//  Created by Carlos Roig Salvador on 13/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "GOTHeaderCollectionView.h"
#import "Casa.h"
#import "UIColor+RandomColor.h"

@interface GOTHeaderCollectionView ()

@property (strong, nonatomic)UIImageView *familyFlag;
@property (strong, nonatomic)UIImageView *familyFlag2;

@property (strong, nonatomic)UILabel *familyName;

@end

@implementation GOTHeaderCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUIElements];
        self.backgroundColor = [UIColor randomColorForCellBackground];
    }
    return self;
}


- (void)setUpUIElements {
    
    
    CGFloat borderWidth = 2.5f;
    self.frame = CGRectInset(self.frame, -borderWidth, -borderWidth);
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = borderWidth;
    
    self.layer.cornerRadius = 1;
    self.layer.masksToBounds = YES;
    
    self.layer.shadowOffset = CGSizeMake(-4 , 4);
    self.layer.shadowRadius = 3;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    
    
    self.familyFlag = [[UIImageView alloc] initWithFrame:CGRectMake(30, 15 , 70, 70)];
    self.familyFlag.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.familyFlag];
    
    CGRect labelFrame = self.familyFlag.frame;
    labelFrame.origin.x = CGRectGetMidX(self.familyFlag.frame) + 20;
    labelFrame.origin.y = 10;
    
    CGFloat widthLabel = self.frame.size.width - 240;
    labelFrame.size.width = widthLabel;
    
    self.familyName = [[UILabel alloc] initWithFrame:labelFrame];
    self.familyName.textColor = [UIColor blackColor];
    self.familyName.font =  [UIFont systemFontOfSize:28];
    self.familyName.backgroundColor = [UIColor clearColor];
    self.familyName.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.familyName];
    
    CGRect imageFrame = self.familyFlag.frame;
    labelFrame.origin.x = CGRectGetMaxX(self.familyName.frame) + 20;
    
    self.familyFlag2 = [[UIImageView alloc] initWithFrame:imageFrame];
    self.familyFlag2.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.familyFlag2];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.familyName.frame = self.bounds;
    
    if (self.bounds.size.width < self.bounds.size.height) {
        self.familyName.transform = CGAffineTransformMakeRotation(-M_PI/2.0);
    } else {
        self.familyName.transform = CGAffineTransformIdentity;
    }
}

#pragma mark - Public Methods

- (void)configViewWithPersonaje:(Casa *)casa {
    self.familyName.text = casa.nombre;
    self.familyFlag.image = [UIImage imageNamed:casa.imagen];
    self.familyFlag2.image =  [UIImage imageNamed:casa.imagen];
}





@end
