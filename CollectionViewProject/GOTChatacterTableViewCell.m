//
//  GOTChatacterTableViewCell.m
//  CollectionViewProject
//
//  Created by Carlos Roig Salvador on 13/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "GOTChatacterTableViewCell.h"
#import "Personaje.h"
#import "UIColor+RandomColor.h"


@interface GOTChatacterTableViewCell ()

@property (strong, nonatomic) UIImageView *picImageView;
@property (strong, nonatomic)UILabel *nameLabel;

@end

@implementation GOTChatacterTableViewCell

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
    
    
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.picImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.picImageView];
    
    CGRect labelFrame = self.picImageView.frame;
    labelFrame.origin.y = CGRectGetMaxY(self.picImageView.frame) + 5;
    labelFrame.origin.x = 10.0f;
    labelFrame.size.height = self.frame.size.height - self.picImageView.frame.size.height;
    
    self.nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font =  [UIFont systemFontOfSize:20];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.nameLabel];
}

#pragma mark - Public Methods 

- (void)configViewWithPersonaje:(Personaje *)person {
    self.nameLabel.text = person.nombre;
    self.picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",person.imagen]];
}

@end
