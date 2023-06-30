;; Auto-generated. Do not edit!


(when (boundp 'aruco_service::GenerateArUcoTags)
  (if (not (find-package "ARUCO_SERVICE"))
    (make-package "ARUCO_SERVICE"))
  (shadow 'GenerateArUcoTags (find-package "ARUCO_SERVICE")))
(unless (find-package "ARUCO_SERVICE::GENERATEARUCOTAGS")
  (make-package "ARUCO_SERVICE::GENERATEARUCOTAGS"))
(unless (find-package "ARUCO_SERVICE::GENERATEARUCOTAGSREQUEST")
  (make-package "ARUCO_SERVICE::GENERATEARUCOTAGSREQUEST"))
(unless (find-package "ARUCO_SERVICE::GENERATEARUCOTAGSRESPONSE")
  (make-package "ARUCO_SERVICE::GENERATEARUCOTAGSRESPONSE"))

(in-package "ROS")





(defclass aruco_service::GenerateArUcoTagsRequest
  :super ros::object
  :slots (_id _tag_type _output_folder ))

(defmethod aruco_service::GenerateArUcoTagsRequest
  (:init
   (&key
    ((:id __id) 0)
    ((:tag_type __tag_type) "")
    ((:output_folder __output_folder) "")
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _tag_type (string __tag_type))
   (setq _output_folder (string __output_folder))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:tag_type
   (&optional __tag_type)
   (if __tag_type (setq _tag_type __tag_type)) _tag_type)
  (:output_folder
   (&optional __output_folder)
   (if __output_folder (setq _output_folder __output_folder)) _output_folder)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; string _tag_type
    4 (length _tag_type)
    ;; string _output_folder
    4 (length _output_folder)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; string _tag_type
       (write-long (length _tag_type) s) (princ _tag_type s)
     ;; string _output_folder
       (write-long (length _output_folder) s) (princ _output_folder s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _tag_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tag_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _output_folder
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _output_folder (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass aruco_service::GenerateArUcoTagsResponse
  :super ros::object
  :slots ())

(defmethod aruco_service::GenerateArUcoTagsResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass aruco_service::GenerateArUcoTags
  :super ros::object
  :slots ())

(setf (get aruco_service::GenerateArUcoTags :md5sum-) "053c309a2f9c891d1b57cd350d17a1e7")
(setf (get aruco_service::GenerateArUcoTags :datatype-) "aruco_service/GenerateArUcoTags")
(setf (get aruco_service::GenerateArUcoTags :request) aruco_service::GenerateArUcoTagsRequest)
(setf (get aruco_service::GenerateArUcoTags :response) aruco_service::GenerateArUcoTagsResponse)

(defmethod aruco_service::GenerateArUcoTagsRequest
  (:response () (instance aruco_service::GenerateArUcoTagsResponse :init)))

(setf (get aruco_service::GenerateArUcoTagsRequest :md5sum-) "053c309a2f9c891d1b57cd350d17a1e7")
(setf (get aruco_service::GenerateArUcoTagsRequest :datatype-) "aruco_service/GenerateArUcoTagsRequest")
(setf (get aruco_service::GenerateArUcoTagsRequest :definition-)
      "int32 id
string tag_type
string output_folder
---

")

(setf (get aruco_service::GenerateArUcoTagsResponse :md5sum-) "053c309a2f9c891d1b57cd350d17a1e7")
(setf (get aruco_service::GenerateArUcoTagsResponse :datatype-) "aruco_service/GenerateArUcoTagsResponse")
(setf (get aruco_service::GenerateArUcoTagsResponse :definition-)
      "int32 id
string tag_type
string output_folder
---

")



(provide :aruco_service/GenerateArUcoTags "053c309a2f9c891d1b57cd350d17a1e7")


