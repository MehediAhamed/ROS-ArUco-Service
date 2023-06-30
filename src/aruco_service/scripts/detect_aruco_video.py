
'''
Sample Command:-
python detect_aruco_video.py --camera webcam --index 0 --type DICT_5X5_100
python detect_aruco_video.py --camera realsense --type DICT_5X5_100
python detect_aruco_video.py --type DICT_5X5_100  --video test.mp4
'''

import numpy as np
from utils import ARUCO_DICT, aruco_display
import argparse
import time
import cv2
import sys
import pyrealsense2 as rs


ap = argparse.ArgumentParser()
ap.add_argument("-c", "--camera", type=str, default="webcam", help="Camera to use: 'webcam' or 'realsense'")
ap.add_argument("-i", "--index", type=int, default=0, help="0 for first plugged in camera, 1 for the next one")
ap.add_argument("-v", "--video", help="Path to the video file")
ap.add_argument("-t", "--type", type=str, default="DICT_ARUCO_ORIGINAL", help="Type of ArUCo tag to detect")
args = vars(ap.parse_args())

camera_index_no=args["index"]

if args["camera"].lower() == "webcam":
    video = cv2.VideoCapture(camera_index_no)
    time.sleep(2.0)

elif args["camera"].lower() == "realsense":
    pipeline = rs.pipeline()
    config = rs.config()
    config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
    pipeline.start(config)

else:
    print(f"Invalid camera type '{args['camera']}'")
    sys.exit(1)

if args["video"] is not None:
    video = cv2.VideoCapture(args["video"])

if ARUCO_DICT.get(args["type"], None) is None:
    print(f"ArUCo tag type '{args['type']}' is not supported")
    sys.exit(1)

arucoDict = cv2.aruco.getPredefinedDictionary(ARUCO_DICT[args["type"]])
arucoParams = cv2.aruco.DetectorParameters()

while True:
    if args["camera"].lower() == "webcam":
        ret, frame = video.read()
        if ret is False:
              break

    
      
    elif args["camera"].lower() == "realsense":
        frames = pipeline.wait_for_frames()
        color_frame = frames.get_color_frame()
        frame = np.asanyarray(color_frame.get_data())

    else:
        break

    h, w, _ = frame.shape
    width = 1000
    height = int(width * (h / w))
    frame = cv2.resize(frame, (width, height), interpolation=cv2.INTER_CUBIC)
    corners, ids, rejected = cv2.aruco.detectMarkers(frame, arucoDict, parameters=arucoParams)

    detected_markers = aruco_display(corners, ids, rejected, frame)

    cv2.imshow("Image", detected_markers)

    key = cv2.waitKey(1) & 0xFF
    if key == ord("q"):
        break

cv2.destroyAllWindows()
video.release()

if args["camera"].lower() == "realsense":
    pipeline.stop()
