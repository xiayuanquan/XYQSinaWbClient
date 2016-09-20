# XYQSinaWbClient
仿写新浪微博客户端
==================

介绍：
----

    苹果内置的UITabBarController虽然可以很好实现一些常见的框架的搭建，但是对于一些特别的却不行，例如新浪微博等，需要自定义，比较麻烦。现成的，使用第三方框架CYLTabBarController仿写新浪微博，差不多还是很轻巧的。

思想：
----

    新浪微博客户端的设计架构模式既可以采用MVC,也可以是MVVM，后者无非是再次对控制器进行一次瘦身，将额外的逻辑处理代码提取出来，
    单独放到一个ViewModel层中。好处当然是耦合性更低了，以后不需要因为view的变化而导致ViewContrller变动太大。
    我仿写这个客户端，主要采用的是MVC模式，由于时间紧张，只是粗略的写了主页这一部分，以后时间后面的再补上。
     
    现在我来讲讲主页的实现方法：
    1、首先去新浪微博开发者平台注册账号，完成一些信息设置；
    2、这些操作完成了，开始写代码了，在AppDelegate类中通过UIWebView的代理方法对新浪微博进行授权，获取用户信息；
    3、获取用户信息就采用AFNetworking框架即可，用它来访问新浪微博的接口，返回json数据进行解析；
    4、拿到了用户信息，剩下的操作就是View层的显示了，也即图文混排。这个才是重点，那么如何高效的实现图文混排呢？
       也许你会想着使用第三方框架，我感觉没必要，还是自己写写吧。我采用的建模型的方法：首先分别建立一个data Model和
       data FrameModel，然后给每一个data Model拥有一个data FrameModel，这样一来所有的frame布局全在data FrameMode类中去实现。
       拿到数据的同时，就已经给对应的data布局好了Frame，渲染的效果还是不错的。

### 客户端首页截图：

![image](https://github.com/xiayuanquan/XYQSinaWbClient/blob/master/XYQSinaWbClient/screenshots/main.png)
