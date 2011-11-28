//
//  PreviewView.m
//  Videotater
//
//  Created by Kevin Hampton on 11/27/11.
//  Copyright (c) 2011 Ga Tech. All rights reserved.
//

#import "PreviewView.h"

@implementation PreviewView

@synthesize player;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setPlayer:(NSURL*)url {
  player = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
  [player.view setFrame:self.bounds];
  [self addSubview:player.view];
  [player moviePlayer].controlStyle = MPMovieControlStyleNone;
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

-(void)playbackFinished: (NSNotification*)aNotification {
  NSNumber* reason = [[aNotification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishNotification];
  switch([reason intValue]) {
      case MPMovieFinishReasonPlaybackEnded:
      NSLog(@"Done playing");
      [[self player] moviePlayer].currentPlaybackTime = 0;
      [[[self player] moviePlayer] play];
      break;
  }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
