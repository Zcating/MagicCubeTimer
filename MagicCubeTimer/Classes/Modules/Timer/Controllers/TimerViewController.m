//
//  TimerViewController.m
//  MagicCubeTimer
//
//  Created by  zcating on 11/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//

#import "TimerViewController.h"

#import "MCTimer.h"
#import "DisruptionMaker.h"
#import "UIImage+MCScale.h"

#import "CubeView.h"


@interface TimerViewController ()<UIGestureRecognizerDelegate> {
    BOOL _isTiming;
}
@property (weak, nonatomic) IBOutlet CubeView *cubeView;

@property (weak, nonatomic) IBOutlet UITextView *disruptionStepView;

@property (weak, nonatomic) IBOutlet UIButton *timerButton;

@property (nonatomic, strong) DisruptionMaker *maker;

@property (nonatomic, strong) MCTimer *timer;

@end

@implementation TimerViewController

- (instancetype)init {
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        self.maker = [[DisruptionMaker alloc] init];
        self.timer = [[MCTimer alloc] init];
    }
    return self;
}

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetTimerButton];
    
    self.disruptionStepView.text = [self.maker readableSteps];
    
//    self.cubeView.matrix = [[ColorMatrix alloc] init];
    self.cubeView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetTimerButton {
    [self.timerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.timerButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(readyToStart:)];
    longPress.minimumPressDuration = 0.7;
    longPress.allowableMovement = YES;
    [self.timerButton addGestureRecognizer:longPress];
}


- (void)readyToStart:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [self.timerButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    } else if (longPress.state == UIGestureRecognizerStateEnded) {
        [self startTiming];
    }
}

- (void)startTiming {
    _isTiming = YES;
    [self.timerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.timerButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    [self.timer start:^(NSString *countString, NSTimeInterval time) {
        [self.timerButton setTitle:countString forState:UIControlStateNormal];
    }];
}

- (IBAction)touched:(UIButton *)sender {
    if (_isTiming) {
        _isTiming = NO;
        [self.timer stop];
        [self.timerButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        [self.maker resetSteps];
        self.disruptionStepView.text = [self.maker readableSteps];
    } else {
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.45 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        });
    }
}


@end
