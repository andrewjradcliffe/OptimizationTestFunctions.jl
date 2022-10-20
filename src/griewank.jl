#
# Date created: 2022-10-18
# Author: aradclif
#
#
############################################################################################
# function griewank(x)
#     s = zero(eltype(x))
#     p = one(eltype(x))
#     for i ∈ eachindex(x)
#         xᵢ = x[i]
#         s += xᵢ * xᵢ
#         p *= cos(xᵢ / √i)
#     end
#     one(eltype(x)) + (1/4000) * s - p
# end

function griewank(x)
    s = zero(eltype(x))
    p = one(eltype(x))
    for i ∈ eachindex(x)
        s += x[i]^2
        p *= cos(x[i] / √i)
    end
    one(eltype(x)) + (1/4000) * s - p
end
