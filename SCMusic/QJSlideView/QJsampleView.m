//
//  QJsampleView.m
//  QJSlideView
//
//  Created by Justin on 16/3/12.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "QJsampleView.h"

#define Screen_Width    ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height   ([UIScreen mainScreen].bounds.size.height)

@interface QJsampleView ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *hotArtistsArray;
    NSArray *newAlbumsArray;
    NSArray *onlineMusicArray;
    NSString *choosedAlbumID;
    NSString *choosedArtistUID;
    OMSongInfo *songInfo;
}
/**
 *  mytableView 可以根据自己需求替换成自己的视图.
 */
@property(nonatomic, strong)UITableView *mytableView;

@end

@implementation QJsampleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = title;
        [self confingSubViews];
    }
    return self;
}

- (void)confingSubViews
{
    songInfo = OMSongInfo.sharedManager;
    [self addSubview:self.mytableView];
    [self reloadData];

}


-(UITableView *)mytableView
{
    if (_mytableView != nil) {
        return _mytableView;
    }
    _mytableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - 44) style:UITableViewStylePlain];
    _mytableView.delegate = self;
    _mytableView.dataSource = self;
    _mytableView.showsHorizontalScrollIndicator = NO;
    _mytableView.showsVerticalScrollIndicator = NO;
    _mytableView.layer.cornerRadius = 10;
    _mytableView.backgroundColor = [UIColor whiteColor];
    return _mytableView;
}

#pragma - mark 导入数据
- (void)loadNewSongs
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=1&offset=0&size=100";//前100热门歌曲
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject objectForKey:@"song_list"];
            songInfo.OMSongs = [OMHotSongInfo mj_objectArrayWithKeyValuesArray:array];
            //            [self reloadTableView:_radioAndMusicTableView];
            [_mytableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error--%@",error);
    }];
}

- (void)loadHotSongs
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=2&offset=0&size=100";//前100热门歌曲
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject objectForKey:@"song_list"];
            songInfo.OMSongs = [OMHotSongInfo mj_objectArrayWithKeyValuesArray:array];
            //            [self reloadTableView:_radioAndMusicTableView];
            [_mytableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error--%@",error);
    }];
}

- (void)loadHotArtists
{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.artist.get72HotArtist&format=json&order=1&offset=0&limit=100";//前100热门歌手
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if ([responseObject isKindOfClass:[NSDictionary class]])
//        {
//            NSArray *array = [responseObject objectForKey:@"artist"];
//            hotArtistsArray = [OMArtistInfo objectArrayWithKeyValuesArray:array];
//           [_mytableView reloadData];
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error--%@",error);
//    }];
}

- (void)loadClassicOldSongs
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=22&offset=0&size=100";//前100热门歌曲
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject objectForKey:@"song_list"];
            songInfo.OMSongs = [OMHotSongInfo mj_objectArrayWithKeyValuesArray:array];
            //            [self reloadTableView:_radioAndMusicTableView];
            [_mytableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error--%@",error);
    }];
}

- (void)loadLoveSongs
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=25&offset=0&size=100";//前100热门歌曲
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject objectForKey:@"song_list"];
            songInfo.OMSongs = [OMHotSongInfo mj_objectArrayWithKeyValuesArray:array];
            //            [self reloadTableView:_radioAndMusicTableView];
            [_mytableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error--%@",error);
    }];
}

- (void)loadMovieSongs
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=24&offset=0&size=100";//前100热门歌曲
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject objectForKey:@"song_list"];
            songInfo.OMSongs = [OMHotSongInfo mj_objectArrayWithKeyValuesArray:array];
            //            [self reloadTableView:_radioAndMusicTableView];
            [_mytableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error--%@",error);
    }];
}

- (void)loadEuropeAndTheUnitedStatesSongs
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=21&offset=0&size=100";//前100热门歌曲
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject objectForKey:@"song_list"];
            songInfo.OMSongs = [OMHotSongInfo mj_objectArrayWithKeyValuesArray:array];
            //            [self reloadTableView:_radioAndMusicTableView];
            [_mytableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error--%@",error);
    }];
}



