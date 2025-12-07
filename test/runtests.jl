#=
  @ author: ChenyuBao <chenyu.bao@outlook.com>
  @ date: 2025-12-07 21:47:43
  @ license: MIT
  @ language: Julia
  @ declaration: EtherMaths.jl is a basic Math lib on any device.
  @ description: /
 =#

using Test
using EtherMaths

@testset "unsafe_real" begin
    type_vec = [Int32, Int64, Float32, Float64]
    for T1 in type_vec, T2 in type_vec
        for x in [-2.5, 0, 3.7]
            @test unsafe_real(T1, unsafe_real(T2, x)) isa T1
        end
    end
end
