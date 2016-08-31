//
//  ViewController.m
//  OpenCV_TestFix_MatToUIImage
//
//  Created by Valeriy Van on 31.08.16.
//  Copyright © 2016 Valeriy Van. All rights reserved.
//

#import "OpenCV2/OpenCV.hpp"
#import "ViewController.h"

using namespace cv;

UIImage* MatToUIImage(const cv::Mat& image); // Function of interest seems not to be exposed to OpenCV externals

@interface ViewController()

@property BOOL bypass;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initializing CvVideoCamera without parent view.
    // We intend manually set images in processImage: delegate method.
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:nil];
    
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
}

- (void)dealloc {
    self.videoCamera.delegate = nil; // Soon be fixed bug on OpenCV https://github.com/opencv/opencv/pull/7178
}

- (void)processImage:(Mat&)mat {
    // Transform Mat to UIImage
    UIImage *image = MatToUIImage(mat);
    
    // Set all values in mat to 127 if self.bypass is not set.
    // All colors of 127 give us gray color and 127 for alpha gives us 0.5 transparancy.
    if (!self.bypass) {
        mat.setTo(127);
    }
    
    // Switch to main thread and set image to be shown.
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = image;
    });
}

- (IBAction)actionStart:(id)sender {
    if (!self.videoCamera.running) {
        [self.videoCamera start];
    }
    self.bypass = NO;
}

- (IBAction)actionBypass:(id)sender {
    if (!self.videoCamera.running) {
        [self.videoCamera start];
    }
    self.bypass = YES;
}

- (IBAction)actionStop:(id)sender {
    [self.videoCamera stop];
    self.imageView.image = nil;
}

@end
