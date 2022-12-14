# function rastrigin(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         s += x[i]^2 - 10cos(2π * x[i])
#     end
#     s + 10 * length(x)
# end

function rastrigin(x)
    s₁ = zero(eltype(x))
    s₂ = zero(eltype(x)) / 1
    π₂ = 2one(eltype(x)) * π
    @inbounds for i ∈ eachindex(x)
        s₁ += x[i]^2
        s₂ += cos(π₂ * x[i])
    end
    s₁ - 10s₂ + 10 * length(x)
end
