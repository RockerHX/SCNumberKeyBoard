#
#  Be sure to run `pod spec lint SCNumberKeyBoardDemo.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "SCNumberKeyBoard"
  s.version      = "0.2.0"
  s.summary      = "A Money Number KeyBoard Like AliPay Money Number KeyBoard."

  s.description  = <<-DESC
  
                        ##SCNumberKeyBoard
                        * A Money Number KeyBoard Like AliPay Money Number KeyBoard.

                        ##金额输入键盘
                        * 可以同时在代码和Xib以及Storyboard中使用。
                        * 只需要简单一句代码即可搞定麻烦的金额输入控制。

                        ## 如何使用SCNumberKeyBoard
                        * cocoapods导入：`pod 'SCNumberKeyBoard'`
                        * 手动导入：
                        * 将`SCNumberKeyBoardDemo/Class`文件夹中的所有文件拽入项目中
                        * 导入主头文件：`#import "SCNumberKeyBoard.h"`

                        ![](http://i1.tietuku.com/56d87eac2287ab33.gif)

                        -----------------

                        ```{bash}
                            [SCNumberKeyBoard showWithTextField:textField block:^(NSString *number) {
						        NSLog(@"number:%@", number);
						    }];
                        ```
                   DESC

  s.homepage     = "https://github.com/shicang1990/SCNumberKeyBoard"
  s.screenshots  = "http://i1.tietuku.com/56d87eac2287ab33.gif"
  s.license      = "MIT"
  s.author       = { "ShiCang" => "shicang1990@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/shicang1990/SCNumberKeyBoard.git", :tag => s.version }
  s.source_files = "Classes/*.{h,m}"
  s.resource     = "Resources/SCNumberKeyBoard.bundle"
  s.requires_arc = true

end
