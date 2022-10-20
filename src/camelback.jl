# function sixcamel(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         xᵢ = x[i]
#         xᵢ₊₁ = x[i+1]
#         vᵢ = xᵢ * xᵢ
#         vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
#         s += (4 - 2.1vᵢ + vᵢ * vᵢ / 3) * vᵢ + xᵢ * xᵢ₊₁ + 4 * (vᵢ₊₁ - 1) * vᵢ₊₁
#     end
#     s
# end

# function threecamel(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         xᵢ = x[i]
#         xᵢ₊₁ = x[i+1]
#         v = xᵢ * xᵢ
#         v² = v * v
#         s += 2v - 1.05v² + v * v² / 6 + xᵢ * xᵢ₊₁ + xᵢ₊₁ * xᵢ₊₁
#     end
#     s
# end

# Slightly faster, but some AD frameworks will hate it
function sixcamel(x)
    s = zero(eltype(x))
    xᵢ = x[1]
    vᵢ = xᵢ * xᵢ
    for i ∈ 2:length(x)
        xᵢ₊₁ = x[i]
        vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
        s += (4 - 2.1vᵢ + vᵢ * vᵢ / 3) * vᵢ + xᵢ * xᵢ₊₁ + 4 * (vᵢ₊₁ - 1) * vᵢ₊₁
        xᵢ = xᵢ₊₁
        vᵢ = vᵢ₊₁
    end
    s
end

function threecamel(x)
    s = zero(eltype(x))
    xᵢ = x[1]
    vᵢ = xᵢ * xᵢ
    for i ∈ 2:length(x)
        xᵢ₊₁ = x[i]
        vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
        v² = vᵢ * vᵢ
        s += 2vᵢ - 1.05v² + vᵢ * v² / 6 + xᵢ * xᵢ₊₁ + vᵢ₊₁
        xᵢ = xᵢ₊₁
        vᵢ = vᵢ₊₁
    end
    s
end
