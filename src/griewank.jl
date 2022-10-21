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
    p = one(eltype(x)) / 1
    @inbounds for i ∈ eachindex(x)
        s += x[i]^2
        p *= cos(x[i] / √i)
    end
    one(eltype(x)) + (one(eltype(x)) / 4000) * s - p
end
