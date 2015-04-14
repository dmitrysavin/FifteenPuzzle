//
//  PuzzleCell.m
//  Fifteen
//
//  Created by Dmitry Savin on 4/6/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

#import "PuzzleCell.h"

@implementation PuzzleCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.layer.cornerRadius = 5.0f;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1.0f;
}

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass( [self class] );
}

+ (NSString *)nibName
{
    return NSStringFromClass( [self class] );
}

+ (UINib *)nib
{
    return [UINib nibWithNibName: [self nibName] bundle: [NSBundle bundleForClass: self]];
}

@end
