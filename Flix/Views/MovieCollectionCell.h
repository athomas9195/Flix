//
//  MovieCollectionCell.h
//  Flix
//
//  Created by Anna Thomas on 6/25/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UIImageView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end

NS_ASSUME_NONNULL_END
