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
Drag `SCNumberKeyBoardDemo/Classes` folder into your project
>`#import "SCNumberKeyBoard.h"`

## Previews
![](http://i1.tietuku.com/56d87eac2287ab33.gif)

## How To Use
```objc
[SCNumberKeyBoard showOnViewController:<#viewController#> block:^(UITextField *textField, NSString *number) {
    NSLog(@"%@", number);
}];
```
### Or
```objc
[SCNumberKeyBoard showWithTextField:<#textField#> block:^(UITextField *textField, NSString *number) {
    NSLog(@"%@", number);
}];
```
## Localization
Localization include Chinese and English, you can add other by yourself. Change localization you should edit Info.plist.

the item of [Localization native development region], this project default is base for English, you can change to zn_h for display Chinese, and you can change to en for display English, also you can selected UK or US for display English, or you can selected China for display Chinese.

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
```objc
[SCNumberKeyBoard showOnViewController:<#viewController#> block:^(UITextField *textField, NSString *number) {
    NSLog(@"%@", number);
}];
```
### Or
```objc
[SCNumberKeyBoard showWithTextField:<#textField#> block:^(UITextField *textField, NSString *number) {
    NSLog(@"%@", number);
}];
```
## 本地化
本地化只包含了中文和英文，其他语言自行添加

改变语言环境请在工程目录下找到并编辑Info.plist文件的[Localization native development region]项，本工程默认为base显示英文，你也可以改变其值为zn_h显示中文，或者选择UK或US显示英文，亦可以选择China显示中文

