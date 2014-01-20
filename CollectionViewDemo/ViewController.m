//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by wwwins on 2014/1/15.
//  Copyright (c) 2014年 wwwins. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray *arrSectionData;
@property NSMutableArray *arrDataSource;
@property NSMutableArray *arrDataSource1;
@property NSMutableArray *arrDataSource2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  _arrDataSource1 = [[NSMutableArray alloc] init];
  for (int i=0; i<30; i++) {
    [_arrDataSource1 addObject:[NSString stringWithFormat:@"No.%d", i]];
  }
  
  _arrDataSource2 = [[NSMutableArray alloc] init];
  for (int i=0; i<50; i++) {
    [_arrDataSource2 addObject:[NSString stringWithFormat:@"第 %d 筆",i]];
  }
  
  _arrDataSource = [[NSMutableArray alloc] initWithObjects:_arrDataSource1, _arrDataSource2, nil];
  _arrSectionData = [[NSArray alloc] initWithObjects:@"section-1",@"section-2", nil];
  
  [_uicollectionview setDataSource:self];
  [_uicollectionview setDelegate:self];
}

- (NSInteger)numberOfSectionsInCollectionView:(PSUICollectionView *)collectionView
{
  return [_arrSectionData count];
}

- (NSInteger)collectionView:(PSUICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return [[_arrDataSource objectAtIndex:section] count];
}

- (PSUICollectionViewCell *)collectionView:(PSUICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  PSUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
  
  cell.backgroundColor = [[UIColor alloc] initWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
  
  UIImageView *uiimageview = (UIImageView *)[cell viewWithTag:100];
  [uiimageview setImage:[UIImage imageNamed:@"cats.jpg"]];
  
  UILabel *uilabel = (UILabel *)[cell viewWithTag:101];
  uilabel.text = [[_arrDataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  
  return cell;
}

// set cell size
- (CGSize)collectionView:(PSUICollectionView *)collectionView layout:(PSUICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return CGSizeMake(145,125);
}

// set header size
- (CGSize)collectionView:(PSUICollectionView *)collectionView layout:(PSUICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
  return CGSizeMake(50, 50);
}

// did select
- (void)collectionView:(PSUICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *output = [[_arrDataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  NSLog(@"session:%@ ,value:%@",[_arrSectionData objectAtIndex:indexPath.section],output);
}

// deselect
- (void)collectionView:(PSUICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
