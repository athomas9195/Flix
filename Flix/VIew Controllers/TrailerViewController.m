//
//  TrailerViewController.m
//  Flix
//
//  Created by Anna Thomas on 6/25/21.
//

#import "TrailerViewController.h"
#import <WebKit/WebKit.h>

@interface TrailerViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *trailerWebView;
@property (nonatomic, strong) NSArray *movies;

@end

@implementation TrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self fetchVideo];
    

}

-(void) fetchVideo {
    
    NSString *baseurl = @"https://api.themoviedb.org/3/movie/";
    NSString *lastURL = @"/videos?api_key=7b320e3294a59f8b7d1401a30f20f85c&language=en-US";
    NSString *movieID = _urlID;
    
    NSString *halfURL = [baseurl stringByAppendingString:movieID];
    NSString *fullURL = [halfURL stringByAppendingString:lastURL];
        
    NSURL *url = [NSURL URLWithString:fullURL];
                  
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
   
    //
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                      
            
        self.movies = dataDictionary[@"results"];
        


    
                                  
                                  NSDictionary *movie = dataDictionary[self->_urlID];
                                  NSDictionary *movieResults = movie[@"results"];
                                  NSString *key = movieResults[@"key"];
   
                                  
                                  NSString *baseURLString = @"https://www.youtube.com/watch?v=";
                                  NSString *fullLenURL= [baseURLString stringByAppendingString:key];
                                  

                                  // Convert the url String to a NSURL object.
                                  NSURL *trailerurl = [NSURL URLWithString:fullLenURL];

                                  // Place the URL in a URL Request.
                                  NSURLRequest *requestLast = [NSURLRequest requestWithURL:trailerurl cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
                                  // Load Request into WebView.
                                  [self.trailerWebView loadRequest:request];
    }];
    
} 




@end
                                  
                                  
                                  
        
