mutable struct example_t <: LCMType
    timestamp::Int64
    position::SVector{3, Float64}
    orientation::SVector{4, Float64}
    num_ranges::Int32
    ranges::Vector{Int16}
    name::String
    enabled::Bool
end

@lcmtypesetup(example_t,
  ranges => (num_ranges,),
)
