//
//  NewsFeedViewCell.m
//  YardNews
//
//  Created by user on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewsFeedViewCell.h"


@implementation NewsFeedViewCell

@synthesize newsItem;

+(NewsFeedViewCell *)cellWithItems:(NewsFeedItem *)myNewsItem;
{
    NewsFeedViewCell *result = [[NewsFeedViewCell alloc] initWithStyle:1 reuseIdentifier:@"newsFeedView"];
    result.newsItem = myNewsItem;
    
    return result;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIImage *image = [UIImage imageNamed:@"NewsPaperBG.png"];
    //CGPoint imagepoint = CGPointMake(272,0);
    //[image drawAtPoint:imagepoint];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    [self.contentView addSubview:imageview];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 290, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    titleLabel.highlightedTextColor = [UIColor whiteColor];
    [self.contentView addSubview:titleLabel];
    
    descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 290, 60)];
    descriptionLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    descriptionLabel.backgroundColor = [UIColor clearColor];    
    descriptionLabel.textAlignment = UITextAlignmentLeft;
    descriptionLabel.numberOfLines = 4;
    [self.contentView addSubview:descriptionLabel];
    
    return self;
}

-(void)setNewsItem:(NewsFeedItem *)_newsItem
{
    newsItem = _newsItem;
    
    titleLabel.text = newsItem.title;
    descriptionLabel.text = newsItem.description;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
