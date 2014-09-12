//
//  CTMainButtonsTab.m
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "CTMainButtonsTab.h"

@implementation CTButtonTabCell

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self.imgView setHighlighted:selected];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self.imgView setHighlighted:highlighted];
}

@end

@implementation CTMainButtonsTab

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self.collectionView reloadData];

    [self selectItemAtIndex:TAB_MAP];
}

- (void)selectItemAtIndex:(NSInteger)index
{
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

#pragma mark -
#pragma mark UICollectionViewDataSource, UICollectionViewDelegate methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return TABS_COUNT;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"tab%d", indexPath.row];
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([(id)self.delegate respondsToSelector:@selector(didSelectTabItemAtIndex:)]) {

        [self.delegate didSelectTabItemAtIndex:indexPath.row];
    }
}

@end
