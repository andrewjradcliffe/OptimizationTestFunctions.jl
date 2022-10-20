# function levi_13(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         v = sin(3π * x[i])
#         w = sin(3π * x[i+1])
#         u = sin(2π * x[i+1])
#         s += v * v + (x[i] - 1)^2 * (1 + w * w) + (x[i+1] - 1)^2 * (1 + u * u)
#     end
#     s
# end

# Faster due to fewer special function calls
function levi_13(x)
    s = zero(eltype(x))
    xᵢ = x[1]
    v = sin(3π * xᵢ)
    for i ∈ 2:length(x)
        xᵢ₊₁ = x[i]
        w = sin(3π * xᵢ₊₁)
        u = sin(2π * xᵢ₊₁)
        s += v * v + (xᵢ - 1)^2 * (1 + w * w) + (xᵢ₊₁ - 1)^2 * (1 + u * u)
        xᵢ = xᵢ₊₁
        v = w
    end
    s
end

# # Essentially the same as above
# function levi_13_4(x)
#     s = zero(eltype(x))
#     xᵢ = x[1]
#     v = sin(3π * xᵢ)
#     v² = v * v
#     Δxᵢ² = (xᵢ - 1)^2
#     for i ∈ 2:length(x)
#         xᵢ₊₁ = x[i]
#         w = sin(3π * xᵢ₊₁)
#         w² = w * w
#         Δxᵢ₊₁² = (xᵢ₊₁ - 1)^2
#         u = sin(2π * xᵢ₊₁)
#         s += v² + Δxᵢ² * (1 + w²) + Δxᵢ₊₁² * (1 + u * u)
#         xᵢ = xᵢ₊₁
#         v² = w²
#         Δxᵢ² = Δxᵢ₊₁²
#     end
#     s
# end
