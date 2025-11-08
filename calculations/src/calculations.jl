module calculations

using CairoMakie

function main()
    # First figure
    fig = Figure()
    ax = Axis(fig[1, 1], xlabel="X_1", ylabel="V_mix")

    x = range(0, 1, 100)
    V(x) = 2.7166 * (x^2 - x^3)
    y = V.(x)

    x_1 = 0.75

    dV(x) = 2.7166 * (2 * x - 3 * x^2)
    m = dV(x_1)
    b = V(x_1) - m * x_1

    a = lines!(ax, x, y)
    b = lines!(ax, [0.0, 1.0], [b, m + b])
    xlims!(ax, 0.0, 1.0)
    save("../assets/fig_3.png", fig)

    fig = Figure()
    ax = Axis(fig[1, 1], xlabel="X_1", ylabel="E_mix")

    a0 = 10500
    a1 = -3000
    x = range(0, 1, 100)
    h = @. (1 - x) * x * (a0 * (1 - x) + a1 * x)
    s = @. -8.314 * ((1 - x) * log(1 - x) + x * log(x))
    T = 500
    g = @. h - T * s

    a = lines!(ax, x, g)
    b = lines!(ax, x, h)
    c = lines!(ax, x, T * s)

    Legend(fig[1, 2], [a, b, c], ["G(X_B)", "H(X_B)", "S(X_B)"])
    save("../assets/fig_4.png", fig)

    fig = Figure()
    ax = Axis(fig[1, 1], xlabel="X_1", ylabel="E_mix")

    a0 = 10500
    a1 = -3000
    x = range(0, 1, 100)
    h = @. (1 - x) * x * (a0 * (1 - x) + a1 * x)
    s = @. -8.314 * ((1 - x) * log(1 - x) + x * log(x))
    T = 5000
    g = @. h - T * s

    a = lines!(ax, x, g)
    b = lines!(ax, x, h)
    c = lines!(ax, x, T * s)

    Legend(fig[1, 2], [a, b, c], ["G(X_B)", "H(X_B)", "S(X_B)"])
    save("../assets/fig_5.png", fig)

    fig = Figure()
    ax = Axis(fig[1, 1], xlabel="X_1", ylabel="E_mix")

    a0 = 10500
    a1 = -3000
    x = range(0, 1, 100)
    h_1(x) = (1 - x) * x * (a0 * (1 - x) + a1 * x)
    s_1(x) = -8.314 * ((1 - x) * log(1 - x) + x * log(x))
    T = 500
    g_1(x) = h_1(x) - T * s_1(x)

    m = (g_1(0.61) - g_1(0.59)) / 0.02


    a = lines!(ax, x, g_1.(x))
    b = lines!(ax, x, h_1.(x))
    c = lines!(ax, x, T * s_1.(x))
    c = lines!(ax, x, x .* m .- 1000)
    println(m .- 1000)

    Legend(fig[1, 2], [a, b, c], ["G(X_B)", "H(X_B)", "S(X_B)"])
    save("../assets/fig_6.png", fig)
end

end


