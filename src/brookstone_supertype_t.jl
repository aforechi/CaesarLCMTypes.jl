mutable struct brookstone_supertype_t <: LCMType
  utime::Int64

  newvariable::generic_variable_t
  newfactor::generic_factor_t
  img::image_t
end

@lcmtypesetup(brookstone_supertype_t)
