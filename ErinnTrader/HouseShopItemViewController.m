
#import "HouseShopItemViewController.h"

@interface HouseShopItemViewController ()
- (void)initView;
- (void)layoutView;
@end

@implementation HouseShopItemViewController

@synthesize houseShopItem = _houseShopItem;

#pragma mark -
#pragma mark Private Methods

- (void)initView {
  self.view = [[[TTView alloc] initWithFrame:TTScreenBounds()] autorelease];
}

- (void)layoutView {
  self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNavigatorURL:(NSURL *)URL query:(NSDictionary *)query { 
  self = [super init];
  if (self) {
    self.houseShopItem = (HouseShopItem *)[query objectForKey:@"item"];
  }
  return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

-(void)loadView {
  [super loadView];
  [self initView];
  [self layoutView];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

- (void)dealloc {
  [super dealloc];
}

@end
