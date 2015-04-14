//
//  PuzzleRow.m
//  FifteenPuzzle
//
//  Created by Dmitry Savin on 4/9/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

#import "PuzzleRow.h"

@implementation PuzzleRow

- (NSString *)displayValue
{
    return self.value == NSNotFound ? nil : [NSString stringWithFormat: @"%ld", (long)self.value];
}

@end
