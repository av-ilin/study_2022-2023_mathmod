using Plots

const a = 19.1
const n = 5.2
const thetaPrayDeg = 320
const dTheta = 0.01
const maxTheta = 4π
const cases = ["First", "Second"]

function F(theta)
    return r0 * exp.(theta / sqrt.(n^2 - 1))
end

for case in cases
    global r0 = -1
    theta0 = -1

    if case=="First"
        r0 = a / (n + 1)
        theta0 = 0
    else
        r0 = a / (n - 1)
        theta0 = -π
    end

    theta1 = theta0 + maxTheta
    thetaHunt = theta0:dTheta:theta1
    thetaPray = thetaPrayDeg * π / 180 + 2 * theta0

    plt = plot(proj=:polar, aspect_ratio=:equal, dpi=500, title="Lab02" * case * "Case", legend=true)
    plot!(plt, [theta0, theta0], [a, F(theta0)], label=false, color=:red)
    plot!(plt, thetaHunt, F, label=:"Траектория охраны" ,color=:red)
    plot!(plt, [0, thetaPray], [0, F(thetaPray) + 20], label=:"Траектория браконьеров", color=:green)

    plot!(plt, [theta0], [a], seriestype=:scatter, label=:"Точка начала (охрана)", color=:red)
    plot!(plt, [0], [0], seriestype=:scatter, label=:"Точка начала (браконьеры)", color=:green)
    plot!(plt, [thetaPray], [F(thetaPray)], seriestype=:scatter, label=:"Точка пересечения", color=:blue)

    savefig(plt, "Lab02" * case * "Case.png")
end