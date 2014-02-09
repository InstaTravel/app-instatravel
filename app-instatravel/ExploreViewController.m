//
//  ExploreViewController.m
//  app-instatravel
//
//  Created by Vikram Jiandani on 2/8/14.
//  Copyright (c) 2014 Vikram Jiandani. All rights reserved.
//

#import "ExploreViewController.h"

@interface ExploreViewController ()

@end

@implementation ExploreViewController {
    NSMutableArray *geoSites;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.collectionView registerNib:[UINib nibWithNibName:@"GeoSiteCell" bundle:nil] forCellWithReuseIdentifier:@"GeoSiteCell"];
        geoSites = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [ApiCalls getImagesByLocation:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [geoSites count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"GeoSiteCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - APICallsDelegate

- (void)handleResponseData:(id)JSON requestType:(NSString *)requestType
{
    
}

- (void)handleFailedResponse:(id)JSON requestType:(NSString *)requestType
{
    
}

@end
