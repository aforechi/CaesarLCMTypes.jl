mutable struct generic_factor_t <: LCMCore.LCMType
  utime::Int64

  numvariables::Int32
  variablelabels::Vector{String}

  factortype::String

  # additional payload for generic user
  datadescription::String
  datalength::Int32
  data::Vector{UInt8}
end

@lcmtypesetup(generic_factor_t,
  data => (datalength,),
  variablelabels => (numvariables,),
)
