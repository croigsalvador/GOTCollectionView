//
//  GOTChatacterTableViewCell.h
//  CollectionViewProject
//
//  Created by Carlos Roig Salvador on 13/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Personaje;

@interface GOTChatacterTableViewCell : UICollectionViewCell

- (void)configViewWithPersonaje:(Personaje *)person;

@end
