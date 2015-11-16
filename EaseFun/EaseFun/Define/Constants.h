//
//  Constants.h
//
//  Created by IncredibleMJ on 15/11/13.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/**文字大小*/
#define kTitleSize 17
#define kDescSize 12
#define kCommentSize 10

#define kCommentWidth 60

/**左侧图片宽度*/
#define kiconWidth 60
/**间隔*/
#define kTopPadding 10
#define kleftRightPadding 5
#define kBottomPadding 5
#define kImageSpace 10

/**当前时间距离1970的秒数*/
#define kCurrentTimeInterval ((NSInteger)[[NSDate date]timeIntervalSince1970])

/** 导航栏题目文字大小 */
#define kNaviTitleFontSize   24.0
/** 导航栏题目文字颜色 */
#define kNaviTitleColor   [UIColor colorWithRed:239/255.0 green:141/255.0 blue:119/255.0 alpha:1.0]

//通过RGB设置颜色
#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

#define kAppDelegate ((AppDelegate*)([UIApplication sharedApplication].delegate))

//移除iOS7之后，cell默认左侧的分割线边距
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}

//Docment文件夹目录
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#endif /* Constants_h */
