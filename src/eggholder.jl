# function eggholder(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         v = x[i+1] + 47
#         s += v * sin(√(abs(0.5 * x[i] + v))) + x[i] * sin(√(abs(x[i] - v)))
#     end
#     -s
# end

# # Faster
# function eggholder(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         xᵢ = x[i]
#         v = x[i+1] + 47
#         s += v * sin(√(abs(0.5 * xᵢ + v))) + xᵢ * sin(√(abs(xᵢ - v)))
#     end
#     -s
# end

# Fastest
function eggholder(x)
    s = zero(eltype(x))
    xᵢ = x[1]
    for i ∈ 2:length(x)
        xᵢ₊₁ = x[i]
        v = xᵢ₊₁ + 47
        s += v * sin(√(abs(0.5 * xᵢ + v))) + xᵢ * sin(√(abs(xᵢ - v)))
        xᵢ = xᵢ₊₁
    end
    -s
end

