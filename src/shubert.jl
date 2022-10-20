#
# Date created: 2022-10-19
# Author: aradclif
#
#
############################################################################################

# the inner loop can be simplified, as shown below -- cuts time by 60%
# function shubert(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         s₁ = zero(eltype(x))
#         s₂ = zero(eltype(x))
#         xᵢ = x[i]
#         xᵢ₊₁ = x[i+1]
#         for j = 1:5
#             s₁ += j * cos((j + 1) * xᵢ + 1)
#             s₂ += j * cos((j + 1) * xᵢ₊₁ + 1)
#         end
#         s += s₁ * s₂
#     end
#     s
# end

function shubert(x)
    s = zero(eltype(x))
    xᵢ = x[1]
    s₁ = zero(eltype(x))
    for j = 1:5
        s₁ += j * cos((j + 1) * xᵢ + 1)
    end
    for i ∈ 2:length(x)
        s₂ = zero(eltype(x))
        xᵢ₊₁ = x[i]
        for j = 1:5
            s₂ += j * cos((j + 1) * xᵢ₊₁ + 1)
        end
        s += s₁ * s₂
        s₁ = s₂
        xᵢ = xᵢ₊₁
    end
    s
end
