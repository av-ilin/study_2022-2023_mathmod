using Plots
using DifferentialEquations

const startT = 0.3
const endT = 33
const stepT = 0.05
const x0 = 1.3
const y0 = 0.3
const w = 3.3

u0 = [x0, y0]
spanT = (startT, endT)

function Fluctuations!(df, u, p, t)
    df[1] = u[2]
    df[2] = - w * u[1]
end

prob = ODEProblem(Fluctuations!, u0, spanT)
sol = solve(prob, dtmax=stepT)
plt = plot(sol,
           title="Колебания гармонического осциллятора без затуханий и без действий внешней силы",
           dpi=500,
           xlabel="Время (s)",
           ylabel="x, y")
savefig(plt, "artifacts/JL.lab04-01-01.png")
