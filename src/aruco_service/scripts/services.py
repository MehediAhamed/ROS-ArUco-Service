#!/usr/bin/env python3

import rospy
from std_srvs.srv import Empty
import subprocess
import traceback  

def generate_aruco_tags(request):
    command = "python3 generate_aruco_tags.py --id 2 --type DICT_5X5_100 -o tags/"

    try:
        subprocess.check_output(command, shell=True)
        rospy.loginfo("ArUCo tags generated successfully.")
        return []
    except subprocess.CalledProcessError as e:
        rospy.logerr("Error generating ArUCo tags: %s", str(e))
        rospy.logerr("Exception traceback: %s", traceback.format_exc())
        return []

def detect_aruco_images(request):
    command = "python3 detect_aruco_images.py --image Images/test_image_1.png --type DICT_5X5_100"

    try:
        subprocess.check_output(command, shell=True)
        rospy.loginfo("Detected Aruco Images successfully.")
        return []
    except subprocess.CalledProcessError as e:
        rospy.logerr("Error Detecting Aruco Images: %s", str(e))
        rospy.logerr("Exception traceback: %s", traceback.format_exc())
        return []

def detect_aruco_videos(request):
    command = "python3 detect_aruco_video.py --camera webcam --index 0 --type DICT_5X5_100"

    try:
        subprocess.check_output(command, shell=True)
        rospy.loginfo("Detected Aruco in video successfully.")
        return []
    except subprocess.CalledProcessError as e:
        rospy.logerr("Error Detecting Aruco Images: %s", str(e))
        rospy.logerr("Exception traceback: %s", traceback.format_exc())
        return []

def image_capturer(request):
    command = "python3 image_capturer.py --camera webcam --index 0 --folder images_for_cal"

    try:
        subprocess.check_output(command, shell=True)
        rospy.loginfo("Captured image successfully.")
        return []
    except subprocess.CalledProcessError as e:
        rospy.logerr("Error capturing: %s", str(e))
        rospy.logerr("Exception traceback: %s", traceback.format_exc())
        return []

def calibrate_camera(request):
    command = "python3 calibration.py --dir images_for_cal/ --square_size 0.024"

    try:
        subprocess.check_output(command, shell=True)
        rospy.loginfo("Calibrated successfully.")
        return []
    except subprocess.CalledProcessError as e:
        rospy.logerr("Error capturing: %s", str(e))
        rospy.logerr("Exception traceback: %s", traceback.format_exc())
        return []

def pose_estimation(request):
    command = "python3 pose_estimation.py --K_Matrix calibration_matrix.npy --D_Coeff distortion_coefficients.npy --camera webcam --index 0 --type DICT_5X5_100"

    try:
        subprocess.check_output(command, shell=True)
        rospy.loginfo("Pose estimated successfully.")
        return []
    except subprocess.CalledProcessError as e:
        rospy.logerr("Error capturing: %s", str(e))
        rospy.logerr("Exception traceback: %s", traceback.format_exc())
        return []

rospy.init_node('services')

generate_tags = rospy.Service('/generate_aruco_tags', Empty, generate_aruco_tags)
detect_image = rospy.Service('/detect_aruco_images', Empty, detect_aruco_images)
detect_video = rospy.Service('/detect_aruco_video', Empty, detect_aruco_videos)
capture_image = rospy.Service('/image_capturer', Empty, image_capturer)
calibration = rospy.Service('/calibrate_camera', Empty, calibrate_camera)
pose = rospy.Service('/pose_estimation', Empty, pose_estimation)



rospy.spin()
