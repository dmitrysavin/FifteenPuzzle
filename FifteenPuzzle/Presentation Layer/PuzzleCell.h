//
//  PuzzleCell.h
//  Fifteen
//
//  Created by Dmitry Savin on 4/6/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Represents cell in puzzle. */
@interface PuzzleCell : UICollectionViewCell

/** Label for value of cell. */
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

/** Cell reuse identifier. */
+ (NSString *)reuseIdentifier;

/** The name of nib file where cell is stored. */
+ (NSString *)nibName;

/** @c UINib object of cell. */
+ (UINib *)nib;

@end
