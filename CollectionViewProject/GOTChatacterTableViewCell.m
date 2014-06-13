//
//  GOTChatacterTableViewCell.m
//  CollectionViewProject
//
//  Created by Carlos Roig Salvador on 13/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "GOTChatacterTableViewCell.h"
#import "Personaje.h"

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
    }
    return self;
}


- (void)setUpUIElements {
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    [self.contentView addSubview:self.picImageView];
    
    CGRect labelFrame = self.picImageView.frame;
    labelFrame.origin.y = CGRectGetMaxY(self.picImageView.frame);
    labelFrame.size.height = self.frame.size.height - self.picImageView.frame.size.height;
    
    self.nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font =  [UIFont systemFontOfSize:14];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.nameLabel];
}

#pragma mark - Public Methods 

- (void)configViewWithPersonaje:(Personaje *)person {
    self.nameLabel.text = person.nombre;
    self.picImageView.image = [UIImage imageNamed:person.imagen];
}

@end
