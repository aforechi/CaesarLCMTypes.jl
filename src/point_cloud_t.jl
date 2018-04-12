mutable struct point_cloud_t <: LCMType
  utime::Int64       # unix time associated with this cloud
  id::Int64       # root pose id (sequential, 0-based)

  n::Int32           # number of points in the cloud
  points::Array{Float64,2} # [n][3] points (relative to the root pose)
  colors::Array{UInt8,2}     # [n][3] point colors (rgb)
end

@lcmtypesetup(point_cloud_t,
  points => (n, 3),
  colors => (n, 3)
)
