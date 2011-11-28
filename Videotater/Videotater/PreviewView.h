//
//  PreviewView.h
//  Videotater
//
//  Created by Kevin Hampton on 11/27/11.
//  Copyright (c) 2011 Ga Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PreviewView : UIView {
  MPMoviePlayerViewController* player;
}

@property (nonatomic, retain) MPMoviePlayerViewController* player;

-(void)setPlayer:(NSURL*)url;

@end
