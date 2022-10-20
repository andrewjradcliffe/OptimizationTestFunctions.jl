# function cross_in_tray(x)
#     s = zero(eltype(x))
#     π⁻¹ = 1 / π
#     for i ∈ 1:length(x)-1
#         xᵢ = x[i]
#         xᵢ₊₁ = x[i+1]
#         s += (abs(sin(xᵢ) * sin(xᵢ₊₁) * exp(abs(100 - √(xᵢ * xᵢ + xᵢ₊₁ * xᵢ₊₁) * π⁻¹))) + 1)^0.1
#     end
#     -0.0001s
# end

# # The faster, slightly
# function cross_in_tray4(x)
#     s = zero(eltype(x))
#     π⁻¹ = 1 / π
#     xᵢ = x[1]
#     vᵢ = xᵢ * xᵢ
#     for i ∈ 2:length(x)
#         xᵢ₊₁ = x[i]
#         vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
#         s += (abs(sin(xᵢ) * sin(xᵢ₊₁) * exp(abs(100 - √(vᵢ + vᵢ₊₁) * π⁻¹))) + 1)^0.1
#         xᵢ = xᵢ₊₁
#         vᵢ = vᵢ₊₁
#     end
#     -0.0001s
# end

# fastest due to fewer special function calls
# function cross_in_tray(x)
#     s = zero(eltype(x))
#     π⁻¹ = 1 / π
#     xᵢ = x[1]
#     vᵢ = xᵢ * xᵢ
#     wᵢ = sin(xᵢ)
#     for i ∈ 2:length(x)
#         xᵢ₊₁ = x[i]
#         vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
#         wᵢ₊₁ = sin(xᵢ₊₁)
#         s += (abs(wᵢ * wᵢ₊₁ * exp(abs(100 - √(vᵢ + vᵢ₊₁) * π⁻¹))) + 1)^0.1
#         xᵢ = xᵢ₊₁
#         vᵢ = vᵢ₊₁
#         wᵢ = wᵢ₊₁
#     end
#     -0.0001s
# end

# safety for arbitrary-indexed arrays
function cross_in_tray(x)
    s = zero(eltype(x))
    π⁻¹ = 1 / π
    xᵢ = x[firstindex(x)]
    vᵢ = xᵢ * xᵢ
    wᵢ = sin(xᵢ)
    @inbounds for i ∈ firstindex(x)+1:lastindex(x)
        xᵢ₊₁ = x[i]
        vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
        wᵢ₊₁ = sin(xᵢ₊₁)
        s += (abs(wᵢ * wᵢ₊₁ * exp(abs(100 - √(vᵢ + vᵢ₊₁) * π⁻¹))) + 1)^0.1
        xᵢ = xᵢ₊₁
        vᵢ = vᵢ₊₁
        wᵢ = wᵢ₊₁
    end
    -0.0001s
end
