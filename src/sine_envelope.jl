# function sine_envelope(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         v = x[i+1]^2 + x[i]^2
#         s += sin(√v - 0.5)^2 / (0.001 * v + 1)^2
#     end
#     -(0.5 * (length(x) - 1) + s)
# end

# function sine_envelope2(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         v = x[i+1]^2 + x[i]^2
#         s += 0.5 + sin(√v - 0.5)^2 / (0.001 * v + 1)^2
#     end
#     -s
# end

# The fastest
function sine_envelope(x)
    s = zero(eltype(x))
    for i ∈ 1:length(x)-1
        v = x[i+1]^2 + x[i]^2
        w = sin(√v - 0.5) / (0.001 * v + 1)
        s += w * w
    end
    -(0.5 * (length(x) - 1) + s)
end

# function sine_envelope4(x)
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         v = hypot(x[i+1], x[i])
#         w = sin(v - 0.5) / (0.001 * v * v + 1)
#         s += w * w
#     end
#     -(0.5 * (length(x) - 1) + s)
# end

# maybe fastest? (fewest ops). Is in fact fastest, by a small amount.
function sine_envelope5(x)
    s = zero(eltype(x))
    xᵢ = x[1]
    vᵢ = xᵢ * xᵢ
    for i ∈ 2:length(x)
        xᵢ₊₁ = x[i]
        vᵢ₊₁ = xᵢ₊₁ * xᵢ₊₁
        v = vᵢ + vᵢ₊₁
        w = sin(√v - 0.5) / (0.001 * v + 1)
        s += w * w
        xᵢ = xᵢ₊₁
        vᵢ = vᵢ₊₁
    end
    -(0.5 * (length(x) - 1) + s)
end
