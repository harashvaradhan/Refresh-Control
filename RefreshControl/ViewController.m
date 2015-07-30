//
//  ViewController.m
//  RefreshControl
//
//  Created by GNR solution PVT.LTD on 05/06/15.
//  Copyright (c) 2015 Harshavardhan Edke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIScrollView *scrollView;
    UIView *mView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 0, 30, 150)];
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.delegate=self;
    scrollView.contentSize = CGSizeMake(30, 200);
    [self.view addSubview:scrollView];
    
    

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
//    [refreshControl addTarget:self action:@selector(beginRefresh) forControlEvents:UIControlEventValueChanged];
    
    [scrollView addSubview:refreshControl];
    
    
    mView  = [[UIView alloc]initWithFrame:CGRectMake(150, 0, 30, 150)];
    mView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:mView];
    
    
    UISwipeGestureRecognizer *swipeBottom = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown:)];
    swipeBottom.direction = UISwipeGestureRecognizerDirectionDown;
    swipeBottom.delegate = self;
    
    
   // [mView addGestureRecognizer:swipeBottom];
    
}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGRect frame = mView.frame;
    frame.size.height += 1;
    
     if(frame.size.height<250)
    {
        UITouch *aTouch = [touches anyObject];
        if([aTouch view]==mView)
        {
            CGPoint location = [aTouch locationInView:mView];
            [UIView beginAnimations:@"Dragging A DraggableView" context:nil];
            mView.frame = frame;
            [UIView commitAnimations];
        }
        
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(mView.frame.size.height<245)
    {
        [self reFrameView];
    }
}

-(void)reFrameView{
    CGRect frame = mView.frame;
    frame.size.height = 150;
    [UIView beginAnimations:@"Dragging A DraggableView" context:nil];
    mView.frame = frame;
    [UIView commitAnimations];
}

-(void)swipeDown:(UISwipeGestureRecognizer *)swipe{
    NSLog(@"Swipe Down");
//    CGRect frame = scrollView.frame;
//    frame.size.height = 250;
//    [UIView animateWithDuration:1.0 animations:^{
//        scrollView.frame = frame;
//    }];
    
    NSLog(@"ScrollView beginRefresh");
    CGRect frame = mView.frame;
    frame.size.height = 250;
    [UIView animateWithDuration:1.0 animations:^{
        mView.frame = frame;
    }];
}

-(void)beginRefresh{
    NSLog(@"ScrollView beginRefresh");
    CGRect frame = mView.frame;
    frame.size.height = 250;
    [UIView animateWithDuration:1.0 animations:^{
        mView.frame = frame;
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
