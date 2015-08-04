//
//  LZXHttpConnection.h
//  SNSDemo
//
//  Created by LZXuan on 14-5-23.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import <Foundation/Foundation.h>
//因为我们 需要 不断的更新下载数据（比如说翻页的时候需要重新建立连接 发送请求 接收数据 所以这个时候我们可以专门封装一个下载类 专门下载网络数据）
//但是这个类下载完数据之后 不知如何处理 所以  可以委托 代理来进行处理
//这个类可以制定一个协议 规范代理的行为
@class LZXHttpRequest;
@protocol LZXHttpRequestDelegate <NSObject>
- (void)downloadDataSucessFormRequest:(LZXHttpRequest *)request;

@end


@interface LZXHttpRequest : NSObject <NSURLConnectionDataDelegate>
{
    //建立连接
    NSURLConnection *_httpConnect;
}
//保存下载的数据
@property(nonatomic,retain) NSMutableData *downloadData;
//设置代理
@property (nonatomic,assign) id<LZXHttpRequestDelegate>delegate;
//根据url 建立连接接收数据
- (void)downloadDataFormUrl:(NSURL *)url;
@end





