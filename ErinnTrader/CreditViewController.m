
#import "CreditViewController.h"

@interface CreditViewController ()
- (NSDictionary *)locations;
@end

@implementation CreditViewController

#pragma mark -
#pragma mark Private Methods

////////////////////////////////////////////////////////////////////////////////
// initializer

- (void)initView {
  UIImage* image = [UIImage imageNamed:@"credit.png"];
  self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Credit" image:image tag:0] autorelease];
}

- (void)initNavigationBar {
  self.navigationController.navigationBarHidden = YES;
}

////////////////////////////////////////////////////////////////////////////////
// Logic

- (NSDictionary *)locations {
  return [NSDictionary dictionaryWithObjectsAndKeys:
          [NSURL URLWithString:@"http://twitter.com/#!/cohakims_work"], @"cohakim",
          nil];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self initView];
    [self initNavigationBar];
  }
  return self;
}

- (id)initWithNavigatorURL:(NSURL *)URL query:(NSDictionary *)query { 
  self = [self initWithNibName:@"CreditView" bundle:nil];
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

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma EventHandling Methods

- (IBAction)backButtonTouched {
  [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (IBAction)visitMyTwitterButtonTouched:(id)sender {
  [[UIApplication sharedApplication] openURL:[self.locations objectForKey:@"cohakim"]];
}

@end
