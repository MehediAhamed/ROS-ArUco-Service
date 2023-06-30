// Auto-generated. Do not edit!

// (in-package aruco_service.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GenerateArUcoTagsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.tag_type = null;
      this.output_folder = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('tag_type')) {
        this.tag_type = initObj.tag_type
      }
      else {
        this.tag_type = '';
      }
      if (initObj.hasOwnProperty('output_folder')) {
        this.output_folder = initObj.output_folder
      }
      else {
        this.output_folder = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GenerateArUcoTagsRequest
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [tag_type]
    bufferOffset = _serializer.string(obj.tag_type, buffer, bufferOffset);
    // Serialize message field [output_folder]
    bufferOffset = _serializer.string(obj.output_folder, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GenerateArUcoTagsRequest
    let len;
    let data = new GenerateArUcoTagsRequest(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [tag_type]
    data.tag_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [output_folder]
    data.output_folder = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.tag_type);
    length += _getByteLength(object.output_folder);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'aruco_service/GenerateArUcoTagsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '053c309a2f9c891d1b57cd350d17a1e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    string tag_type
    string output_folder
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GenerateArUcoTagsRequest(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.tag_type !== undefined) {
      resolved.tag_type = msg.tag_type;
    }
    else {
      resolved.tag_type = ''
    }

    if (msg.output_folder !== undefined) {
      resolved.output_folder = msg.output_folder;
    }
    else {
      resolved.output_folder = ''
    }

    return resolved;
    }
};

class GenerateArUcoTagsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GenerateArUcoTagsResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GenerateArUcoTagsResponse
    let len;
    let data = new GenerateArUcoTagsResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'aruco_service/GenerateArUcoTagsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GenerateArUcoTagsResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: GenerateArUcoTagsRequest,
  Response: GenerateArUcoTagsResponse,
  md5sum() { return '053c309a2f9c891d1b57cd350d17a1e7'; },
  datatype() { return 'aruco_service/GenerateArUcoTags'; }
};
