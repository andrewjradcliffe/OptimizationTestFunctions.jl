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
# function sixcamel(x)
#     s = zero(eltype(x))
#     xᵢ = x[1]
#     vᵢ = xᵢ * xᵢ
#     for i ∈ 2:length(x)
#         xᵢ₊₁ = x[i]
#         vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
#         s += (4 - 2.1vᵢ + vᵢ * vᵢ / 3) * vᵢ + xᵢ * xᵢ₊₁ + 4 * (vᵢ₊₁ - 1) * vᵢ₊₁
#         xᵢ = xᵢ₊₁
#         vᵢ = vᵢ₊₁
#     end
#     s
# end

# function threecamel(x)
#     s = zero(eltype(x))
#     xᵢ = x[1]
#     vᵢ = xᵢ * xᵢ
#     for i ∈ 2:length(x)
#         xᵢ₊₁ = x[i]
#         vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
#         v² = vᵢ * vᵢ
#         s += 2vᵢ - 1.05v² + vᵢ * v² / 6 + xᵢ * xᵢ₊₁ + vᵢ₊₁
#         xᵢ = xᵢ₊₁
#         vᵢ = vᵢ₊₁
#     end
#     s
# end

# removing bounds, simplifying some subexpressions
function sixcamel(x)
    s = zero(eltype(x)) / 1
    c = one(eltype(x)) / 3
    b = 21one(eltype(x)) / 10
    xᵢ = x[firstindex(x)]
    vᵢ = xᵢ * xᵢ
    vᵢ² = vᵢ * vᵢ
    @inbounds for i ∈ firstindex(x)+1:lastindex(x)
        xᵢ₊₁ = x[i]
        vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
        vᵢ₊₁² = vᵢ₊₁ * vᵢ₊₁
        s += (4 - b * vᵢ + vᵢ² * c) * vᵢ + xᵢ * xᵢ₊₁ + 4 * (vᵢ₊₁² - vᵢ₊₁)
        xᵢ = xᵢ₊₁
        vᵢ = vᵢ₊₁
        vᵢ² = vᵢ₊₁²
    end
    s
end

function threecamel(x)
    s = zero(eltype(x)) / 1
    c = one(eltype(x)) / 6
    b = 21one(eltype(x)) / 20
    xᵢ = x[firstindex(x)]
    vᵢ = xᵢ * xᵢ
    @inbounds for i ∈ firstindex(x)+1:lastindex(x)
        xᵢ₊₁ = x[i]
        vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
        v² = vᵢ * vᵢ
        s += 2vᵢ - b * v² + vᵢ * v² * c + xᵢ * xᵢ₊₁ + vᵢ₊₁
        xᵢ = xᵢ₊₁
        vᵢ = vᵢ₊₁
    end
    s
end
