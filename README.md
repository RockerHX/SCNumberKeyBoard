## SCNumberKeyBoard
* A Money Number KeyBoard Like AliPay Money Number KeyBoard.
* You can use code, xib and storyboard.

## Installation
Use the [CocoaPods](http://github.com/CocoaPods/CocoaPods).

In your Podfile
>`pod 'SCNumberKeyBoard'`

Get SCNumberKeyBoard
>`#import "SCNumberKeyBoard.h"`

## Or
Drag `SCNumberKeyBoardDemo/Classes` and `SCNumberKeyBoardDemo/Resources/` folder into your project
>`#import "SCNumberKeyBoard.h"`

## Previews
![](http://i1.tietuku.com/56d87eac2287ab33.gif)

## How To Use
```objc
[SCNumberKeyBoard showOnViewController:<#viewController#> enterButtonTitle:nil enter:^(UITextField *textField, NSString *number) {
        NSLog(@"textField:%@ - number:%@", textField, number);
    } close:^(UITextField *textField, NSString *number) {
        NSLog(@"textField:%@ - number:%@", textField, number);
}];
```
## Or
```objc
[SCNumberKeyBoard showWithTextField:<#textField#> enter:^(UITextField *textField, NSString *number) {
        NSLog(@"textField:%@ - number:%@", textField, number);
    } close:^(UITextField *textField, NSString *number) {
        NSLog(@"textField:%@ - number:%@", textField, number);
}];
```
## Localization
Localization include Chinese and English, you can add other by yourself. Change localization you should edit Info.plist.

Use localization that you should change iOS system language.

-----------------

## 金额输入键盘
* 可以同时在代码和Xib以及Storyboard中使用。
* 只需要简单一句代码即可搞定麻烦的金额输入控制。

## 如何使用SCNumberKeyBoard

### Cocoapods:
* cocoapods导入：`pod 'SCNumberKeyBoard'`

### 手动导入:
* 将`SCNumberKeyBoardDemo/Classes`和`SCNumberKeyBoardDemo/Resources/`文件夹中的所有文件拽入项目中
* 导入主头文件：`#import "SCNumberKeyBoard.h"`

## 效果图
![](http://i1.tietuku.com/56d87eac2287ab33.gif)

## 加入代码
```objc
[SCNumberKeyBoard showOnViewController:<#viewController#> enterButtonTitle:nil enter:^(UITextField *textField, NSString *number) {
        NSLog(@"textField:%@ - number:%@", textField, number);
    } close:^(UITextField *textField, NSString *number) {
        NSLog(@"textField:%@ - number:%@", textField, number);
}];
```
## 或者
```objc
[SCNumberKeyBoard showWithTextField:<#textField#> enter:^(UITextField *textField, NSString *number) {
        NSLog(@"textField:%@ - number:%@", textField, number);
    } close:^(UITextField *textField, NSString *number) {
        NSLog(@"textField:%@ - number:%@", textField, number);
}];
```
## 本地化
本地化只包含了中文和英文，其他语言自行添加。

使用本地化，改变iOS系统语言即可。

