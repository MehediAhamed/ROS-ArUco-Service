Open three terminal and navigate to scripts directory by entering this command-
```
 cd ~/aruco_service/src/aruco_service/scripts
```
In first terminal, start roscore -
# roscore

In second terminal, run the service.py-
# rosrun aruco_service generate_aruco_tags_service.py

In third terminal-
 -For generating aruco tags 
 ## rosservice call /generate_aruco_tags

 -For capturing checkerboard image-
 ## rosservice call /image_capturer

 -For camera calibration
 ## rosservice call /calibrate_camera

 -For pose estimation
 ## rosservice call /pose_estimation

 -For detecting Aruco Images
 ## rosservice call /detect_aruco_images

 -For detecting Aruco in video
 ## rosservice call /detect_aruco_video


# Additional Important Information

- You can use both webcam or realsense. Check the below part for more details

- In my linux, python3 is installed. If you don't have python3 then go to service.py and
find this line `command = "python3 generate_aruco_tags.py --id 2 --type DICT_5X5_100 -o tags/"`. Replace python3 with python. Do this thing for the rest of the commands to run 
other services.

- Do changes in `command = " "` according to below for different use cases.




# Capturing Images for camera calibration

This special image capturer is created because sometimes opencv will fail to detect chessboard corners
in the image which is the pre-requisite for camera calibration. We check whether opencv can detect the chess corners
even before capturing the image so that calibration does not fail.
```
python image_capturer.py
```
> Hold a chessboard image infront of your camera. The program will try to detect chessboard corners and if it can, it will show
it in a new window with corner overlays. Then press 's' key to save the image. The saved image will be shown in another window
and the terminal will show the count. Capture atleast 10 images from different angles for good calibration.
N.B: You cannot save image if it cannot detect the chessboard.
>When done, press ESC to quit the program.

# Calibration
The file `calibration.py` contains the code necessary for calibrating your camera. This step 
has several pre-requisites. You need to have a folder containing a set of checkerboard images 
taken using your camera. Make sure that these checkerboard images are of different poses and 
orientation. You need to provide the path to this directory and the size of the square in metres. 
You can also change the shape of the checkerboard pattern using the parameters given. Make sure this
matches with your checkerboard pattern. This code will generate two numpy files `calibration_matrix.npy` and `distortion_coefficients.npy`. These files are required to execute the next step that involves pose estimation. 
Note that the calibration and distortion numpy files given in my repository is obtained specifically for my camera 
and might not work well for yours.   

The command for running is :-  
`python calibration.py --dir images_for_cal/ --square_size 0.024`

You can find more details on other parameters using `python calibration.py --help`  


# ArUCo-Markers-Pose-Estimation-Generation-Python

This repository contains all the code you need to generate an ArucoTag,
detect ArucoTags in images and videos, and then use the detected tags
to estimate the pose of the object. In addition to this, I have also 
included the code required to obtain the calibration matrix for your 
camera.

<img src = 'Images/pose_output_image.png' width=400 height=400>

## 1. ArUCo Marker Generation
The file `generate_aruco_tags.py` contains the code for ArUCo Marker Generation.
You need to specify the type of marker you want to generate.

The command for running is :-  
`python generate_aruco_tags.py --id 24 --type DICT_5X5_100 --output tags/`

You can find more details on other parameters using `python generate_aruco_tags.py --help`

## 2. ArUCo Marker Detection
The files `detect_aruco_images.py` and `detect_aruco_video.py` contains the code for detecting
ArUCo Markers in images and videos respectively. You need to specify the path to the image or 
video file and the type of marker you want to detect.

The command for running is :-  
**For inference on images**   
`python detect_aruco_images.py --image Images/test_image_1.png --type DICT_5X5_100`  
**For inference using webcam feed**  
`python detect_aruco_video.py --camera webcam --index 0 --type DICT_5X5_100`
`python detect_aruco_video.py --camera realsense --type DICT_5X5_100`  

**For inference using video file**   
`python detect_aruco_video.py --type DICT_5X5_100  --video test.mp4`  

You can find more details on other parameters using `python detect_aruco_images.py --help`
and `python detect_aruco_video.py --help`

## 3. Pose Estimation  
The file `pose_estimation.py` contains the code that performs pose estimation after detecting the 
ArUCo markers. This is done in real-time for each frame obtained from the web-cam feed. You need to specify 
the path to the camera calibration matrix and distortion coefficients obtained from the previous step as well 
as the type for ArUCo marker you want to detect. Note that this code could be easily modified to perform 
pose estimation on images and video files.  

The command for running is :-  
`python pose_estimation.py --K_Matrix calibration_matrix.npy --D_Coeff distortion_coefficients.npy --camera webcam --index 0 --type DICT_5X5_100`  


You can find more details on other parameters using `python pose_estimation.py --help`  

## Output

<img src ='Images/output_sample.png' width = 400>  

<img src ='Images/pose_output.gif'>

### <ins>Notes</ins>
The `utils.py` contains the ArUCo Markers dictionary and the other utility function to display the detected markers.

Feel free to reach out to me in case of any issues.  
If you find this repo useful in any way please do star ⭐️ it so that others can reap it's benefits as well.

Happy Learning! Keep chasing your dreams!

## References
1. https://docs.opencv.org/4.x/d9/d6d/tutorial_table_of_content_aruco.html
2. https://docs.opencv.org/4.x/dc/dbb/tutorial_py_calibration.html
