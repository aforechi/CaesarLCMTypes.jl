__precompile__()

module CaesarLCMTypes

using LCMCore
using StaticArrays: SVector

export apriltag_detections_t,
apriltag_t,
point_cloud_t,
pose_node_t,
pose_pose_nh_t,
pose_pose_xyh_nh_t,
pose_pose_xyh_t,
prior_zpr_t

include("atlas_command_t.jl")
include("apriltag_detections_t.jl")
include("apriltag_t.jl")
include("point_cloud_t.jl")
include("pose_node_t.jl")
include("pose_pose_nh_t.jl")
include("pose_pose_xyh_nh_t.jl")
include("pose_pose_xyh_t.jl")
include("prior_zpr_t.jl")

end
