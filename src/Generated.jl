#=
  @ author: ChenyuBao <chenyu.bao@outlook.com>
  @ date: 2026-02-23 21:15:12
  @ license: MIT
  @ language: Julia
  @ declaration: EtherMaths.jl is a basic Math lib on any device.
  @ description: /
 =#

export power

@generated function power(x, ::Val{N}) where {N}
    if N == 0
        return :(1)
    elseif N == 1
        return :(x)
    elseif N == 2
        return :(x * x)
    elseif N == 3
        return :(x * x * x)
    elseif N == 4
        return :(temp = x * x;
        temp * temp)
    elseif N == 5
        return :(temp = x * x;
        temp * temp * x)
    elseif N == 6
        return :(temp = x * x * x;
        temp * temp)
    elseif N == 7
        return :(temp = x * x * x;
        temp * temp * x)
    elseif N == 8
        return :(temp = x * x;
        temp = temp * temp;
        temp * temp)
    else
        expr = :(x)
        for _ in 2:N
            expr = :($expr * x)
        end
        return expr
    end
end
