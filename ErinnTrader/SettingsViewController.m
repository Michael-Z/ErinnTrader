
#import "SettingsViewController.h"

@interface SettingsViewController ()
- (void)initView;
@end

@implementation SettingsViewController

#pragma mark -
#pragma mark Private Methods

////////////////////////////////////////////////////////////////////////////////
// initializer

- (void)initView {
  self.title = @"Settings";
  UIImage *image = [UIImage imageNamed:@"Settings"];
  self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Settings" image:image tag:2] autorelease];

  self.delegate = self;
  self.showDoneButton = NO;
  self.showCreditsFooter = NO;
  
  self.navigationItem.rightBarButtonItem = 
  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                target:self
                                                action:@selector(searchButtonTouched)];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self initView];
  }
  return self;
}

- (id)initWithNavigatorURL:(NSURL *)URL query:(NSDictionary *)query { 
  self = [self initWithNibName:@"IASKAppSettingsView" bundle:nil];
  if (self) {
  }
  return self;
}

- (void)loadView {
  [super loadView];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

- (void)dealloc {
  [super dealloc];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark IASKAppSettingsViewControllerDelegate protocol

- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController *)sender {
  // do nothing
}

@end

