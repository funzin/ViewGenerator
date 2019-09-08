<p align="center">
    <img src="./Resource/logo/thumbnail.png" alt="ViewGenerator" width="70%" height="70%" />
</p>

<p align="center">
  <a href=https://travis-ci.org/funzin/ViewGenerator>
    <img src=https://travis-ci.org/funzin/ViewGenerator.svg?branch=master />
  </a>
  <a href=https://codecov.io/gh/funzin/ViewGenerator>
    <img src=https://codecov.io/gh/funzin/ViewGenerator/branch/master/graph/badge.svg>
  </a>
  <img src="http://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform" />
  <a href="https://developer.apple.com/swift">
    <img src="http://img.shields.io/badge/Swift-5.0-brightgreen.svg?style=flat" alt="Language">
  </a>
  <a href="./LICENSE">
    <img src="https://img.shields.io/github/license/funzin/ViewGenerator" alt="License" />
  </a>
  <a href=https://sonarcloud.io/dashboard?id=funzin_ViewGenerator> 
    <img src=https://sonarcloud.io/api/project_badges/measure?project=funzin_ViewGenerator&metric=alert_status />
  </a>
  <a href="https://twitter.com/fufunzin">
    <img src="https://img.shields.io/badge/twitter-@fufunzin-blue.svg" alt="License" />
  </a>
</p>

## Overview
ViewGenerator generates view code from variable name automatically when you create view by code in iOS development

## Download
<a href="https://apps.apple.com/us/app/viewgenerator-for-xcode/id1476703048?l=ja&ls=1&mt=12">
  <img src="https://user-images.githubusercontent.com/12893657/63224925-294cc480-c206-11e9-83c6-48cf001a0cd0.png" width=20% />
</a>


## Environment
- Xcode 10.3 or greater
- Swift 5.0 or greator

## Demo
<img src=./Resource/gif/demo.gif width=70%>

## Install
1. Install [ViewGenerator](https://apps.apple.com/us/app/viewgenerator-for-xcode/id1476703048?l=ja&ls=1&mt=12) from AppStore


2. Enable ViewGenerator
    1. `System Preferences` → `Extensions`
    2. Switch on `Xcode Source Editor` checkbox

<img src=./Resource/screenshot/setting.png width=70%>
  

## Usage
1. Input variable name <br>
  **⚠Important⚠ : variable name must be included class name without `UI` as suffix.** (e.g. `hogeView`, `hogeLabel`, etc.) <br>
  Please check [Support View List](https://github.com/funzin/ViewGenerator#support-view-list) bellow
2. Select variable name
3. `Editor`→`ViewGenerator`→`Generate View Code`

<img src=./Resource/screenshot/generate_view_code.png width=70%>

4. Generated⚒

### Recommend
**I strongly recommend that you register `Generate View Code` Command to shortcut**

1. `Xcode Preferences` →　`KeyBindings`
2. Input `ViewGenerator` in Search
3. Register shortcut

<img src=./Resource/screenshot/shortcut.png width=70%>

### Usage Example
#### Multiple variables
||GIF|
|:-:|:-:|
|select|<img src=./Resource/gif/demo.gif width=70%>|

#### Single Variable
||GIF|
|:-:|:-:|
|not_select|<img src=./Resource/gif/not_select.gif>|
|select|<img src=./Resource/gif/select.gif>|

### Supplement
Default access modifier is **private** . if you change access modifier, open viewgenerator app and then select access modifier that you want to select

<img src=./Resource/screenshot/mac_app.png width=70%>


## Example

For example, if variable name prefix is `hoge`, it is generated as bellow 

hogeView
```swift
private let hogeView: UIView = {
    let hogeView = UIView(frame: .zero)
    hogeView.translatesAutoresizingMaskIntoConstraints = false
    return hogeView
}()
```

hogeButton
```swift
private let hogeButton: UIButton = {
    let hogeButton = UIButton(frame: .zero)
    hogeButton.translatesAutoresizingMaskIntoConstraints = false
    return hogeButton
}()
```

<details>
<summary>hogeTableView</summary>
<div>
    
```swift
private let hogeTableView: UITableView = {
    let hogeTableView = UITableView(frame: .zero)
    hogeTableView.translatesAutoresizingMaskIntoConstraints = false
    return hogeTableView
}()
```
</div>
</details>

<details>
<summary>hogehoge</summary>
<div>
    
```swift
private let hogehoge: _InputTypeName_ = {
    let hogehoge = _InputTypeName_(frame: .zero)
    hogehoge.translatesAutoresizingMaskIntoConstraints = false
    return hogehoge
}()
```
</div>
</details>



### Support View List
|View|
|:-:|
|`UISwitch`|
|`UIActivityIndicatorView`|
|`UIButton`|
|`UICollectionView`|
|`UIControl`|
|`UIDatePicker`|
|`UIImageView`|
|`UILabel`|
|`UINavigationBar`|
|`UIPageControl`|
|`UIPickerView`|
|`UIProgressView`|
|`UIScrollView`|
|`UISearchBar`|
|`UISegmentedControl`|
|`UISlider`|
|`UIStackView`|
|`UIStepper`|
|`UITabBar`|
|`UITableView`|
|`UITextField`|
|`UITextView`|
|`UIToolbar`|
|`UIView`|
|`UIVisualEffectView`|

If you input variable name that doesn't correspond to the support view list, type name is input as `_InputTypeName_`  automatically.


## Contact
If you discover problem or have opinions, please let me know through Github issues💁‍♂️

## Author
funzin
- mail: nakazawa.fumito@gmail.com

## License
ViewGenerator is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
