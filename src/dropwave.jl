# function dropwave(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         v = x[i]^2 + x[i+1]^2
#         s += (1 + cos(12√v)) / (0.5v + 2)
#     end
#     -s
# end

# Slightly faster, but negligible.
# function dropwave(x)
#     s = zero(eltype(x))
#     xᵢ = x[1]
#     vᵢ = xᵢ * xᵢ
#     for i ∈ 2:length(x)
#         xᵢ₊₁ = x[i]
#         vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
#         v = vᵢ + vᵢ₊₁
#         s += (1 + cos(12√v)) / (0.5v + 2)
#         xᵢ = xᵢ₊₁
#         vᵢ = vᵢ₊₁
#     end
#     -s
# end

# removing bounds checks
function dropwave(x)
    s = zero(eltype(x)) / 1
    xᵢ = x[firstindex(x)]
    vᵢ = xᵢ * xᵢ
    @inbounds for i ∈ firstindex(x)+1:lastindex(x)
        xᵢ₊₁ = x[i]
        vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
        v = vᵢ + vᵢ₊₁
        s += (1 + cos(12√v)) / (0.5v + 2)
        xᵢ = xᵢ₊₁
        vᵢ = vᵢ₊₁
    end
    -s
end
