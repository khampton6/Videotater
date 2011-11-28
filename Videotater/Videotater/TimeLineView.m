//
//  TimeLineView.m
//  Annotator
//
//  Created by Kevin Hampton on 10/14/11.
//  Copyright (c) 2011 Ga Tech. All rights reserved.
//

#import "TimeLineView.h"
#import "MPlayerView.h"

@implementation TimeLineView

@synthesize playbackview;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      [self createGestures ];
    }
    return self;
}

-(void) setUp:(double)time {
  [playbackview showFrame:0.0];
  NSLog(@"SET UP");
  [self createIntervals:time];
  [self createGestures];
  go=true;
  [self setNeedsDisplay];
}

-(void)createIntervals:(double) total_seconds {
  vid_length = total_seconds;
    
  CGSize bounds = [self frame].size;
  CGFloat width = bounds.width-10;
  
  interval_width = (int)width/vid_length;
  interval_num = (int)width / interval_width;  
  
  left_point = CGPointMake(0, 0);
  right_point = CGPointMake(bounds.width, 0);
}

-(void)createGestures {
  
  NSLog(@"Creating Gestures");
  

//  UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc ] initWithTarget:self action:@selector(handleSingleDoubleTap:)];
//  singleFingerDTap.numberOfTapsRequired = 2;
//  [self addGestureRecognizer:singleFingerDTap];
//  [singleFingerDTap release];
//  
//  UITapGestureRecognizer *singleFingerSTap = [[UITapGestureRecognizer alloc ] initWithTarget:self action:@selector(handleSingleSTap:)];
//  singleFingerSTap.numberOfTapsRequired = 1;
//  [self addGestureRecognizer:singleFingerSTap];
//  [singleFingerSTap release];
//  
//  UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePincheGesture:)];
//  [self addGestureRecognizer:pinchGesture];
//  [pinchGesture release];

  UIPanGestureRecognizer *panrec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
  [self addGestureRecognizer:panrec];
  [panrec release];
}

-(CGFloat)distanceOfPoints:(CGPoint)p1 to: (CGPoint)p2 {
  
  CGFloat dist = sqrtf( powf((p1.x - p2.x),2) );
  return dist;
}

-(IBAction)handleDrag:(UIGestureRecognizer*)sender {
  
  CGPoint touch_point = [sender locationInView:self];
  
  CGPoint *closestPoint;
  
  if([self distanceOfPoints:touch_point to:left_point] < 100) {
    closestPoint = &left_point;
  } else if([self distanceOfPoints:touch_point to:right_point] < 100) {
    closestPoint = &right_point;
  } else {
    return; 
  }
  CGSize bounds = [self frame].size;
  if(touch_point.x > -1 && touch_point.x <= bounds.width)
    closestPoint->x = touch_point.x;
    
  if(left_point.x >= right_point.x) {
    
  }
    
  [self updateVideo:closestPoint];
  
  [self setNeedsDisplay];
}

-(void)updateVideo:(CGPoint*)point {
  CGSize bounds = [self frame].size;
  
  double percentage = point->x/bounds.width;
  
  double seconds = vid_length * percentage;
  
  [playbackview showFrame:seconds];
  
  //[playbackview seekVideo:seconds];
  
}

-(IBAction)playPreview:(id)sender {
  
  CGSize bounds = [self frame].size;
  double percentage = left_point.x/bounds.width;
  double seconds = vid_length*percentage;
  curr_time = seconds;
  
  percentage = right_point.x/bounds.width;
  seconds = vid_length*percentage;
  preview_end = seconds;

}

-(IBAction)handleSingleSTap:(UIGestureRecognizer*)sender {
  NSLog(@"Single Gesture");
  
  //Figuring out Tapped Point
//  CGPoint tapPoint = [sender locationInView:sender.view.superview];
//  CGFloat fx = tapPoint.x;
//  CGFloat fy = tapPoint.y;
//  
//  //Figuring out Origin
//  CGRect rect = [self frame];
//  CGPoint origin = rect.origin;
//  CGFloat oX = origin.x;
//  CGFloat oY = origin.y;
  
  //Distance from top left corner of View
 // CGPoint dist = CGPointMake(fx-oX, fy-oY);
  
  [self setNeedsDisplay];
  
}

-(IBAction)handlePincheGesture:(UIGestureRecognizer*)sender {
  NSLog(@"Pinch Gesture!");
  
  
}

-(IBAction)handleSingleDoubleTap:(UIGestureRecognizer*)sender {
  NSLog(@"DTap Gesture!");
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  [super drawRect:rect];
  if(!go)
    return;
    
  CGSize size = [self frame].size;
  
  CGContextRef context = UIGraphicsGetCurrentContext();
 
  CGRect rectangle = CGRectMake(left_point.x, 0, right_point.x-left_point.x, size.height);
  CGContextAddRect(context, rectangle);
  CGContextStrokePath(context);
  CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);

  CGContextFillRect(context, rectangle);
}


@end
