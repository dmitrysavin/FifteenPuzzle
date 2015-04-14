//
//  PlayViewController.m
//  Fifteen
//
//  Created by Dmitry Savin on 4/5/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

#import "PlayViewController.h"
#import "PlayView.h"
#import "PuzzleCell.h"
#import "PuzzleTable.h"
#import "PuzzleRow.h"

@interface PlayViewController () <
    UICollectionViewDataSource,
    UICollectionViewDelegate
>

@property (strong, nonatomic) PlayView *playView;

@property (strong, nonatomic) PuzzleTable *puzzleTable;

@end


@implementation PlayViewController

#pragma mark - Life cycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.puzzleTable = [PuzzleTable new];

    [self.playView.collectionView registerNib: [PuzzleCell nib]
                   forCellWithReuseIdentifier: [PuzzleCell nibName]];

    CGFloat cellWidth = (self.playView.collectionView.bounds.size.width / 4.0f);
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.playView.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(cellWidth, cellWidth);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
}

- (PlayView *)playView
{
    return (PlayView *)self.view;
}


#pragma mark - Delegates -

#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.puzzleTable canMovePuzzleRowAtIndexPath: indexPath]) {
        NSIndexPath *toIndexPath = [self.puzzleTable movePuzzleRowAtIndexPath: indexPath];
        
        [collectionView performBatchUpdates:^{
            [collectionView moveItemAtIndexPath: indexPath toIndexPath: toIndexPath];
            [collectionView moveItemAtIndexPath: toIndexPath toIndexPath: indexPath];
        } completion: nil];
    }
}


#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.puzzleTable.size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.puzzleTable.size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PuzzleRow *puzzleRow = [self.puzzleTable puzzleRowAtIndexPath: indexPath];
    
    PuzzleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: [PuzzleCell reuseIdentifier]
                                                                 forIndexPath: indexPath];
    cell.valueLabel.text = puzzleRow.displayValue;
    
    return cell;
}

@end
