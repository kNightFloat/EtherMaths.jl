#=
  @ author: ChenyuBao <chenyu.bao@outlook.com>
  @ date: 2025-12-07 21:01:28
  @ license: MIT
  @ language: Julia
  @ declaration: EtherMaths.jl is a basic Math lib on any device.
  @ description: main file
 =#

module EtherMaths

export unsafe_real

#= NOTE:
    As on device, error handling is usaully not supported.
    Thus, all functions with "unsafe_" prefix means no error handling inside.
    Type conversion functions are unsafe by default.
    Here, `unsafe_real` provides a unified interface to convert Real numbers between different types.
    This problem quite annoys me during the whole 2025 year's Spring Festival.
    Luckily, I found the solution in the issue: see [link](https://github.com/JuliaGPU/oneAPI.jl/issues/441).
    Love from ChenyuBao to open-source community and Julia's developers.
=#

@inline function unsafe_real(T::Type{<:AbstractFloat}, x::Real)::T
    return T(x)
end

@inline function unsafe_real(T::Type{<:Integer}, x::Integer)::T
    return T(x)
end

@inline function unsafe_real(T::Type{<:Integer}, x::AbstractFloat)::T
    return unsafe_trunc(T, floor(x))
end

end # module EtherMaths
