# 搜索历史本地化，基于FMDB。
## 为什么用[FMDB](https://github.com/ccgus/fmdb)
* fmdb够轻量简单，基于sqlite的关系型数据库更加的轻量和灵活。
* 提供了多线程安全，可以防止数据混乱。
* 需要手写sql语句。

## CoreData，Realm和FMDB
###  CoreData
* 学习成本高，coredata的api相对来言有点笨拙。
* 当上万条的数据进行查询，更新操作时，有明显的性能问题。
* 不支持批量操作。

### Realm
说来惭愧，真正用到realm的时候是在reactnative的项目中用到的，还没有在iOS的项目中使用过，但是也是基于native的进行映射到reactnative端，以下针对reactnative项目中来说：

* 关联关系弱，数据库包容量大。
* 不是基于sqlite的，而是自己实现了一套数据存储类型。
* 在reactnative端是使用埋点的时候用到了realm，但是在数据量大之后，在ios端和android端出现了编译问题，由于后面换了埋点方式，这个问题也一直没有解决。。

### FMDB
* 基于Sqlite的关系型数据库。
* 简单方便，易使用，容易上手，对多线程是并发操作处理。

以上，该repository是基于fmdb封装了搜索列表，本地数据库存储。


