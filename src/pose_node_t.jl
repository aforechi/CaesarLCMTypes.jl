mutable struct pose_node_t <: LCMType
  utime::Int64   # unix time associated with this pose
  id::Int64      # pose id (sequential, 0-based)
  mean_dim::Int32       # default will be 7 (3+4)
  mean::Vector{Float64} # default will be [x y z qw qx qy qz]
  covar_dim::Int32      # usually x y z yaw pitch roll (RotXYZ)
  covar::Vector{Float64}
end

@lcmtypesetup(pose_node_t,
  mean => (mean_dim,),
  covar => (covar_dim,)
)
