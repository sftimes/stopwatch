//
//  ViewController.m
//  stopWatch
//
//  Created by Myth Myers on 13-7-1.
//  Copyright (c) 2013年 Myth Myers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSInteger totalTime;
    NSInteger timeLapPoint;
    Boolean Clicked;
    
    
    NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *NowTime;//显示当前时间的标签


@property (nonatomic,retain) UIButton *leftButton;
@property (nonatomic,retain) UIButton *rightButton;

- (IBAction)leftButton:(UIButton *)sender;
- (IBAction)rightButton:(UIButton *)sender;

- (float)updateTimer;

@property (strong, nonatomic) IBOutletCollection(UITableView) NSArray *tableView;
@property (weak, nonatomic) IBOutlet UITableViewCell *tableViewCell;



@end

@implementation ViewController


@synthesize leftButton;
@synthesize rightButton;
@synthesize tableView;

//@synthesize systime;

@synthesize timeLapPoint;







- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)leftButton:(UIButton *)sender {
    
  //变换背景图
    UIImage *newImageL = (Clicked) ? [UIImage imageNamed:@"stop.png"] : [UIImage imageNamed:@"start.png"];
    [leftButton setBackgroundImage:newImageL forState:UIControlStateNormal];
    
    UIImage *newImageR = (Clicked) ? [UIImage imageNamed:@"lap.png"] : [UIImage imageNamed:@"reset.png"];
    [rightButton setBackgroundImage:newImageR forState:UIControlStateNormal];

    if (Clicked)   //start
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    }else {        //stop
        [timer invalidate];
    }
    
    //状态切换
    Clicked = !Clicked;
    
    
}

- (IBAction)rightButton:(UIButton *)sender {
    
    
    static NSInteger count = 1;
    
    if (Clicked) //reset
    {
        totalTime = timeLapPoint = 0.0;
        self.NowTime = [NSString stringWithFormat:@"00:00.0"];
  //      [lable setText:sysTime];
        
      //  list_time = list_lap = nil;
        count = 1;
        [tableview reloadData];
        
    }else {      //lap
        if (list_time == nil) {
            list_time = [[NSArray alloc]initWithObjects:timestr_lap, nil];
            list_lap = [[NSArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",count++], nil];
        }else {
#if 0
            [list arrayByAddingObject:timestr];
#else
            NSArray *array = [[NSArray alloc]initWithObjects:timestr_lap, nil];
            list_time = [array arrayByAddingObjectsFromArray:list_time];
            array = [[NSArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",count++], nil];
            list_lap = [array arrayByAddingObjectsFromArray:list_lap];
#endif
        }
        time_lap = 0;
        [tableview reloadData];
    }
    
}



//与第一个相关
/*- (float) updateTime
{
    time+=0.1;
    time_lap +=0.1;
    timestr = [NSString stringWithFormat:@"%02d:%04.1f",(int)(time / 60) ,time - ( 60 * (int)( time / 60 ) )];
    timestr_lap = [NSString stringWithFormat:@"%02d:%04.1f",(int)(time_lap / 60) ,time_lap - ( 60 * (int)( time_lap / 60 ) )];
    [label setText:timestr];
    return time;
}

*/





@end
