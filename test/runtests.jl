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
    @testset "unsafe_real" begin
        type_vec = [Int32, Int64, Float32, Float64]
        for T1 in type_vec, T2 in type_vec
            for x in [-2.5, 0, 3.7]
                @test unsafe_real(T1, unsafe_real(T2, x)) isa T1
            end
        end
    end
    @testset "Generated" begin
        for N in [1,2,3,4,5,6,7,8]
            @test power(2.0f0, Val(N)) == 2.0f0^N
        end
    end
    @testset "Mean" begin
        x = 3.0f0
        y = 4.0f0
        @test mean(NumericMean(), x, y) == 3.5f0
        @test mean(GeometricMean(), x, y) == sqrt(12.0f0)
        @test mean(HarmonicMean(), x, y) == 24.0f0 / 7.0f0
        @test mean(PowerMean{2}(), x, y) == sqrt(12.5f0)
        list = []
        for Mean in [HarmonicMean(), GeometricMean(), NumericMean(), PowerMean{2}(), PowerMean{3}()]
            push!(list, mean(Mean, 6.0f0, 5.0f0))
        end
        @test all(list[1:end-1] .< list[2:end])
    end
end
