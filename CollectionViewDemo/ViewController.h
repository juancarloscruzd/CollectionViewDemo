//
//  ViewController.h
//  CollectionViewDemo
//
//  Created by wwwins on 2014/1/15.
//  Copyright (c) 2014年 wwwins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionView.h"

static NSString *cellIdentifier = @"MyReuseCellIdentifier";

@interface ViewController : UIViewController <PSUICollectionViewDataSource, PSUICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet PSUICollectionView *uicollectionview;

@end
