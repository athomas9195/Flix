//
//  DetailsViewController.m
//  Flix
//
//  Created by Anna Thomas on 6/24/21.
//

#import "DetailsViewController.h"
#import "TrailerViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIButton *trailerButton;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    
    if (posterURLString.length != 0) {
        NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
        
        NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
        
        [self.posterView setImageWithURL:posterURL];
        
    }
    
    
    
    
    

    NSString *backdropURLString = self.movie[@"backdrop_path"];
    
    if (backdropURLString.length != 0) {
        NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
        
        NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
        [self.backdropView setImageWithURL:backdropURL];
    }
    
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"overview"];
    
    //adjust text box sizes
    [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit]; 
}


#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// Get the new view controller using [segue destinationViewController].
 //Pass the selected object to the new view controller.
    
    TrailerViewController *trailerViewController = [segue destinationViewController];

    NSString *movieid = self.movie[@"id"];
    trailerViewController.urlID = movieid;
    
}

@end
