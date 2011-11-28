//
//  CustomMPMV.h
//  MPMoviePlayerTest
//
//  Created by Kevin Hampton on 11/16/11.
//  Copyright (c) 2011 Ga Tech. All rights reserved.
//

#ifndef MPLAYERVIEWHEADER_H
#define MPLAYERVIEWHEADER_H
#import <UIKit/UIKit.h>
#include <MediaPlayer/MediaPlayer.h>

@class TimeLineView;

@interface MPlayerView : UIView {
  MPMoviePlayerViewController* player;
  double duration;
  double interval;
  NSArray* thumbnails;
  
  IBOutlet TimeLineView* timeLine;
  IBOutlet UIImageView* imageView;
}

@property (nonatomic, retain) TimeLineView* timeLine;
@property (nonatomic, retain) UIImageView* imageView;

-(IBAction)loadVideo:(id)sender;
-(void)setPlayer:(NSURL*)url;
-(void) loaded:(NSNotification*)aNotification ;
-(NSArray*) getThumbnails;
-(void) showFrame:(double)time;
@end
#endif