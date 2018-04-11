mutable struct apriltag_detections_t <: LCMType
  timestamp::Int64
  num_detections::Int32
  detections::Vector{apriltag_t}
end

@lcmtypesetup(apriltag_detections_t,
  detections => (num_detections,)
)
