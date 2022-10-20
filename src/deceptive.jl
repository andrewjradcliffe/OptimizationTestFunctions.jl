#
# Date created: 2022-10-18
# Author: aradclif
#
#
############################################################################################
# Truly, horrible functions

function g_deceptive(x, i)
    αᵢ = 0.7 # should be random for each i
    if 0 ≤ x[i] ≤ (4/5) * αᵢ
        -(x[i] / αᵢ) + (4/5)
    elseif (4/5) * αᵢ < x[i] < αᵢ
        (5 * x[i]) / αᵢ - 4
    elseif αᵢ < x[i] ≤ (1 + 4αᵢ) / 5
        5 * (x[i] - αᵢ) / (αᵢ - 1) + 1
    else #if (1 + 4αᵢ) < x[i] ≤ 1
        (x[i] - 1) / (1 - αᵢ) + (4/5)
    end
end

# β = 0.2
function deceptive(x)
    s = zero(eltype(x))
    for i ∈ eachindex(x)
        s += g_deceptive(x, i)
    end
    - (s / length(x))^0.2
end

