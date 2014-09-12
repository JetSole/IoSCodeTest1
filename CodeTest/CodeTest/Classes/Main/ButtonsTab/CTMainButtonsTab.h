//
//  CTMainButtonsTab.h
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {

    TAB_SEARCH,
    TAB_CART,
    TAB_JS,
    TAB_LOCK,
    TAB_MAP,
    TABS_COUNT
};

@protocol CTMainButtonsTabDelegate

@optional
- (void)didSelectTabItemAtIndex:(NSInteger)index;

@end

@interface CTButtonTabCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imgView;

@end

@interface CTMainButtonsTab : UIView <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet id<CTMainButtonsTabDelegate> delegate;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

- (void)selectItemAtIndex:(NSInteger)index;

@end
