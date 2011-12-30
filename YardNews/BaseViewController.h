//
//  BaseViewController.h
//  YardNews
//
//  Created by user on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GADBannerView.h"
#import "CJSONDeserializer.h"
#import "CJSONScanner.h"
#import "WebServiceAPI.h"

@interface BaseViewController : UIViewController {
    GADBannerView *bannerView;
    WebServiceAPI *webApi;
    NSString *strURL;
}

@property (nonatomic, retain) NSString *strURL;
@property (nonatomic, assign) WebServiceAPI *webApi;

- (void)viewDidLoadWithoutAd;
- (void)adMobDisplay;

- (UILabel *)buildLabel:(NSString *)text color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame font:(UIFont *)font textAlignment:(UITextAlignment)textAlignment;
- (UIButton *)buildButton:(NSString *)text color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame font:(UIFont *)font align:(UIControlContentHorizontalAlignment)align target:(id)target selector:(SEL)selector;
- (UITextField *)buildTextField:(NSString *)text color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame;
- (UIColor *) colorForHex:(NSString *)hexColor;
- (UIAlertView *)buildAlert:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles delegate:(id)delegate;

@end
