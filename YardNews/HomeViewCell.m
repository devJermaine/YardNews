//
//  HomeViewCell.m
//  YardNews
//
//  Created by user on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewCell.h"


@implementation HomeViewCell

@synthesize listItem;

+(HomeViewCell*)cellWithItems:(FeedList*)myListItem
{
    HomeViewCell *result = [[HomeViewCell alloc] initWithStyle:1 reuseIdentifier:@"homeView"];
    result.listItem = myListItem;
    
    return result;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 250, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    titleLabel.highlightedTextColor = [UIColor whiteColor];
    [self.contentView addSubview:titleLabel];
    
    descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 210, 60)];
    descriptionLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    descriptionLabel.backgroundColor = [UIColor clearColor];    
    descriptionLabel.textAlignment = UITextAlignmentLeft;
    descriptionLabel.numberOfLines = 4;
    [self.contentView addSubview:descriptionLabel];
    
    return self;
}

-(void)setListItem:(FeedList *)_listItem
{
    listItem = _listItem;
    
    titleLabel.text = listItem.name;
    descriptionLabel.text = listItem.description;
    
    iconImage = [[[UIImageView alloc] initWithImage:listItem.image] autorelease];
    [self.contentView addSubview:iconImage];
    iconImage.center = CGPointMake(30, 40);
    
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}
@end
