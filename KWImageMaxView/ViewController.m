//
//  ViewController.m
//  KWImageMaxView
//
//  Created by korwin on 2017/10/10.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "ViewController.h"
#import "KWImageViewCell.h"
#import "KWFlowLayout.h"

static NSString * const ID = @"cell";

@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelArray = [[NSArray alloc]initWithObjects:@"!",@"Hello",@"World",@"!",@"Hello",nil];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //注意：
    //1.创建collectionView必须有布局参数
    //2.cell必须注册
    //3.cell必须自定义，系统cell没有任何子控件
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建流水布局
    KWFlowLayout *layout = [[KWFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(160, 160);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//方向水平
    CGFloat marin = ([UIScreen mainScreen].bounds.size.width - 160) * 0.5;
    layout.sectionInset = UIEdgeInsetsMake(0, marin, 0, marin);//设置内边距
    layout.minimumLineSpacing = 50;
    
    
    //创建UICollectionView
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/3, self.view.frame.size.width, self.view.frame.size.height / 3) collectionViewLayout:layout];
    collection.backgroundColor = [UIColor blackColor];
    collection.showsVerticalScrollIndicator = NO;//滚动条不可见
    
    //设置数据源
    collection.dataSource = self;
    
    //注册cell
    [collection registerNib:[UINib nibWithNibName:NSStringFromClass([KWImageViewCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
//    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    [self.view addSubview:collection];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KWImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.label.text = _labelArray[indexPath.row];
    NSLog(@"%@",_labelArray[indexPath.row]);
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
