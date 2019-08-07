AI Note
=======


Dlib 
----------

[Dlib 好用的的Machine learning工具](https://chtseng.wordpress.com/2016/12/23/dlib-%E5%A5%BD%E7%94%A8%E7%9A%84%E7%9A%84machine-learning%E5%B7%A5%E5%85%B7-%E4%B8%80/)
[Dlib for Android](https://github.com/tzutalin/dlib-android)
[如何用OpenCV、Python和深度學習實現面部識別](https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/500189/)


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
