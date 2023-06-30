; Auto-generated. Do not edit!


(cl:in-package aruco_service-srv)


;//! \htmlinclude GenerateArUcoTags-request.msg.html

(cl:defclass <GenerateArUcoTags-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (tag_type
    :reader tag_type
    :initarg :tag_type
    :type cl:string
    :initform "")
   (output_folder
    :reader output_folder
    :initarg :output_folder
    :type cl:string
    :initform ""))
)

(cl:defclass GenerateArUcoTags-request (<GenerateArUcoTags-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GenerateArUcoTags-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GenerateArUcoTags-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aruco_service-srv:<GenerateArUcoTags-request> is deprecated: use aruco_service-srv:GenerateArUcoTags-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <GenerateArUcoTags-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_service-srv:id-val is deprecated.  Use aruco_service-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'tag_type-val :lambda-list '(m))
(cl:defmethod tag_type-val ((m <GenerateArUcoTags-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_service-srv:tag_type-val is deprecated.  Use aruco_service-srv:tag_type instead.")
  (tag_type m))

(cl:ensure-generic-function 'output_folder-val :lambda-list '(m))
(cl:defmethod output_folder-val ((m <GenerateArUcoTags-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_service-srv:output_folder-val is deprecated.  Use aruco_service-srv:output_folder instead.")
  (output_folder m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GenerateArUcoTags-request>) ostream)
  "Serializes a message object of type '<GenerateArUcoTags-request>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tag_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tag_type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_folder))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_folder))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GenerateArUcoTags-request>) istream)
  "Deserializes a message object of type '<GenerateArUcoTags-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tag_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tag_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output_folder) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'output_folder) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GenerateArUcoTags-request>)))
  "Returns string type for a service object of type '<GenerateArUcoTags-request>"
  "aruco_service/GenerateArUcoTagsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GenerateArUcoTags-request)))
  "Returns string type for a service object of type 'GenerateArUcoTags-request"
  "aruco_service/GenerateArUcoTagsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GenerateArUcoTags-request>)))
  "Returns md5sum for a message object of type '<GenerateArUcoTags-request>"
  "053c309a2f9c891d1b57cd350d17a1e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GenerateArUcoTags-request)))
  "Returns md5sum for a message object of type 'GenerateArUcoTags-request"
  "053c309a2f9c891d1b57cd350d17a1e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GenerateArUcoTags-request>)))
  "Returns full string definition for message of type '<GenerateArUcoTags-request>"
  (cl:format cl:nil "int32 id~%string tag_type~%string output_folder~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GenerateArUcoTags-request)))
  "Returns full string definition for message of type 'GenerateArUcoTags-request"
  (cl:format cl:nil "int32 id~%string tag_type~%string output_folder~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GenerateArUcoTags-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'tag_type))
     4 (cl:length (cl:slot-value msg 'output_folder))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GenerateArUcoTags-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GenerateArUcoTags-request
    (cl:cons ':id (id msg))
    (cl:cons ':tag_type (tag_type msg))
    (cl:cons ':output_folder (output_folder msg))
))
;//! \htmlinclude GenerateArUcoTags-response.msg.html

(cl:defclass <GenerateArUcoTags-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GenerateArUcoTags-response (<GenerateArUcoTags-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GenerateArUcoTags-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GenerateArUcoTags-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aruco_service-srv:<GenerateArUcoTags-response> is deprecated: use aruco_service-srv:GenerateArUcoTags-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GenerateArUcoTags-response>) ostream)
  "Serializes a message object of type '<GenerateArUcoTags-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GenerateArUcoTags-response>) istream)
  "Deserializes a message object of type '<GenerateArUcoTags-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GenerateArUcoTags-response>)))
  "Returns string type for a service object of type '<GenerateArUcoTags-response>"
  "aruco_service/GenerateArUcoTagsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GenerateArUcoTags-response)))
  "Returns string type for a service object of type 'GenerateArUcoTags-response"
  "aruco_service/GenerateArUcoTagsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GenerateArUcoTags-response>)))
  "Returns md5sum for a message object of type '<GenerateArUcoTags-response>"
  "053c309a2f9c891d1b57cd350d17a1e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GenerateArUcoTags-response)))
  "Returns md5sum for a message object of type 'GenerateArUcoTags-response"
  "053c309a2f9c891d1b57cd350d17a1e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GenerateArUcoTags-response>)))
  "Returns full string definition for message of type '<GenerateArUcoTags-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GenerateArUcoTags-response)))
  "Returns full string definition for message of type 'GenerateArUcoTags-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GenerateArUcoTags-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GenerateArUcoTags-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GenerateArUcoTags-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GenerateArUcoTags)))
  'GenerateArUcoTags-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GenerateArUcoTags)))
  'GenerateArUcoTags-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GenerateArUcoTags)))
  "Returns string type for a service object of type '<GenerateArUcoTags>"
  "aruco_service/GenerateArUcoTags")