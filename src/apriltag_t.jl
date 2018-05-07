mutable struct apriltag_t <: LCMType
  id::Int32
  hammingDistance::Int32
  p::SMatrix{4,2,Float64}
  cxy::SVector{2, Float64}
  homography::SMatrix{3,3,Float64}
  pose::SMatrix{4,4,Float64}
  familyName::String
end

@lcmtypesetup(apriltag_t)
