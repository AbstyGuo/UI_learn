//
//  ViewController.m
//  NSURLConnection_Base
//
//  Created by 夏婷 on 15/12/3.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>//遵循NSURLConnection数据协议
{
    NSURLConnection *_connection;//用于发起连接
    //NSURLConnection是苹果提供的一个连接类，分同步连接和异步连接两种方式，同步连接在主线程中执行，如果加载的数据过大，会造成UI卡死现象，异步，会开辟子线程，去进行数据加载数据，加载完成之后，回调到主线程，刷新UI
    //用NSURLConnection发起连接时，需要一个NSURLRequest作为参数
    // NSURLRequest是苹果提供的一个请求类，可以设置连接超时时间、缓存机制、请求方法、请求体等
    
    //使用NSURLRequest时，必须有一个NSURL对象，NSURL一个目标路径对象，可以是远程的也可以是本地的
    
    NSMutableData *_receiveData;
    //用于接收所要加载的数据
    
    
    UIImageView *_imageView;//用来显示加载的图片
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_imageView];
    
    //同步加载图片数据
//    [self synLoadImageData];
    
    //异步加载图片数据
    [self asynLoadImageData];
    
    
}
#pragma mark -同步加载数据
-(void)synLoadImageData
{
    //目标路径
    NSURL *url = [NSURL URLWithString:@"http://xiating.local/share_iOS/test.png"];
    
    //创建请求对象
    //NSMutableURLRequest可变的请求类，继承NSURLRequest
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //设置请求超时时间
    [request setTimeoutInterval:20];
    //设置缓存机制NSURLRequestReloadIgnoringCacheData忽略所要的缓存数据，每一次都去服务端下载新的数据
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    
    /*
     NSURLRequestUseProtocolCachePolicy 基本缓存机制
     NSURLRequestReloadIgnoringLocalCacheData 忽略本地缓存数据
     NSURLRequestReloadIgnoringLocalAndRemoteCacheData 忽略本地和远程缓存数据
     NSURLRequestReloadIgnoringCacheData 忽略缓存数据（忽略本地缓存数据一致）
     NSURLRequestReturnCacheDataElseLoad  优先使用缓存数据，没有缓存数据再去请求
     NSURLRequestReturnCacheDataDontLoad  总是使用缓存数据，从不下载，如果没有本地缓存，视为请求失败，使用用本地缓存时采用这种机制
     NSURLRequestReloadRevalidatingCacheData 优先使用有效的缓存数据，如果数据有效时直接使用不下载新的，如果无效再去下载新数据
     
     */
    
    //设置请求方法 总共有7种： GET、POST、PUT、DELETE、HEAD、OPTIONS、TRANCE
    [request setHTTPMethod:@"GET"];
    
    //通常POST和PUT时才会把数据放到请求体中传输
    //[request setHTTPBody:data];
    
    
    //同步请求数据
    //请求响应对象
    NSHTTPURLResponse *response = nil;
    //当连接失败时，将捕捉到得错误返回给客户端
    NSError *error = nil;
    
    //sendSynchronousRequest 发起一个同步连接，在主线程中执行
    //第一个参数请求类，携带目标路径、请求体等信息
    //第二参数：用来接收服务端的响应对象
    //带三个参数：连接失败时，接收错误信息
    //返回一个NSData数据，成功时就是我们要请求的数据
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //response.statusCode响应状态码，在HTTP请求中，通常200表示连接成功
    if (response.statusCode == 200) {
        NSLog(@"连接成功");
        //判断是否有数据
        if (data.length >0) {
            _imageView.image = [[UIImage alloc]initWithData:data];
        }
    }else{
        NSLog(@"失败原因：%@",error);
    }
    
    //请求过程
    //1.客户端发起连接请求
    //2.服务端接收到连接请求之后，给客户端返回一个响应，通过响应判断是否成功
    //3.如果连接成功，客户端再次发生数据（要提交给服务端的数据）
    //4.服务器端分多次将数据传输给客户端，直到所有数据传输结束
}

#pragma mark -异步加载
-(void)asynLoadImageData
{
    //创建目标路径
    NSURL *url = [NSURL URLWithString:@"http://xiating.local/share_iOS/test.png"];
    //创建请求对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //设置超时时间
    [request setTimeoutInterval:40];
    //设置请求方法
    [request setHTTPMethod:@"GET"];
    // 设置缓存机制
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    
#if 0
    
    //发起异步连接
    //NSOperationQueue多线程队列，用于管理NSOperation的对象，NSOperation多线程对象，NSOperationQueue管理其中的线程的开辟、执行、结束销毁等操作
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    //带block回调的异步请求方法
    
    //第一个参数：请求类
    //queue:用于管理发起异步请求时开辟的子线程的队列，数据加载过程在子线程中执行，数据加载完会回调到主线程，客户端属性UI
    //第三个参数：是一个blaock ，其中block 的参数，response服务端的响应数据，data是请求成功时返回的数据，connectionError 连接失败时，捕捉到得错误信息
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //连接结束之后，回调到这个代码块中
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        //判断连接是否成功
        if(res.statusCode == 200)
        {
            NSLog(@"连接成功");
            //判断是否有数据
            if (data.length > 0) {
                _imageView.image = [[UIImage alloc]initWithData:data];
            }
        }else
        {
            NSLog(@"连接失败:%@",connectionError);
        }
    }];
    
    //工作中常用异步请求方式，因为加载过程在子线程中执行，不会阻塞主线程，不会打断用户的操作
#else
    
   //异步请求的第二种方式
//    _connection = [[NSURLConnection alloc]initWithRequest:<#(NSURLRequest *)#> delegate:<#(id)#>]

    //第一个参数：请求类的对象
    //第二个参数：代理对象
    //第三个参数：是否马上发起连接请求，YES，马上，NO不发起，需要写 [_connection start];
    
    _connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    
#endif

}
#pragma mark - 关于请求过程的协议方法

//即将发起请求时调用的方法
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response
{
    NSLog(@"即将发起连接");
    return request;
}
//接收到服务端的响应时调用这个方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //判断连接是否成功
    NSHTTPURLResponse * res = (NSHTTPURLResponse *)response;
    if (res.statusCode == 200) {
        
        //成功，初始化_receiveData,准备接收数据
        _receiveData = [[NSMutableData alloc]init];
        NSLog(@"连接成功");
    }
}
//客户端接收到服务端传输的数据时，调用这个方法，传输过程中会多次调用这个方法
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //拼接接收到的数据
    [_receiveData appendData:data];
    NSLog(@"接收到数据");
}
//数据传输完毕时调用这个方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"连接结束");
    _imageView.image = [[UIImage alloc]initWithData:_receiveData];
    
}
//连接失败时调用的方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"连接失败的原因：%@",error);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
