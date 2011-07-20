
#import "CreditViewController.h"

@implementation CreditViewController

#pragma mark -
#pragma mark Private Methods

////////////////////////////////////////////////////////////////////////////////
// initializer

- (void)initView {
  UIImage* image = [UIImage imageNamed:@"credit.png"];
  self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Credit" image:image tag:3] autorelease];
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

@end
