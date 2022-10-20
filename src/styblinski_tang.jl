 function styblinski_tang(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         xᵢ = x[i]
#         s += xᵢ^4 - 16xᵢ^2 + 5xᵢ
#     end
#     s / 2
# end

# function styblinski_tang2(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         s += x[i]^4 - 16x[i]^2 + 5x[i]
#     end
#     s / 2
# end

function styblinski_tang(x)
    s₁ = zero(eltype(x))
    s₂ = zero(eltype(x))
    s₃ = zero(eltype(x))
    for i ∈ eachindex(x)
        xᵢ = x[i]
        xᵢ² = xᵢ^2
        s₁ += xᵢ²^2
        s₂ += xᵢ²
        s₃ += xᵢ
    end
    (s₁ - 16s₂ + 5s₃) / 2
end
