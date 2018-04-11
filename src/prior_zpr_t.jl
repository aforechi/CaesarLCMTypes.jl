mutable struct prior_zpr_t <: LCMType
  utime::Int64 # unix time associated with this pose
  id::Int64    # pose id (sequential, 0-based)

  z::Float64
  pitch::Float64
  roll::Float64

  var_z::Float64
  var_pitch::Float64
  var_roll::Float64
end

@lcmtypesetup(prior_zpr_t)
