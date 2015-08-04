//
//  LZXHttpConnection.m
//  SNSDemo
//
//  Created by LZXuan on 14-5-23.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "LZXHttpRequest.h"

@implementation LZXHttpRequest
- (void)dealloc{
    [_downloadData release];
    [super dealloc];
}
- (id)init{
    if (self = [super init]) {
        _downloadData = [[NSMutableData alloc] init];
    }
    return self;
}
- (void)downloadDataFormUrl:(NSURL *)url{
    if (_httpConnect) {//查看是否有连接
        [_httpConnect release];//取消旧的连接
        _httpConnect = nil;
    }
    //建立新的连接
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _httpConnect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}
//接收响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //将要开始下载
    [self.downloadData setLength:0];//清空旧数据
}
//接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.downloadData appendData:data];
}
//接收完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //接收完之后 需要把这个数据给代理
    if ([self.delegate respondsToSelector:@selector(downloadDataSucessFormRequest:)]) {
        [self.delegate  downloadDataSucessFormRequest:self];
    }else{
        NSLog(@"代理没有实现这个downloadDataSucessFormRequest:方法");
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"网络异常");
}


@end
