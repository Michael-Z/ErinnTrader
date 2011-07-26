#import "TTTabStrip+Justify.h"

@implementation TTTabStrip (JustifiedBarCategory)

- (CGSize)layoutTabs {
  CGSize size = [super layoutTabs];
  
  CGPoint contentOffset = _scrollView.contentOffset;
  _scrollView.frame = self.bounds;
  _scrollView.contentSize = CGSizeMake(size.width + kTabMargin, self.height);
  
  CGFloat contentWidth = size.width + kTabMargin;
  if (contentWidth < _scrollView.size.width) {
    int count = [_tabViews count];
    float whitespace = _scrollView.size.width - contentWidth;
    float margin = whitespace/(count-1);
    for (int i = 1; i < [_tabViews count]; i++) {
      float start = [[_tabViews objectAtIndex:i-1] frame].origin.x + [[_tabViews objectAtIndex:i-1] frame].size.width;
      TTTab *tab = [_tabViews objectAtIndex:i];
      [tab setLeft:(start + margin)];
    }
  } else {
    _scrollView.contentOffset = contentOffset;
  }
  return size;
}

@end