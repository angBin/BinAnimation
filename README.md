# BinAnimation

[![CI Status](https://img.shields.io/travis/angBin/BinAnimation.svg?style=flat)](https://travis-ci.org/angBin/BinAnimation)
[![Version](https://img.shields.io/cocoapods/v/BinAnimation.svg?style=flat)](https://cocoapods.org/pods/BinAnimation)
[![License](https://img.shields.io/cocoapods/l/BinAnimation.svg?style=flat)](https://cocoapods.org/pods/BinAnimation)
[![Platform](https://img.shields.io/cocoapods/p/BinAnimation.svg?style=flat)](https://cocoapods.org/pods/BinAnimation)

## 为什么使用

> 必要性：作为 iOS 开发工程师，在日常的开发工作中，虽然不需要像游戏开发一样设计各式各样酷炫的动画，但是简单的动画开发还是很有必要的。

> 功能性：动画一方面可以提高用户的视觉体验，另一方面利用动画的过渡时间在后台异步执行功能性代码，降低由于过长的功能性代码执行时间带来不良体验的效果。

> 优势性：日常开发动画中，除了使用 UIView 的动画分类外，更多是使用核心动画库 CAAnimation。但是使用过 CAAnimation 的人都知道，创建一个简单的动画都需要书写好几行的代码，如果是较为复杂的复合动画，代码量将会明显增加，这对开发人员来说是一个负担。BinAnimation 借鉴 [Masonry](https://github.com/SnapKit/Masonry) 的链式语法的简洁性，对 CAAnimation 进行了二次封装，很大层度上简化了核心动画使用的过程。

## 如何使用

#### 示例工程

* 点击 [BinAnimation](https://github.com/angBin/BinAnimation) 进入，可下载到本地进行调试。

#### 示例说明

* BinAnimation 的创建方法编写在 CALayer 和 NSArray 的分类中，可直接通过 CALayer * 和 NSArray<CALayer *> * 的对象调用。

```obj-c
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
}];

[self.layerArr bin_addSameAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
}];
```

###### KeyframeAnimation

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/KeyframeAnimation.gif">
</p>

```obj-c
case 0:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
}];
break;
case 1:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
}];
break;
case 2:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.rotationZ(M_PI).keyTime(1.0).autoreverses(YES);
}];
break;
case 3:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.translationY(200).scaleXYZ(0.2, 0.2, 1.0).rotationZ(M_PI).keyTime(1.0).autoreverses(YES);
}];
break;
```

###### SpringAnimation

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/SpringAnimation.gif">
</p>

```obj-c
case 0:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.springAnimation.mass(1).stiffness(50).damping(2).initialVelocity(10).byValue([NSValue valueWithCGSize:CGSizeMake(0, 200)]);
}];
break;
case 1:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.moreSpringAnimation(@"opacity").mass(1).stiffness(50).damping(2).initialVelocity(10).
    toValue(@0);
}];
break;
```

###### TransitionAnimation

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/TransitionAnimation.gif">
</p>

```obj-c
case 0:
{
    [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
        [self changeColor];
        founder.transition.type(kCATransitionFade).subtype(kCATransitionFromRight);
    }];
}
break;
case 1:
{
    [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
        [self changeColor];
        founder.transition.type(kCATransitionMoveIn).subtype(kCATransitionFromRight);
    }];
}
break;
case 2:
{
    [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
        [self changeColor];
        founder.transition.type(kCATransitionPush).subtype(kCATransitionFromRight);
    }];
}
break;
case 3:
{
    [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
        [self changeColor];
        founder.transition.type(kCATransitionReveal).subtype(kCATransitionFromRight);
    }];
}
break;
```

###### AnimationGroup

* 待完善。。。

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/AnimationGroup.gif">
</p>

```obj-c
case 0:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.springAnimation.mass(1).stiffness(50).damping(2).initialVelocity(10).byValue([NSValue valueWithCGSize:CGSizeMake(0, 200)]);
    founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
}];
break;
case 1:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
    [founder keyframeAnimation];
    founder.toKeyframe.opacity(0.0).keyTime(1.0).autoreverses(YES);
}];
break;
```

###### Animation_PauseAndResume

* 支持动画的暂停与继续

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/Animation_PauseAndResume.gif">
</p>

```obj-c
case 0:
[self.animationlabel.layer bin_pause];
break;
case 1:
[self.animationlabel.layer bin_resume];
break;
```

###### Animation_CompletionBlock

* 支持动画完成后回调

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/Animation_CompletionBlock.gif">
</p>

```obj-c
case 0:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
}];
break;
case 1:
{
    [self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
        founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
    } completion:^(BinAnimationInfo *animationInfo) {
        [self changeColor];
    }];
}
break;
```

###### Animation_SyncOrAsync

* 支持动画的同步与异步添加
* 对大量 layer 进行同步添加的话，会明显感觉到延迟，如果是在主线程中调用则会造成卡顿。如果是异步添加的话，会有明显改善。

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/Animation_SyncOrAsync.gif">
</p>

```obj-c
case 0:
{
    // 在同步添加的情况下，会返回所有 layer 上所添加的动画数组。
    NSArray *animationArr = [self.layerArr bin_addSameAnimation_sync:^(BinAnimationFounder *founder) {
        founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
    }];
    // animationArr: [{@"layer" : layer, @"animationArray" : animationArr}, ...]
    NSLog(@"AnimationArray: %@", animationArr);
}
break;
case 1:
[self.layerArr bin_addSameAnimation_async:^(BinAnimationFounder *founder) {
    founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
}];
break;
```

###### Animation_OneOrSome

* 添加同一个动画到多个layer上 或者 添加相同的动画到多个layer上
* 同一个动画指的是一个动画对象；相同的动画指的是多个对象，但是对象的内容相同。
* 对大量 layer 同步添加相同的动画时，会明显感觉到延迟，如果是在主线程中调用则会造成卡顿。如果是添加同一个动画的话，会有明显改善。

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/Animation_OneOrSome.gif">
</p>

```obj-c
case 0:
[self.layerArr bin_addOneAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
}];
break;
case 1:
[self.layerArr bin_addSameAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.scaleX(0.2).scaleY(0.2).keyTime(1.0).autoreverses(YES);
}];
break;
```

###### KeyframeAnimation_FromOrToOrBy

* 支持设置帧动画的第一帧以及帧的定点定位和增量定位

<p align="center">
  <img src="https://raw.githubusercontent.com/angBin/BinAnimation/master/Resources/KeyframeAnimation_FromOrToOrBy.gif">
</p>

```obj-c
case 0:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.fromKeyframe.translationY(100);
    founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
    founder.toKeyframe.translationX(200).keyTime(1.0).autoreverses(YES);
}];
break;
case 1:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
    founder.toKeyframe.translationX(200).keyTime(1.0).autoreverses(YES);
}];
break;
case 2:
[self.animationlabel.layer bin_addAnimation_sync:^(BinAnimationFounder *founder) {
    founder.toKeyframe.translationY(200).keyTime(1.0).autoreverses(YES);
    founder.byKeyframe.translationX(200).keyTime(1.0).autoreverses(YES);
}];
break;
```

#### 如何安装

* 使用 [CocoaPods](https://github.com/CocoaPods/CocoaPods) 安装。

* 在你的 Podfile 文件中添加：

```ruby
pod 'BinAnimation'
```

* 在需要使用时，引入头文件：

```obj-c
#import "BinAnimation.h"
```

## 我就是我

* “前湖阿宝” or “angBin” 
* 895887420@qq.com or wangbofchina@gmail.com
* [Blog](https://angbin.github.io/)
* [GitHub](https://github.com/angBin)
* [简书](https://www.jianshu.com/u/3d4cf9950954)
* 欢迎骚扰

## License

BinAnimation is available under the MIT license. See the LICENSE file for more info.




