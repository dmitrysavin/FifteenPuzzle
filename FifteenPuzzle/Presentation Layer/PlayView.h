//
//  PlayView.h
//  Fifteen
//
//  Created by Dmitry Savin on 4/5/15.
//  Copyright (c) 2015 Dmitry Savin. All rights reserved.
//

#import <UIKit/UIKit.h>

/** View contains puzzle table. */
@interface PlayView : UIView

/** View contains puzzle cells for playing. */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
