//
//  justPostedFlickrPhotosTVC.m
//  ShutterBug
//
//  Created by Misaka on 14-4-1.
//  Copyright (c) 2014年 yue1995. All rights reserved.
//

#import "justPostedFlickrPhotosTVC.h"
#import "FlickrFetcher.h"

@implementation justPostedFlickrPhotosTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchPhotos];
}

- (void)fetchPhotos
{
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    NSData *jsonResult = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResult
                                                                        options:0
                                                                          error:NULL];
    NSLog(@"Flickr result = %@", propertyListResults);
    
    self.photos = nil;    
}

@end
