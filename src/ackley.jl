#
# Date created: 2022-10-18
# Author: aradclif
#
#
############################################################################################
# a = 20, b = 0.2, c = 2π
function ackley(x)
    s₁ = zero(eltype(x))
    s₂ = zero(eltype(x))
    for i ∈ eachindex(x)
        s₁ += x[i]^2
        s₂ += cos(2π * x[i])
    end
    n⁻¹ = (1 / length(x))
    -20 * exp(-0.2 * √(n⁻¹ * s₁)) - exp(n⁻¹ * s₂) + 20 + exp(1)
end
