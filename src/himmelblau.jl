# function himmelblau(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         s += (x[i]^2 + x[i+1] - 11)^2 + (x[i] + x[i+1]^2 - 7)^2
#     end
#     s
# end

# Slower here as no longer SIMD-able
# function himmelblau2(x)
#     s = zero(eltype(x))
#     xᵢ = x[1]
#     vᵢ = xᵢ * xᵢ
#     for i ∈ 2:length(x)
#         xᵢ₊₁ = x[i]
#         vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
#         s += (vᵢ + xᵢ₊₁ - 11)^2 + (xᵢ + vᵢ₊₁ - 7)^2
#         xᵢ = xᵢ₊₁
#         vᵢ = vᵢ₊₁
#     end
#     s
# end

function himmelblau(x)
    s = zero(eltype(x))
    @inbounds for i ∈ firstindex(x):lastindex(x)-1
        s += (x[i]^2 + x[i+1] - 11)^2 + (x[i] + x[i+1]^2 - 7)^2
    end
    s
end
