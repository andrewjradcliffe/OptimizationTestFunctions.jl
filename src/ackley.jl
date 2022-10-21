# a = 20, b = 0.2, c = 2π
# function ackley(x)
#     s₁ = zero(eltype(x))
#     s₂ = zero(eltype(x))
#     @inbounds for i ∈ eachindex(x)
#         s₁ += x[i]^2
#         s₂ += cos(2π * x[i])
#     end
#     n⁻¹ = (1 / length(x))
#     -20 * exp(-0.2 * √(n⁻¹ * s₁)) - exp(n⁻¹ * s₂) + 20 + exp(1)
# end

# type stable, and preserve Float types
function ackley(x)
    s₁ = zero(eltype(x))
    c = -one(eltype(x)) / 5
    π₂ = 2one(eltype(x)) * π
    s₂ = zero(π₂)
    @inbounds for i ∈ eachindex(x)
        s₁ += x[i]^2
        s₂ += cos(π₂ * x[i])
    end
    n⁻¹ = (one(eltype(x)) / length(x))
    -20 * exp(c * √(n⁻¹ * s₁)) - exp(n⁻¹ * s₂) + 20 + exp(one(eltype(x)))
end
