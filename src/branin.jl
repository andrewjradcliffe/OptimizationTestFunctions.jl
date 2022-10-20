# a = 1, b = 5.1 / 4π², c = 5/π, d = 6, e = 10, f = 1 / 8π
# function branin(x)
#     a = 1; b = 5.1 / (4 * π * π); c = 5/π; d = 6; e = 10; f = 1 / 8π
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         xᵢ = x[i]
#         xᵢ₊₁ = x[i+1]
#         s += a * (xᵢ₊₁ - b * xᵢ * xᵢ + c * xᵢ - d)^2 + e * (1 - f) * cos(xᵢ) + e
#     end
#     s
# end

# Slightly faster
function branin(x)
    a = 1; b = 5.1 / (4 * π * π); c = 5/π; d = 6; e = 10; f = 1 / 8π
    s = zero(eltype(x))
    xᵢ = x[1]
    for i ∈ 2:length(x)
        xᵢ₊₁ = x[i]
        s += a * (xᵢ₊₁ - b * xᵢ * xᵢ + c * xᵢ - d)^2 + e * (1 - f) * cos(xᵢ) + e
        xᵢ = xᵢ₊₁
    end
    s
end
