//
//  ViewController.m
//  Videotater
//
//  Created by Kevin Hampton on 11/27/11.
//  Copyright (c) 2011 Ga Tech. All rights reserved.
//

#import "ViewController.h"
#import "PreviewView.h"

@implementation ViewController

@synthesize videos;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  videos = [[NSMutableArray alloc] init];
  [videos addObject: [NSURL URLWithString:@"http://kevinhampton.net/truck2.mov"]];
  //[videos addObject:@"Truck"];
  
	// Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [videos count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
  if(!cell) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
  }
  NSString* str = [[videos objectAtIndex:[indexPath row]] lastPathComponent];
  [[cell textLabel] setText:str];
  return cell;
  
}

-(void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSURL* url = [videos objectAtIndex:[indexPath row]];
  [pView setPlayer:url];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  return YES;
}

@end
