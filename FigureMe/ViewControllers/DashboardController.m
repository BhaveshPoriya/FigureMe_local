//
//  DashboardController.m
//  FigureMe
//
//  Created by ECSMac2 on 10/2/14.
//  Copyright (c) 2014 ECS. All rights reserved.
//

#import "DashboardController.h"

@interface DashboardController ()

@end

@implementation DashboardController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
    CGRect f = CGRectMake(10, 105, 300, 450);
    self.galleryFlowview = [[IIIFlowView alloc] initWithFrame:f];
    self.galleryFlowview.flowDelegate = self;
    
    //Dressing up the view
    self.galleryFlowview.layer.cornerRadius = 10.0f;
    
    [self.galleryFlowview.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.galleryFlowview.layer setShadowOpacity:0.8];
    [self.galleryFlowview.layer setShadowRadius:10.0];
    [self.galleryFlowview.layer setShadowOffset:CGSizeMake(5.0, 5.0)];
    
    // First init datasource.
    IIIBaseData *d;
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    
    d = [[IIIBaseData alloc] init];
    d.score = 100;
    d.web_url = @"http://2.bp.blogspot.com/-kjgWqZo8vpc/UX8hbpshnJI/AAAAAAAAMCA/FX5bpHvRzsk/s1600/KT2_4112_pp_distressed.jpg";
    [self.dataSource addObject:d];
    
    d = [[IIIBaseData alloc] init];
    d.score = 120;
    d.web_url = @"http://121clicks.com/wp-content/uploads/2012/04/portrait_eyes_14.jpg";
    [self.dataSource addObject:d];
    
    d = [[IIIBaseData alloc] init];
    d.score = 150;
    d.web_url = @"http://digital-photography-school.com/wp-content/uploads/2012/06/Portrait-Photography-Next-Level-04.jpg";
    [self.dataSource addObject:d];
    
    d = [[IIIBaseData alloc] init];
    d.score = 90;
    d.web_url = @"http://www.studioreflections.com.au/wp/wp-content/gallery/portrait_1/studio-reflections-portrait-child_-1.jpg";
    [self.dataSource addObject:d];
    
    d = [[IIIBaseData alloc] init];
    d.score = 100;
    d.web_url = @"http://public.media.smithsonianmag.com/legacy_blog/npg_portraits_nicholson_jack_2002.jpg";
    [self.dataSource addObject:d];
    
    d = [[IIIBaseData alloc] init];
    d.score = 150;
    d.web_url = @"http://www.goldennumber.net/wp-content/uploads/2013/08/florence-colgate-england-most-beautiful-face.jpg";
    [self.dataSource addObject:d];
    
    d = [[IIIBaseData alloc] init];
    d.score = 80;
    d.web_url = @"http://www.studioreflections.com.au/wp/wp-content/gallery/portrait_1/studio-reflections-portrait-child_-1.jpg";
    [self.dataSource addObject:d];
    
    d = [[IIIBaseData alloc] init];
    d.score = 125;
    d.web_url = @"http://www.goldennumber.net/wp-content/uploads/2013/08/florence-colgate-england-most-beautiful-face.jpg";
    [self.dataSource addObject:d];
    
    [self.galleryFlowview reloadData];
    
    [self.view addSubview:self.galleryFlowview];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showRightMenuPressed:(id)sender {
}

- (IBAction)btnSeeAllClicked:(id)sender {
    [self performSegueWithIdentifier:@"PushDashboardToGallery" sender:self];
}


#pragma mark - IIIFlowView delegate required methods

- (NSInteger)numberOfColumns {
    return 2;
}


- (NSInteger)numberOfCells {
    return self.dataSource.count;
}


- (CGFloat)rateOfCache {
    return 5.0f;
}


- (IIIFlowCell *)flowView:(IIIFlowView *)flow cellAtIndex:(int)index {
    NSString *reuseId = @"CommonCell";
    IIIFlowCell *cell = [flow dequeueReusableCellWithId:reuseId];
    if (!cell) {
        cell = [[IIIFlowCell alloc] initWithReuseId:reuseId];
    }
    return cell;
}

- (IIIBaseData *)dataSourceAtIndex:(int)index {
    return [self.dataSource objectAtIndex:index];
}

@end
