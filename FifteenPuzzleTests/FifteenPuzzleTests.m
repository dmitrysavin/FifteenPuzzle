//
//  FifteenPuzzleTests.m
//  FifteenPuzzleTests
//
//  Created by Dmitry Savin on 4/9/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PuzzleTable.h"
#import "PuzzleRow.h"

@interface FifteenPuzzleTests : XCTestCase

@property (strong, nonatomic) PuzzleTable *puzzleTable;

@end


@implementation FifteenPuzzleTests

//          0   1   2   3
//          -------------
//     0 |  0   1   2   3
//     1 |  4   5   6   7
//     2 |  8   9   10  11
//     3 |  12  13  14

// Game Prototype logic
// 1. By selection on game cell -> find move direction
// 2. if direction exists -> move game cell
// 3. else -> nothing

// Test List
// 1. testEmptyPlaceInPuzzle.
// 2. testCanMovePuzzleRow.
// 3. testMovePuzzleRow

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.puzzleTable = [PuzzleTable new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmptyPlaceInPuzzle
{
    NSIndexPath *indexPath_3_3 = [NSIndexPath indexPathForRow: 3 inSection: 3];
    NSIndexPath *indexPath_3_2 = [NSIndexPath indexPathForRow: 3 inSection: 2];
    
    PuzzleTable *puzzleTable = [PuzzleTable new];
    [puzzleTable setEmptyIndexPath: indexPath_3_3];
    
    XCTAssertEqualObjects(puzzleTable.emptyIndexPath, indexPath_3_3, @"Expect empty index path = 3 - 3.");
    
    [puzzleTable setEmptyIndexPath: indexPath_3_2];
    
    XCTAssertEqualObjects(puzzleTable.emptyIndexPath, indexPath_3_2, @"Expect empty index path = 3 - 2.");
}

- (void)testCanMovePuzzleRow
{
    NSIndexPath *indexPath_3_2 = [NSIndexPath indexPathForRow: 3 inSection: 2];
    NSIndexPath *indexPath_3_1 = [NSIndexPath indexPathForRow: 3 inSection: 1];
    
    XCTAssertTrue([self.puzzleTable canMovePuzzleRowAtIndexPath: indexPath_3_2], @"Expected can move puzzle row at index path = 3 - 2.");
    XCTAssertFalse([self.puzzleTable canMovePuzzleRowAtIndexPath: indexPath_3_1], @"Expected can't move puzzle row at index path = 3 - 1.");
}

- (void)testMovePuzzleRow
{
    NSIndexPath *indexPath_3_2 = [NSIndexPath indexPathForRow: 3 inSection: 2];
    
    [self.puzzleTable movePuzzleRowAtIndexPath: indexPath_3_2];
    
    XCTAssertEqualObjects(self.puzzleTable.emptyIndexPath, indexPath_3_2, @"Expected after move empty index path = 3 - 2.");
}

@end