- (void)loadNewAlbums
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.plaza.getRecommendAlbum&format=json&offset=0&limit=100";//前100新专辑
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject valueForKeyPath:@"plaze_album_list.RM.album_list.list"];//多级
            newAlbumsArray = [OMAlbumInfo objectArrayWithKeyValuesArray:array];
           [_mytableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error--%@",error);
    }];
}
- (void)loadArtistSong
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.artist.getSongList&format=json&order=2&tinguid=%@&offset=0&limits=50", choosedArtistUID];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject objectForKey:@"songlist"];
            songInfo.OMSongs = [OMHotSongInfo objectArrayWithKeyValuesArray:array];
            [_mytableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
- (void)loadAlbumSong
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.album.getAlbumInfo&format=json&album_id=%@",choosedAlbumID];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *array = [responseObject objectForKey:@"songlist"];
            songInfo.OMSongs = [OMHotSongInfo objectArrayWithKeyValuesArray:array];
            [_mytableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


#pragma - mark TableView代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.title isEqualToString:@"新歌榜"]) {
        return songInfo.OMSongs.count;
    } else if ([self.title  isEqual: @"热歌榜"]) {
        return songInfo.OMSongs.count;
    } else if ([self.title  isEqual: @"热门歌手"]) {
        return hotArtistsArray.count;
    }else if ([self.title  isEqual: @"经典老歌榜"]) {
        return songInfo.OMSongs.count;
    }else if ([self.title  isEqual: @"网路歌曲榜"]) {
        return songInfo.OMSongs.count;
    }else if ([self.title  isEqual: @"影视金曲榜"]) {
        return songInfo.OMSongs.count;
    }else if ([self.title  isEqual: @"欧美金曲榜"]) {
        return songInfo.OMSongs.count;
    }
    
    return 0;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }

    [self setSongListInfo:cell indexPath:indexPath];

    return cell;
}

-(void)setSongListInfo: (UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
            OMHotSongInfo *info = songInfo.OMSongs[indexPath.row];
            cell.textLabel.text = info.title;
            
            //添加图片
            NSString *path = info.pic_small;
            UIImageView *tempImageView = cell.imageView;
            if (path)
            {
                NSURL *url = [NSURL URLWithString:path];
                
                @try {
                    
                    NSData *imageData = [NSData dataWithContentsOfURL:url];
                    UIImage *albumArt = [UIImage imageWithData:imageData];
                    
                    if (albumArt)
                    {
                        tempImageView.image = albumArt;
                    }
                    else
                    {
                        tempImageView.image = [UIImage imageNamed:@"album_default"];
                    }
                    
                    
                } @catch (NSException *exception) {
                    NSLog(@"下载图片出错！");
                }
                
                
            }
            else
            {
                tempImageView.image = [UIImage imageNamed:@"album_default"];
            }
            
            cell.detailTextLabel.text = info.author;
            
        });
        
    });
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OMHotSongInfo *info = songInfo.OMSongs[indexPath.row];
    NSLog(@"你选择了《%@》这首歌", info.title);
    [songInfo setSongInfo:info];
    [songInfo getSelectedSong:info.song_id index:indexPath.row];
}


/**
 *  刷新数据
 */
- (void)reloadData
{
    if ([self.title  isEqual: @"新歌榜"]) {
        [self loadNewSongs];
    } else if ([self.title  isEqual: @"热歌榜"]) {
        [self loadHotSongs];
    } else if ([self.title  isEqual: @"热门歌手"]) {
        [self loadHotArtists];
    }else if ([self.title  isEqual: @"经典老歌榜"]) {
        [self loadClassicOldSongs];
    }else if ([self.title  isEqual: @"网路歌曲榜"]) {
        [self loadLoveSongs];
    }else if ([self.title  isEqual: @"影视金曲榜"]) {
        [self loadMovieSongs];
    }else if ([self.title  isEqual: @"欧美金曲榜"]) {
        [self loadEuropeAndTheUnitedStatesSongs];
    }
//    [self.mytableView reloadData];
}

@end
