//
//  ViewController.m
//  CollectionViewWithImage
//
//  Created by CYC on 2017/11/13.
//  Copyright © 2017年 w2fzu. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/FLAnimatedImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>

@interface ViewController ()<UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray<NSString *> *objects;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.objects = [NSMutableArray arrayWithObjects:
                    @"http://assets.sbnation.com/assets/2512203/dogflops.gif",
                    @"https://raw.githubusercontent.com/liyong03/YLGIFImage/master/YLGIFImageDemo/YLGIFImageDemo/joy.gif",
                    @"http://www.ioncannon.net/wp-content/uploads/2011/06/test2.webp",
                    @"http://www.ioncannon.net/wp-content/uploads/2011/06/test9.webp",
                    @"http://littlesvr.ca/apng/images/SteamEngine.webp",
                    @"http://littlesvr.ca/apng/images/world-cup-2014-42.webp",
                    @"https://isparta.github.io/compare-webp/image/gif_webp/webp/2.webp",
                    @"https://nr-platform.s3.amazonaws.com/uploads/platform/published_extension/branding_icon/275/AmazonS3.png",
                    @"http://via.placeholder.com/200x200.jpg",
                    nil];
    
    for (int i=0; i<100; i++) {
        [self.objects addObject:[NSString stringWithFormat:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage%03d.jpg", i]];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.objects count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    FLAnimatedImageView *imageView = [cell viewWithTag:1];
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.objects[indexPath.item]]];
    return cell;
}
- (IBAction)actionReload:(id)sender {
    [self.collectionView reloadData];
}


@end
