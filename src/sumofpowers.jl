#
# Date created: 2022-10-18
# Author: aradclif
#
#
############################################################################################
function sumofpowers(x)
    s = zero(eltype(x))
    for i ∈ eachindex(x)
        s += abs(x[i])^(i+1)
    end
    s
end
