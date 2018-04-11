mutable struct pose_pose_nh_t  <: LCMType
  utime::Int64         # unix time associated with this factor

  node_1_utime::Int64  # pose 1 (source) utime
  node_1_id::Int64     # pose 1 id

  node_2_utime::Int64  # pose 2 (destination) utime
  node_2_id::Int64     # pose 2 id

  mean_dim::Int32       # default will be 7 (3+4)
  mean::Vector{Float64} # default will be [x y z qw qx qy qz]

  covar_dim::Int32
  covar::Vector{Float64} # usually x y z yaw pitch roll (RotXYZ)
  confidence::Float64    # the confidence value for the "valid factor" hypothesis
end

@lcmtypesetup(pose_pose_nh_t,
  mean => (mean_dim,),
  covar => (covar_dim,)
)
