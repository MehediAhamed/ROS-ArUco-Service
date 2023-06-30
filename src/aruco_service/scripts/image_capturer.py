
'''
python image_capturer.py --camera webcam --index 0 --folder images_for_cal
python image_capturer.py --camera realsense --folder images_for_cal

'''
import cv2
import argparse
import time
import sys
import pyrealsense2 as rs


ap = argparse.ArgumentParser()
ap.add_argument("-c", "--camera", type=str, default="webcam", help="Camera to use: 'webcam' or 'realsense'")
ap.add_argument("-i", "--index", type=int, default=0, help="0 for first plugged in camera, 1 for the next one")
ap.add_argument("-f", "--folder", type=str, default="images_for_cal", help="Folder to save captured images")
args = vars(ap.parse_args())

camera_index_no=args["index"]

if args["camera"].lower() == "webcam":
    cap = cv2.VideoCapture(camera_index_no)
    time.sleep(2.0)

elif args["camera"].lower() == "realsense":
    pipeline = rs.pipeline()
    config = rs.config()
    config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
    pipeline.start(config)

else:
    print(f"Invalid camera type '{args['camera']}'")
    sys.exit(1)

counter = 0
folder = args["folder"]

# in a 8x8 chessboard, we detect the inner corners, so 7x7. 
chessboardSize = (7,7)

# criteria for detecting chesscblocks
criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)

while True:
    if args["camera"].lower() == "webcam":
        success, img = cap.read()

    elif args["camera"].lower() == "realsense":
        frames = pipeline.wait_for_frames()
        color_frame = frames.get_color_frame()
        img = np.asanyarray(color_frame.get_data())

    cv2.imshow('img', img)
    k = cv2.waitKey(1)

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    ret, corners = cv2.findChessboardCorners(gray, chessboardSize, None)

    if ret:
        temp_img = img.copy()
        corners2 = cv2.cornerSubPix(gray, corners, (11, 11), (-1, -1), criteria)
        cv2.drawChessboardCorners(temp_img, chessboardSize, corners2, ret)
        cv2.imshow('Detected image', temp_img)

    if k == 27:
        break

    elif k == ord('s'):
        cv2.imwrite(f'{folder}/Image_{counter}.png', img)
        print(f"Image {counter} saved!")
        counter += 1
        cv2.imshow('Saved image', img)

cap.release()
cv2.destroyAllWindows()

if args["camera"].lower() == "realsense":
    pipeline.stop()
