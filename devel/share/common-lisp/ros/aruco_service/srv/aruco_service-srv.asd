
(cl:in-package :asdf)

(defsystem "aruco_service-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GenerateArUcoTags" :depends-on ("_package_GenerateArUcoTags"))
    (:file "_package_GenerateArUcoTags" :depends-on ("_package"))
  ))