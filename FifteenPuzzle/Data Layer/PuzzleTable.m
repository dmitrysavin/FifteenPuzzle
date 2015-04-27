//
//  PuzzleTable.m
//  FifteenPuzzle
//
//  Created by Dmitry Savin on 4/9/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

@import UIKit;
#import "PuzzleTable.h"
#import "PuzzleRow.h"

static const NSInteger PuzzleTableSize = 4;

@interface PuzzleTable ()

@property (nonatomic, strong) PuzzleRow *emptyPuzzleRow;

@property (nonatomic, strong) NSMutableArray *rows;

@end


@implementation PuzzleTable

#pragma mark - Life cycle -

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    _rows = [self configurePuzzleRows];
    _size = PuzzleTableSize;
    
    return self;
}


#pragma mark - Interface -

- (NSIndexPath *)emptyIndexPath
{
    return [self indexPathForPuzzleRow: self.emptyPuzzleRow];
}

- (void)setEmptyIndexPath:(NSIndexPath *)emptyIndexPath
{
    NSInteger fromIndex = [self indexFromIndexPath: self.emptyIndexPath];
    NSInteger toIndex = [self indexFromIndexPath: emptyIndexPath];
    
    [self.rows exchangeObjectAtIndex: fromIndex withObjectAtIndex: toIndex];
}

- (BOOL)canMovePuzzleRowAtIndexPath: (NSIndexPath *)indexPath
{
    NSMutableArray *indexPathes = [NSMutableArray array];
    
    NSIndexPath *emptyIndexPath = self.emptyIndexPath;
    
    if (emptyIndexPath.row > 0) {
        NSIndexPath *topIndexPath = [NSIndexPath indexPathForRow: self.emptyIndexPath.row - 1
                                                       inSection: self.emptyIndexPath.section];
        [indexPathes addObject: topIndexPath];
    }
    
    if (emptyIndexPath.section > 0) {
        NSIndexPath *leftIndexPath = [NSIndexPath indexPathForRow: self.emptyIndexPath.row
                                                        inSection: self.emptyIndexPath.section - 1];
        [indexPathes addObject: leftIndexPath];
    }

    if (emptyIndexPath.row < PuzzleTableSize - 1) {
        NSIndexPath *bottomIndexPath = [NSIndexPath indexPathForRow: self.emptyIndexPath.row + 1
                                                          inSection: self.emptyIndexPath.section];
        [indexPathes addObject: bottomIndexPath];
    }
    
    if (emptyIndexPath.section < PuzzleTableSize - 1) {
        NSIndexPath *rightIndexPath = [NSIndexPath indexPathForRow: self.emptyIndexPath.row
                                                          inSection: self.emptyIndexPath.section + 1];
        [indexPathes addObject: rightIndexPath];
    }
    
    for (NSIndexPath *nearEmptyIndexPath in indexPathes) {
        if ([indexPath isEqual: nearEmptyIndexPath]) {
            return YES;
        }
    }
    
    return NO;
}

- (PuzzleRow *)puzzleRowAtIndexPath: (NSIndexPath *)indexPath
{
    NSInteger index = [self indexFromIndexPath: indexPath];
    return [self.rows objectAtIndex: index];
}

- (NSIndexPath *)movePuzzleRowAtIndexPath: (NSIndexPath *)indexPath
{
    NSIndexPath *toIndexPath = self.emptyIndexPath;
    
    [self movePuzzleRowFromIndexPath: indexPath toIndexPath: toIndexPath];
    
    return toIndexPath;
}


#pragma mark - Helpers -

- (NSInteger)indexFromIndexPath: (NSIndexPath *)indexPath
{
    NSInteger row = indexPath.section * PuzzleTableSize;
    NSInteger column = indexPath.row;
    
    return row + column;
}

- (NSIndexPath *)indexPathForPuzzleRow: (PuzzleRow *)puzzleRow
{
    NSInteger index = [self.rows indexOfObject: puzzleRow];
    
    NSInteger section = index / PuzzleTableSize;
    NSInteger row = index % PuzzleTableSize;

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: row inSection: section];
    
    return indexPath;
}

- (void)movePuzzleRowFromIndexPath: (NSIndexPath *)fromIndexPath toIndexPath: (NSIndexPath *)toIndexPath
{
    NSInteger fromIndex = [self indexFromIndexPath: fromIndexPath];
    NSInteger toIndex = [self indexFromIndexPath: toIndexPath];
    
    [self.rows exchangeObjectAtIndex: fromIndex withObjectAtIndex: toIndex];
}

- (NSMutableArray *)configurePuzzleRows
{
    NSInteger puzzleLength = (PuzzleTableSize * PuzzleTableSize);
    
    NSMutableArray *rows = [NSMutableArray array];
    
    for (NSInteger index = 0; index < puzzleLength; index++) {
        PuzzleRow *puzzleRow = [PuzzleRow new];
        
        if (index == puzzleLength - 1) {
            puzzleRow.value = NSNotFound;
            self.emptyPuzzleRow = puzzleRow;
        } else {
            puzzleRow.value = index;
        }
        
        [rows addObject: puzzleRow];
    }
    
    return rows;
}

@end
