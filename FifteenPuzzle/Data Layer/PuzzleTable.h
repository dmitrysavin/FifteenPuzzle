//
//  PuzzleTable.h
//  FifteenPuzzle
//
//  Created by Dmitry Savin on 4/9/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

@import Foundation;

@class PuzzleRow;

/** Represents puzzle table, which controls @c PuzzleRow objects.
    Each row has own index path, where section is position by horisontal line on table
    and row - vertical position on table.
 */
@interface PuzzleTable : NSObject

/** Size of puzzle table. Represents same value for height and width. */
@property (nonatomic, readonly) NSInteger size;

/** Index path of empty row in table. */
@property (nonatomic, readonly) NSIndexPath *emptyIndexPath;

/** Returns boolean value, that identify whether puzzle row can be moved at passed index path.
    @param indexPath Index path of puzzle row.
    @return Whether puzzle row can be moved.
 */
- (BOOL)canMovePuzzleRowAtIndexPath: (NSIndexPath *)indexPath;

/** Move puzzle row in passed index path to empty place in table. 
    @param indexPath Index path of puzzle row.
    @return @c NSIndexPath object of place where puzzle row was moved.
 */
- (NSIndexPath *)movePuzzleRowAtIndexPath: (NSIndexPath *)indexPath;

/** Returns @c PuzzleRow object by passed index path.
    @param indexPath Index path of requested @c PuzzleRow object.
    @return Retrieved @c PuzzleRow object by passed index path.
 */
- (PuzzleRow *)puzzleRowAtIndexPath: (NSIndexPath *)indexPath;

@end
