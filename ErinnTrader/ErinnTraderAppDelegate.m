
#import "ErinnTraderAppDelegate.h"
#import "TabBarController.h"
#import "BoardViewController.h"
#import "BoardSearchResultViewController.h"
#import "BoardItemViewController.h"
#import "HouseShopViewController.h"
#import "HouseShopSearchResultViewController.h"
#import "HouseShopItemViewController.h"
#import "SettingsViewController.h"
#import "CreditViewController.h"
#import "ETDefaultStyleSheet.h"

@interface ErinnTraderAppDelegate ()
- (void)fadeSplashScreen;
- (void)doNothing;
@end

@implementation ErinnTraderAppDelegate

#pragma -
#pragma Private Methods

////////////////////////////////////////////////////////////////////////////////
// Initializer

- (void)initRoutes {
  TTNavigator* navigator = [TTNavigator navigator];  
  navigator.persistenceMode = TTNavigatorPersistenceModeNone;
  navigator.window = [[[UIWindow alloc] initWithFrame:TTScreenBounds()] autorelease];  
  
  TTURLMap* map = navigator.URLMap;  
  [map from:@"*" toViewController:[TTWebController class]];
  [map from:@"tt://dev/null" toViewController:self selector:@selector(doNothing)];
  [map from:@"tt://tabBar" toSharedViewController:[TabBarController class]];
  [map from:@"tt://board" toViewController:[BoardViewController class]];
  [map from:@"tt://board/item" toViewController:[BoardItemViewController class]];
  [map from:@"tt://board/search?q=(initWithSearchQuery:)" toViewController:[BoardSearchResultViewController class]];
  [map from:@"tt://houseShop" toViewController:[HouseShopViewController class]];
  [map from:@"tt://houseShop/item" toViewController:[HouseShopItemViewController class]];
  [map from:@"tt://houseShop/search?q=(initWithSearchQuery:)" toViewController:[HouseShopSearchResultViewController class]];
  [map from:@"tt://settings" toViewController:[SettingsViewController class]];
  [map from:@"tt://credit" toModalViewController:[CreditViewController class]];
  
  if (![navigator restoreViewControllers]) {  
    [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://tabBar"]];  
  }
}

- (void)initStyleSheet {
  [TTStyleSheet setGlobalStyleSheet:[[[ETDefaultStyleSheet alloc] init] autorelease]];  
}

////////////////////////////////////////////////////////////////////////////////
// Logic

- (void)fadeSplashScreen {
  UIImage *img = [UIImage imageNamed:@"Default.png"];	
	UIImageView *imageview = 
  [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
	imageview.image = img;
  [[TTNavigator navigator].window addSubview:imageview];
  
  [UIView animateWithDuration:1.0
                   animations:^{ imageview.alpha = 0.0; }];
}

#pragma -
#pragma Inheritance Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [UIApplication sharedApplication].statusBarHidden = NO;
  [self initStyleSheet];
  [self initRoutes];
  [self fadeSplashScreen];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)dealloc {
  [super dealloc];
}

#pragma -
#pragma TTNavigator Inheritance Methods

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)URL {
  [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:URL.absoluteString]];
  return YES;
}

- (void)doNothing {
  // do nothing
}

@end

