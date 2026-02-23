#=
  @ author: ChenyuBao <chenyu.bao@outlook.com>
  @ date: 2026-02-16 18:55:17
  @ license: MIT
  @ language: Julia
  @ declaration: EtherMaths.jl is a basic Math lib on any device.
  @ description: /
 =#

export NumericMean, GeometricMean, HarmonicMean, PowerMean
export mean

abstract type AbstractMean end
struct NumericMean <: AbstractMean end
struct GeometricMean <: AbstractMean end
struct HarmonicMean <: AbstractMean end
struct PowerMean{N} <: AbstractMean end

@inline function mean(::NumericMean, x)
    return reduce(+, x) / length(x)
end

@inline function mean(::NumericMean, x::Real, y::Real)
    T = promote_type(typeof(x), typeof(y))
    return (T(x) + T(y)) * T(0.5f0)
end

@inline function mean(::GeometricMean, x)
    return reduce(*, x)^(1 / length(x))
end

@inline function mean(::GeometricMean, x::Real, y::Real)
    T = promote_type(typeof(x), typeof(y))
    return sqrt(T(x) * T(y))
end

@inline function mean(::HarmonicMean, x)
    return length(x) / mapreduce(a->1/a, +, x)
end

@inline function mean(::HarmonicMean, x::Real, y::Real)
    return 2 * x * y / (x + y)
end

@inline function mean(::PowerMean{2}, x)
    return sqrt(mapreduce(a->a*a, +, x) / length(x))
end

@inline function mean(::PowerMean{N}, x) where {N}
    return (mapreduce(a->a^N, +, x) / length(x))^(1 / N)
end

@inline function mean(::PowerMean{2}, x::Real, y::Real)
    T = promote_type(typeof(x), typeof(y))
    return sqrt((x*x + y*y) * T(0.5f0))
end

@inline function mean(::PowerMean{N}, x::Real, y::Real) where {N}
    T = promote_type(typeof(x), typeof(y))
    return ((T(x)^N + T(y)^N) * T(0.5f0)) ^ (1 / N)
end
