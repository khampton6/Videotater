//
//  ViewController.h
//  Videotater
//
//  Created by Kevin Hampton on 11/27/11.
//  Copyright (c) 2011 Ga Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PreviewView;

@interface ViewController : UIViewController {
  NSMutableArray* videos;
  IBOutlet PreviewView* pView;
}

@property (nonatomic, retain) NSMutableArray* videos;

@end
