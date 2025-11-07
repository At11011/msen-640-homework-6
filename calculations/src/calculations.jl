module calculations

using CairoMakie

function main()
    fig = Figure()
    ax = Axis(fig[1, 1], xlabel = "X_1", ylabel ="V_mix")

    x = range(0, 1, 100)
    V(x) = 2.7166 * (x^2 - x^3)
    y = V.(x)

    x_1 = 0.75
    
    dV(x) = 2.7166 * (2 * x - 3 * x^2)
    m = dV(x_1)
    b = V(x_1) - m*x_1
    println(b)

    a = lines!(ax, x,y)
    b = lines!(ax, [0.0, 1.0],[b, m + b])
    xlims!(ax, 0.0, 1.0)
    save("../assets/fig_3.png", fig)
    fig
end

end


