## SCNumberKeyBoard
* A Money Number KeyBoard Like AliPay Money Number KeyBoard.
* You can use code, xib and storyboard.

## Installation
Use the [CocoaPods](http://github.com/CocoaPods/CocoaPods).

In your Podfile
>`pod 'SCNumberKeyBoard'`

Get busy Masoning
>`#import "Masonry.h"`

## Or
Drag `SCNumberKeyBoardDemo/Classes` folder into your project
>`#import "Masonry.h"`

## Previews
![](http://i1.tietuku.com/56d87eac2287ab33.gif)

## How To Use
```{bash}
[SCNumberKeyBoard showOnViewController:<#viewController#> block:^(UITextField *textField, NSString *number) {
    NSLog(@"%@", number);
}];
```
### Or
```{bash}
[SCNumberKeyBoard showWithTextField:<#textField#> block:^(UITextField *textField, NSString *number) {
    NSLog(@"%@", number);
}];
```

-----------------

## 金额输入键盘
* 可以同时在代码和Xib以及Storyboard中使用。
* 只需要简单一句代码即可搞定麻烦的金额输入控制。

## 如何使用SCNumberKeyBoard
### Cocoapods:
* cocoapods导入：`pod 'SCNumberKeyBoard'`
### 手动导入:
* 将`SCNumberKeyBoardDemo/Classes`文件夹中的所有文件拽入项目中
* 导入主头文件：`#import "SCNumberKeyBoard.h"`

## 效果图
![](http://i1.tietuku.com/56d87eac2287ab33.gif)

## 加入代码
```{bash}
[SCNumberKeyBoard showOnViewController:<#viewController#> block:^(UITextField *textField, NSString *number) {
    NSLog(@"%@", number);
}];
```
### Or
```{bash}
[SCNumberKeyBoard showWithTextField:<#textField#> block:^(UITextField *textField, NSString *number) {
    NSLog(@"%@", number);
}];
```
