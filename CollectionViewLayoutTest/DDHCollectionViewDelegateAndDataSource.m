//
//  DDHCollectionViewDelegateAndDataSource.m
//  CollectionViewDemo
//
//  Created by dasdom on 29.12.13.
//  Copyright (c) 2013 dasdom. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Dominik Hauser
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import "DDHCollectionViewDelegateAndDataSource.h"
#import "DDHCollectionViewCell.h"

@implementation DDHCollectionViewDelegateAndDataSource

#pragma mark - cell registration protocol method
- (void)registerCellsForCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:[DDHCollectionViewCell class] forCellWithReuseIdentifier:DDHCollectionViewCellIdentifier];
}

#pragma mark - collection view data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DDHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DDHCollectionViewCellIdentifier forIndexPath:indexPath];
    
    NSString *cellText = @"Test";
    if (indexPath.section == 1) {
        if (indexPath.item == 0) {
            cellText = @"Die beiden Mehlsorten mit Rohrohrzucker, Salz und Trockenhefe gut vermischen, dann das Kürbispüree sowie die weiche Margarine zufügen. Alles mit dem Knethaken der Küchenmaschine oder Handmixer ca. fünf Minuten auf kleiner Stufe durchkneten bis ein weicher geschmeidiger Teig entstanden ist. Der Teig sollte etwas feucht und keinesfalls zu trocken sein, da das Vollkornmehl noch etwas quillt, daher ggf. einen Schuss Sojamilch oder Wasser zufügen bis die richtige Konsistenz erreicht ist.";
        } else if (indexPath.item == 1) {
            cellText = @"Abgedeckt an einem warmen Ort 1-1 1/2 Stunden gehen lassen bis der Teig deutlich an Volumen gewonnen hat.";
        } else if (indexPath.item == 2) {
            cellText = @"Den Teig mit den Händen kräftig durchkneten, dann in drei möglichst gleichgroße Teile teilen. Jedes Teil zu einem langen Strang rollen und dann einen lockeren Zopf daraus flechten. Den Zopf auf ein mit Backpapier ausgelegtes Backblech legen.";
        }
    }
    cell.nameLabel.text = cellText;
    cell.nameLabel.backgroundColor = [UIColor yellowColor];
    
    return cell;
}

#pragma mark - flow layout delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeZero;
    if (indexPath.section == 0) {
        if (indexPath.item == 0) {
            size = CGSizeMake(400.0f, 400.0f);
        } else if (indexPath.item == 1) {
            size = CGSizeMake(623.0f, 400.0f);
        } else {
            size = CGSizeMake(400.0f, 600.0f);
        }
    } else {
        size = CGSizeMake(623.0f, 200.0f);
    }
    return size;
}

@end
