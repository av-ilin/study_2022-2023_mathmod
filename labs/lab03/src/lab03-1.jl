using Plots
using DifferentialEquations


const X = 44200
const Y = 54200
const a = 0.312
const b = 0.456
const c = 0.256
const h = 0.340
const P(t) = sin.(t + 3)
const Q(t) = cos.(t + 7)
const t_start = 0
const t_end = 2.16


function Battle!(df, u, p, t)
    df[1] = -a * u[1] - b * u[2] + P(t);
    df[2] = -c * u[1] - h * u[2] + Q(t);
end
u0 = [X, Y]
tspan = (t_start, t_end)
prob = ODEProblem(Battle!, u0, tspan)
sol = solve(prob)


plt = plot(sol,
           title="Модель боевых действий №1",
           dpi=500,
           label=["Армия №1" "Армия №2"],
           xlabel="Время (s)",
           ylabel="Численность")
savefig(plt, "artifacts/lab03-1_JL.png")