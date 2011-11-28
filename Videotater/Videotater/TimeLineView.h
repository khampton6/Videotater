//
//  TimeLineView.h
//  Annotator
//
//  Created by Kevin Hampton on 10/14/11.
//  Copyright (c) 2011 Ga Tech. All rights reserved.
//

#ifndef TIMELINEVIEWHEADER_H
#define TIMELINEVIEWHEADER_H

#import <UIKit/UIKit.h>

@class MPlayerView;

@interface TimeLineView : UIView {
  int interval_width;
  int interval_num;
  BOOL go;

  CGPoint left_point, right_point;
  
  double curr_time;
  double vid_length;
  
  NSTimer* playerTimer;
  double preview_end;
  
  IBOutlet MPlayerView* playbackview;
  
}

@property (nonatomic, retain) MPlayerView* playbackview;

-(void)updateVideo:(CGPoint*)point;
-(void)createGestures;
-(void)createIntervals:(double)time;
-(void)setUp:(double)time;
-(IBAction)handleDrag:(UIGestureRecognizer*)sender;
-(IBAction)playPreview:(id)sender;
@end

#endif