# __precompile__()

module CaesarLCMTypes

using LCMCore
using StaticArrays: SVector, SMatrix

export
  apriltag_detections_t,
  apriltag_t,
  image_t,
  image_metadata_t,
  point_cloud_t,
  pose_node_t,
  pose_pose_nh_t,
  pose_pose_xyh_nh_t,
  pose_pose_xyh_t,
  prior_zpr_t,
  example_t,
  generic_variable_t,
  generic_factor_t,
  brookstone_supertype_t

include("apriltag_t.jl")
include("apriltag_detections_t.jl")
include("image_metadata_t.jl")
include("image_t.jl")
include("point_cloud_t.jl")
include("pose_node_t.jl")
include("pose_pose_nh_t.jl")
include("pose_pose_xyh_nh_t.jl")
include("pose_pose_xyh_t.jl")
include("prior_zpr_t.jl")
include("example_t.jl")

# generic types for robots of any variety -- can add separate optimizations.
include("generic_variable_t.jl")
include("generic_factor_t.jl")

# supertypes
include("brookstone_supertype_t.jl")


end
