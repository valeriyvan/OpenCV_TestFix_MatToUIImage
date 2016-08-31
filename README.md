# OpenCV_TestFix_MatToUIImage
Recently I have proposed [this](https://github.com/opencv/opencv/pull/7201) slight optimisaion to OpenCV function MatToUIImageApp.

To run this test you have first compile OpenCV framework from source with help of `build_framework.py` script and drag it into cloned xCode project. Can't push ready to test project as framework built has file greater that 100MB:
![screenshot](https://cloud.githubusercontent.com/assets/1630974/18140790/b455e9e0-6fbf-11e6-98e1-43136ec8b02c.png)
Never run into this limitation and even haven't known about it.

Unfortunately this test project shows proposed implementation is incorrect:
![img_1105](https://cloud.githubusercontent.com/assets/1630974/18140207/2325c0b4-6fbd-11e6-9cfc-5a6a49ecf05f.png)

What was expected:
![img_1106](https://cloud.githubusercontent.com/assets/1630974/18140206/2323b242-6fbd-11e6-9137-e3eea17f4ea1.png)

Negative result is also result. Now I am closing pull requst in the subject. Have to thank [@terfendail](https://github.com/terfendail) which have drawn my attention saying that proposed optimisation might change function behaviour.
