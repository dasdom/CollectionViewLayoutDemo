//
//  DDHRecipeCollectionViewFlowLayout.m
//  CollectionViewLayoutTest
//
//  Created by dasdom on 05.01.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHRecipeCollectionViewFlowLayout.h"

@implementation DDHRecipeCollectionViewFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
    CGRect extendedRect = rect;
    extendedRect.size.height += extendedRect.size.height + 400.0f;
    NSArray *layoutAttributes = [super layoutAttributesForElementsInRect:extendedRect];
    
    CGRect visibleRect = (CGRect){self.collectionView.contentOffset, self.collectionView.bounds.size};

    [layoutAttributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attributes, NSUInteger idx, BOOL *stop) {
        if ([[attributes indexPath] section] == 1) {
            CGRect objFrame = [attributes frame];
            objFrame.origin.y = 401.0f + [[attributes indexPath] item]*201.0f;
            objFrame.origin.x = 401.0f;
            [attributes setFrame:objFrame];
            
            CGFloat scaleFactor = 1.0f-fabsf((CGRectGetMidY(visibleRect) - attributes.center.y)/(20.0f*attributes.center.y));
            attributes.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
            attributes.alpha = scaleFactor;
        }
    }];
    return layoutAttributes;
}

@end
