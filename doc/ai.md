AI Note
=======

基礎
----------

[计算机视觉四大基本任务(分类、定位、检测、分割)](https://zhuanlan.zhihu.com/p/31727402)
[深度学习在计算机视觉领域（包括图像，视频，3-D点云，深度图）的应用一览](https://zhuanlan.zhihu.com/p/55747295)
[CH.Tseng分類：心得-影像分析](https://chtseng.wordpress.com/category/%E5%BF%83%E5%BE%97-%E5%BD%B1%E5%83%8F%E5%88%86%E6%9E%90/)
[使用cnn來偵測臉部](https://chtseng.wordpress.com/2018/11/04/%E4%BD%BF%E7%94%A8cnn%E4%BE%86%E5%81%B5%E6%B8%AC%E8%87%89%E9%83%A8/)
[AI 從頭學（2020 年版）](https://hemingwang.blogspot.com/2019/08/ai-2020.html?m=1)


Dlib 
----------

[Dlib 好用的的Machine learning工具](https://chtseng.wordpress.com/2016/12/23/dlib-%E5%A5%BD%E7%94%A8%E7%9A%84%E7%9A%84machine-learning%E5%B7%A5%E5%85%B7-%E4%B8%80/)
[Dlib for Android](https://github.com/tzutalin/dlib-android)
[如何用OpenCV、Python和深度學習實現面部識別](https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/500189/)
[Python 使用 face_recognition 人臉識別](https://www.itread01.com/content/1547267413.html)
[自動化產生臉部五官 VOC Dataset](https://chtseng.wordpress.com/2018/12/03/%E8%87%AA%E5%8B%95%E5%8C%96%E7%94%A2%E7%94%9F%E8%87%89%E9%83%A8%E4%BA%94%E5%AE%98-voc-dataset/)
[Android 中使用 dlib+opencv 实现动态人脸检测](https://www.cnblogs.com/lightweh/p/9815853.html)

A Simple Introduction to Facial Recognition (with Python codes)
----------

```
#Implementation in Python
# import the libraries
import os
import face_recognition

# make a list of all the available images
images = os.listdir('images')

# load your image
image_to_be_matched = face_recognition.load_image_file('my_image.jpg')

# encoded the loaded image into a feature vector
image_to_be_matched_encoded = face_recognition.face_encodings(
    image_to_be_matched)[0]

# iterate over each image
for image in images:
    # load the image
    current_image = face_recognition.load_image_file("images/" + image)
    # encode the loaded image into a feature vector
    current_image_encoded = face_recognition.face_encodings(current_image)[0]
    # match your image with the image and check if it matches
    result = face_recognition.compare_faces(
        [image_to_be_matched_encoded], current_image_encoded)
    # check if it was a match
    if result[0] == True:
        print "Matched: " + image
    else:
        print "Not matched: " + image

```

The folder structure is as follows:

facialrecognition:

fr.py
my_image.jpg
images/
barack_obama.jpg
bill_gates.jpg
jeff_bezos.jpg
mark_zuckerberg.jpg
ray_dalio.jpg
shah_rukh_khan.jpg
warren_buffett.jpg


[A Simple Introduction to Facial Recognition (with Python codes)](https://www.analyticsvidhya.com/blog/2018/08/a-simple-introduction-to-facial-recognition-with-python-codes/)




Detect face then autocrop pictures
----------


[Detect face then autocrop pictures](https://stackoverflow.com/questions/13211745/detect-face-then-autocrop-pictures)


Detect face with Delaunay Triangulation & Voronoi Diagrams
----------

![](https://chtseng.files.wordpress.com/2019/08/6700_rdk9bn1du3.png)

[Delaunay Triangulation & Voronoi Diagrams](https://chtseng.wordpress.com/2019/08/07/delaunay-triangulation-voronoi-diagrams/)

臉部識別打卡鐘-樹莓單機版
----------

[臉部識別打卡鐘-樹莓單機版](https://chtseng.wordpress.com/2019/01/11/%e8%87%89%e9%83%a8%e8%ad%98%e5%88%a5%e6%89%93%e5%8d%a1%e9%90%98-%e6%a8%b9%e8%8e%93%e5%96%ae%e6%a9%9f%e7%89%88)
