//
//  FlickrPhotoTVC.m
//  ShutterBug
//
//  Created by Misaka on 14-4-1.
//  Copyright (c) 2014年 yue1995. All rights reserved.
//

#import "FlickrPhotoTVC.h"

@implementation FlickrPhotoTVC

- (void)setPhotos:(NSArray *)photos{
    _photos = photos;
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource

/*// the methods in this protocol are what provides the View its data
// (remember that Views are not allowed to own their data)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section (we only have one)
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // we must be sure to use the same identifier here as in the storyboard!
        // Configure the cell...
    
    // get the photo out of our Model
    
    // update UILabels in the UITableViewCell
    // valueForKeyPath: supports "dot notation" to look inside dictionaries at other dictionaries
}*/

@end
