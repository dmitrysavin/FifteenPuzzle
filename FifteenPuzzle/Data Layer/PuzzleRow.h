//
//  PuzzleRow.h
//  FifteenPuzzle
//
//  Created by Dmitry Savin on 4/9/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Represents row in @c PuzzleTable. */
@interface PuzzleRow : NSObject

/** Value of puzzle row. Range from 0 - 14. */
@property (assign, nonatomic) NSInteger value;

/** Value to display in cell. */
@property (readonly, nonatomic) NSString *displayValue;

@end
