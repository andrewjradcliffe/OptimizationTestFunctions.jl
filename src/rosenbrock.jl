#
# Date created: 2022-10-18
# Author: aradclif
#
#
############################################################################################
function rosenbrock(x)
    a = one(eltype(x))
    b = 100 * a
    s = zero(eltype(x))
    for i in 1:length(x)-1
        s += (a - x[i])^2 + b * (x[i+1] - x[i]^2)^2
    end
    s
end
