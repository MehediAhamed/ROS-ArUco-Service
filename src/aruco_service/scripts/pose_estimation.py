
'''
Sample Usage:-
python pose_estimation.py --K_Matrix calibration_matrix.npy --D_Coeff distortion_coefficients.npy --camera webcam --index 0 --type DICT_5X5_100
'''

import numpy as np
import cv2
import sys
from utils import ARUCO_DICT
import argparse
import time
import pyrealsense2 as rs


def pose_estimation(frame, aruco_dict_type, matrix_coefficients, distortion_coefficients):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    cv2.aruco_dict = cv2.aruco.getPredefinedDictionary(aruco_dict_type)
    parameters = cv2.aruco.DetectorParameters()

    corners, ids, rejected_img_points = cv2.aruco.detectMarkers(gray, cv2.aruco_dict, parameters=parameters)

    ids_list = []        # List to store the IDs of detected markers
    distances = []       # List to store the distances from the camera
    coordinates = []     # List to store the 3D coordinates of markers

    if len(corners) > 0:
        for i in range(0, len(ids)):
            rvec, tvec, markerPoints = cv2.aruco.estimatePoseSingleMarkers(corners[i], 0.02, matrix_coefficients,
                                                                           distortion_coefficients)
            cv2.aruco.drawDetectedMarkers(frame, corners)
            cv2.drawFrameAxes(frame, matrix_coefficients, distortion_coefficients, rvec, tvec, 0.01)

            ids_list.append(ids[i][0])

            # Calculate the distance from the camera to the marker
            # The distance is the norm of the translation vector (tvec)
            distance = np.linalg.norm(tvec)
            distances.append(distance)

            coordinates.append(tvec[0][0])

    return frame, ids_list, distances, coordinates



if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument("-k", "--K_Matrix", required=True, help="Path to calibration matrix (numpy file)")
    ap.add_argument("-d", "--D_Coeff", required=True, help="Path to distortion coefficients (numpy file)")
    ap.add_argument("-c", "--camera", type=str, default="webcam", help="Camera to use for ArUco detection: 'webcam' or 'realsense'")
    ap.add_argument("-i", "--index", type=int, default=0, help="0 for first plugged in camera, 1 for the next one")
    ap.add_argument("-t", "--type", type=str, default="DICT_ARUCO_ORIGINAL", help="Type of ArUCo tag to detect")
    args = vars(ap.parse_args())

    if ARUCO_DICT.get(args["type"], None) is None:
        print(f"ArUCo tag type '{args['type']}' is not supported")
        sys.exit(0)

    aruco_dict_type = ARUCO_DICT[args["type"]]
    calibration_matrix_path = args["K_Matrix"]
    distortion_coefficients_path = args["D_Coeff"]
    camera_type = args["camera"]
    camera_index_no=args["index"]

    k = np.load(calibration_matrix_path)
    d = np.load(distortion_coefficients_path)

    

    if camera_type == "webcam":
        video = cv2.VideoCapture(camera_index_no)
    elif camera_type == "realsense":
        pipeline = rs.pipeline()
        config = rs.config()
        config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
        pipeline.start(config)
    else:
        print(f"Invalid camera type '{camera_type}'")
        sys.exit(0)

    while True:
        if camera_type == "webcam":
            ret, frame = video.read()
        elif camera_type == "realsense":
            frames = pipeline.wait_for_frames()
            color_frame = frames.get_color_frame()
            frame = np.asanyarray(color_frame.get_data())

        if not ret:
            break

        output, ids, distances, coordinates = pose_estimation(frame, aruco_dict_type, k, d)

        for i in range(len(ids)):
            distance_cm = distances[i] * 100  # Convert distance from meters to centimeters
            cv2.putText(output, f"ID: {ids[i]}", (10, 30 + i*30), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
            cv2.putText(output, f"Distance: {distance_cm:.2f} cm", (10, 60 + i*30), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
            cv2.putText(output, f"Coordinates: ({coordinates[i][0]:.2f}, {coordinates[i][1]:.2f}, {coordinates[i][2]:.2f})", (10, 90 + i*30), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)

        cv2.imshow('Estimated Pose', output)

        key = cv2.waitKey(1) & 0xFF
        if key == ord('q'):
            break

    if camera_type == "webcam":
        video.release()
    elif camera_type == "realsense":
        pipeline.stop()

    cv2.destroyAllWindows()
