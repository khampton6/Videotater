//
//  CustomMPMV.m
//  MPMoviePlayerTest
//
//  Created by Kevin Hampton on 11/16/11.
//  Copyright (c) 2011 Ga Tech. All rights reserved.
//


#import "MPlayerView.h"
#import "ViewController.h"

static void *MPlayerDemoStatusObservationContext1 = & MPlayerDemoStatusObservationContext1;

@implementation MPlayerView

@synthesize timeLine, imageView;

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
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loaded:) name: MPMoviePlayerLoadStateDidChangeNotification object: [player moviePlayer]];
}

-(void) loaded:(NSNotification*)aNotification {  
  MPMovieLoadState state = [[player moviePlayer] loadState];
  
  if(state & MPMovieLoadStatePlaythroughOK) {
    duration = [[player moviePlayer]duration];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerLoadStateDidChangeNotification object:[player moviePlayer]];

    thumbnails = [self getThumbnails];
    [timeLine setUp:duration];
  }
}

-(NSArray*) getThumbnails {
  NSMutableArray* thumbimages = [[NSMutableArray alloc] init];
  interval = 0.1;
  for(double i = 0; i < duration; i += interval) {
    UIImage* image = [[player moviePlayer] thumbnailImageAtTime:i 
                                timeOption:MPMovieTimeOptionExact];
    [thumbimages addObject:image];
  }
  return thumbimages;
}

-(void) showFrame:(double)time {
  NSLog(@"Gets here!");
  int index = time*10;
  UIImage* selected = [thumbnails objectAtIndex:index];
  [imageView setImage: selected]; 
  [self.imageView setImage:selected];
  NSLog(@"Index: %d Time: %f", index, time);
}

-(IBAction)loadVideo:(id)sender {

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
