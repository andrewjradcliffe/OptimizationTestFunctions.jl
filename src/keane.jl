#
# Date created: 2022-10-19
# Author: aradclif
#
#
############################################################################################

function keane(x)
    s₁ = zero(eltype(x))
    s₂ = zero(eltype(x))
    p = one(eltype(x))
    for i ∈ eachindex(x)
        xᵢ = x[i]
        c = cos(xᵢ)
        c² = c * c
        s₁ += c² * c²
        p *= c²
        s₂ += i * xᵢ * xᵢ
    end
    -abs(s₁ - 2p) / √s₂
end

