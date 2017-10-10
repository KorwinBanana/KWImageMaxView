# UICollectionView滚动视图
##使用UICollectionView
**步骤：**
* 创建布局layout（可自定义）
* 创建collectionView（注意：必须有布局参数cell必须注册cell必须自定义，系统cell没有任何子控件）
* 遵守UICollectionViewDataSource协议

##自定义UICollectionViewFlowLayout
通过自定义UICollectionViewFlowLayout实现滚动
UICollectionViewFlowLayout重写，主要有5个方法：

```
//五个方法用法说明
调用时机：collectionView第一次布局，collectionView刷新的时候也会调用
作用：计算cell的布局
- (void)prepareLayout;
 
确认cell的尺寸
UICollectionViewLayoutAttributes对象就对应一个cell
拿到UICollectionViewLayoutAttributes相当于拿到cell
作用：返回很多cell的尺寸（指定一个区域给你这个短区域的cell）(可以一次性返回所有cell，也可以每隔一个距离返回一个cell，取决于rect)
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;

在滚动的时候是否允许刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;

调用时机：用户手指一松手的时候就会调用
作用：确认最终的偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity;
 
- (CGSize)collectionViewContentSize;
```


