//
//  ViewController.h
//  CollectionViewDemo
//
//  Created by wwwins on 2014/1/15.
//  Copyright (c) 2014年 wwwins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *uicollectionview;

@end
