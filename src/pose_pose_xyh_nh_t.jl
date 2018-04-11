mutable struct pose_pose_xyh_nh_t <: LCMType
  utime::Int64        # unix time associated with this pose

  node_1_utime::Int64 # pose 1 (source) utime
  node_1_id::Int64    # pose 1 id

  node_2_utime::Int64 # pose 2 (destination) utime
  node_2_id::Int64    # pose 2 id

  delta_x::Float64
  delta_y::Float64
  delta_yaw::Float64

  var_x::Float64
  var_y::Float64
  var_yaw::Float64

  confidence::Float64
end

@lcmtypesetup(pose_pose_xyh_nh_t)
