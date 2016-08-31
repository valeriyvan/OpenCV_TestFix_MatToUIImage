//
//  ViewController.h
//  OpenCV_TestFix_MatToUIImage
//
//  Created by Valeriy Van on 31.08.16.
//  Copyright © 2016 Valeriy Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/videoio/cap_ios.h>

@interface ViewController : UIViewController <CvVideoCameraDelegate>

@property (nonatomic, strong) IBOutlet UIImageView* imageView;
@property (nonatomic, strong) CvVideoCamera* videoCamera;

@end

