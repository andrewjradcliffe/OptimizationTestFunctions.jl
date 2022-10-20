# Slower due to significant repetition of computation
# function easom(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         δ₁ = x[i] - π
#         δ₂ = x[i+1] - π
#         s += cos(x[i]) * cos(x[i+1]) * exp(-δ₁ * δ₁ - δ₂ * δ₂)
#     end
#     -s
# end

# cuts ≈33% time
function easom(x)
    s = zero(eltype(x))
    xᵢ = x[1]
    cᵢ = cos(xᵢ)
    δᵢ = xᵢ - π
    δᵢ² = δᵢ * δᵢ
    for i ∈ 2:length(x)
        xᵢ₊₁ = x[i]
        δᵢ₊₁ = xᵢ₊₁ - π
        cᵢ₊₁ = cos(xᵢ₊₁)
        δᵢ₊₁² = δᵢ₊₁ * δᵢ₊₁
        s += cᵢ * cᵢ₊₁ * exp(-(δᵢ² + δᵢ₊₁²))
        xᵢ = xᵢ₊₁
        δᵢ = δᵢ₊₁
        cᵢ = cᵢ₊₁
        δᵢ² = δᵢ₊₁²
    end
    -s
end
