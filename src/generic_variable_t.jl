mutable struct generic_variable_t <: LCMCore.LCMType
  utime::Int64

  variablelabel::String
  variabletype::String

  datadescription::String
  datalength::Int32
  data::Vector{UInt8}
end

@lcmtypesetup(generic_variable_t,
  data => (datalength,),
)
