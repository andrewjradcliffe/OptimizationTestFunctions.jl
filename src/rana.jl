# function rana(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         xᵢ = x[i]
#         vₚ = √(abs(x[i+1] + xᵢ + 1))
#         vₘ = √(abs(x[i+1] - xᵢ + 1))
#         s += xᵢ * cos(vₚ) * sin(vₘ) + (1 + x[i+1]) * sin(vₚ) * cos(vₘ)
#     end
#     s
# end

# Slightly faster
# function rana(x)
#     s = zero(eltype(x))
#     xᵢ = x[1]
#     for i ∈ 2:length(x)
#         xᵢ₊₁ = x[i]
#         vₚ = √(abs(xᵢ₊₁ + xᵢ + 1))
#         vₘ = √(abs(xᵢ₊₁ - xᵢ + 1))
#         s += xᵢ * cos(vₚ) * sin(vₘ) + (1 + xᵢ₊₁) * sin(vₚ) * cos(vₘ)
#         xᵢ = xᵢ₊₁
#     end
#     s
# end

# function rana4(x)
#     s = zero(eltype(x))
#     xᵢ = x[firstindex(x)]
#     @inbounds for i ∈ firstindex(x)+1:lastindex(x)
#         xᵢ₊₁ = x[i]
#         vₚ = √(abs(xᵢ₊₁ + xᵢ + 1))
#         vₘ = √(abs(xᵢ₊₁ - xᵢ + 1))
#         s += xᵢ * cos(vₚ) * sin(vₘ) + (1 + xᵢ₊₁) * sin(vₚ) * cos(vₘ)
#         xᵢ = xᵢ₊₁
#     end
#     s
# end

# Faster with combined computation
function rana(x)
    s = zero(eltype(x)) / 1
    xᵢ = x[firstindex(x)]
    @inbounds for i ∈ firstindex(x)+1:lastindex(x)
        xᵢ₊₁ = x[i]
        vₚ = √(abs(xᵢ₊₁ + xᵢ + 1))
        vₘ = √(abs(xᵢ₊₁ - xᵢ + 1))
        sₚ, cₚ = sincos(vₚ)
        sₘ, cₘ = sincos(vₘ)
        s += xᵢ * cₚ * sₘ + (1 + xᵢ₊₁) * sₚ * cₘ
        xᵢ = xᵢ₊₁
    end
    s
end
