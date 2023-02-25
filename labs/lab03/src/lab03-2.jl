using Plots
using DifferentialEquations


const X = 44200
const Y = 54200
const a = 0.318
const b = 0.615
const c = 0.312
const h = 0.512
const P(t) = abs.(cos.(8 * t))
const Q(t) = abs.(sin.(6 * t))
const t_start = 0
const t_end = 0.001


function Battle!(df, u, p, t)
    df[1] = -a * u[1] - b * u[2] + P(t);
    df[2] = -c * u[1] * u[2] - h * u[2] + Q(t);
end
u0 = [X, Y]
tspan = (t_start, t_end)
prob = ODEProblem(Battle!, u0, tspan)
sol = solve(prob)

plt = plot(sol,
           title="Модель боевых действий №2",
           dpi=500,
           label=["Армия №1" "Армия №2"],
           xlabel="Время (s)",
           ylabel="Численность",
           legend=:outertop)
savefig(plt, "artifacts/lab03-2_JL.png")