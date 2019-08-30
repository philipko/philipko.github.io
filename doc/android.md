Android Note
=======




adb
----------

If you can’t figure out which one is the intended device, type below command to print device information.

```
adb devices -l
```



Type below command to restart the adb in tcpip mode for the device.

```

adb -s <device id> tcpip 5555

```


Other command list

```
adb tcpip 5555
adb connect 192.168.xx.xx
adb connect 192.X.X.X:5555 
```

adb over wifi

```
adb tcpip 5555
adb connect 192.X.X.X:5555 
```

[adb 透過 Wi-Fi 連線裝置](http://blog.tonycube.com/2017/02/adb-wi-fi.html)

Good example
----------

![](https://miro.medium.com/max/270/1*GAYx17bxmMVODkpveipEmA.gif)

[googleplusdemo like linkdln GUI](https://github.com/TonyTangAndroid/GooglePlusDemo)
[Integrate CoordinatorLayout + BottomNavigationView + Toolbar + TabLayout + ViewPager + Fragment + DrawerLayout](https://medium.com/@tonythompsoncmu/integrate-coordinatorlayout-bottomnavigationview-toolbar-tablayout-viewpager-fragment-e4268e83b475)

![](https://camo.githubusercontent.com/04574b760fa41cc2fb92321c0fd9480e7eb580b5/68747470733a2f2f696d6775722e636f6d2f4d4e34737a4f362e706e67)

[Bottom Navigation Views](https://github.com/codepath/android_guides/wiki/Bottom-Navigation-Views)

Android open project
----------

[Android open project](https://github.com/Trinea/android-open-project)
[RecyclerViewPager](https://github.com/lsjwzh/RecyclerViewPager)


Bottom Navigation 
----------
[Hide/Show bottomNavigationView on Scroll](https://stackoverflow.com/questions/44777869/hide-show-bottomnavigationview-on-scroll/44779186#44779186)
[Hide top and bottom toolbars when using CoordinatorLayout](https://stackoverflow.com/questions/39718242/hide-top-and-bottom-toolbars-when-using-coordinatorlayout)
[github example](https://github.com/rifanalam/retrofit-recycler-view)
[Android Bottom Navigation Activity With RecyclerView Data Populated By Retrofit2 and Load images by Glide](http://androidboss.info/2017/05/25/android-bottom-navigation-activity-with-recyclerview-data-populated-by-retrofit2-and-load-images-by-glide/)


NestedScrollView and Recyclerview 
----------

[NestedScrollView代替了ScrollView，他们两个都可以用来跟ToolBar交互，实现上拉下滑中ToolBar的变化](https://blog.csdn.net/wolfking0608/article/details/78758956)
[How to use RecyclerView inside NestedScrollView](https://stackoverflow.com/questions/31000081/how-to-use-recyclerview-inside-nestedscrollview)
[NestedScrollView+RecyclerView优雅的解决滑动冲突问题](https://www.jianshu.com/p/791c0a4acc1c)

[NestedScrollView + SwipeRefreshLayout + RecyclerView](https://gist.github.com/kamikat/2ba5f741f807d56a8dd7cf936571e69e)



Recyclerview Library
----------

[MultiType multiple types of RecyclerViews](https://github.com/drakeet/MultiType)



Android Studio Template
----------

[RecyclerViewTemplate](https://github.com/TakeoffAndroid/RecyclerViewTemplate?source=post_page-----a8b6d4925f3f----------------------)

