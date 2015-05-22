## SCNumberKeyBoard
* A Money Number KeyBoard Like AliPay Money Number KeyBoard.

## 金额输入键盘
* 可以同时在代码和Xib以及Storyboard中使用。
* 只需要简单一句代码即可搞定麻烦的金额输入控制。

## 如何使用SCNumberKeyBoard
* cocoapods导入：`pod 'SCNumberKeyBoard'`
* 手动导入：
* 将`SCNumberKeyBoardDemo/Classes`文件夹中的所有文件拽入项目中
* 导入主头文件：`#import "SCNumberKeyBoard.h"`

## 效果图
![](http://i1.tietuku.com/56d87eac2287ab33.gif)

-----------------

## Code
```{bash}
[SCNumberKeyBoard showWithTextField:textField block:^(NSString *number) {
    NSLog(@"%@", number);
}];
```
