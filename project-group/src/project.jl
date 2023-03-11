### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ c49b5fc1-7e62-4341-b8a5-682658ea31be
begin
	import Pkg
	Pkg.activate()
	using DifferentialEquations
	using LaTeXStrings
	import Plots
end

# ╔═╡ 81359a0e-696d-415f-beef-9eafd09e7a00
begin
	const N = 50
	const m = 1
	const k = 1
	const d = 1
	const X = [i * d for i in 0:N+1]
	const A = 0
	const B = 1
	const T = 0.0:N+1
end

# ╔═╡ 85c33022-bba3-4e9c-8ecd-30c89422592c
function find_standing_wave(xᵢ, time, l)
	pₗ = (l * π)/((N + 1) * d)
	ω₀ = √(k/m)
	ωₗ = 2 * ω₀ * sin((l * π)/(2 * (N + 1)))
	
	return (A * cos(pₗ * xᵢ) + B * sin(pₗ * xᵢ)) * cos(ωₗ * time)
end

# ╔═╡ 3a195738-8991-43b2-94f2-6c3536e690d0
function find_Yₜ(X, time, l)
	Yₜ = []
	for xᵢ in X
		push!(Yₜ, find_standing_wave(xᵢ, time, l))
	end
	return Yₜ
end

# ╔═╡ 5019ded1-db7f-432a-8f65-79bc79f39537
begin
	function find_new_X(X, Y)
		new_X = [0.0 for i in 1:length(X)]
		for i in 1:length(X)
			new_X[i] = X[i] + Y[i]
		end
		return new_X
	end
	
	const Y_const = [0 for i in 1:length(X)]
end

# ╔═╡ 71dda8fb-7995-4eb3-80af-9e7a9776c6d5
begin
	fig_1 = Plots.plot(
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 400),
		legend=:bottomleft,
		plot_title="Гармоническая цепочка",
		xlabel="x",
		ylabel="y"
	)

	Plots.plot!(fig_1[1], X, find_Yₜ(X, 0.0, 1), color=:red, label="Гармоника №1")
	Plots.plot!(fig_1[1], X, find_Yₜ(X, 0.0, 2), color=:blue, label="Гармоника №2")
	Plots.plot!(fig_1[1], X, find_Yₜ(X, 0.0, 3), color=:green, label="Гармоника №3")

	savefig(fig_1, "artifacts/plot01.png")
end

# ╔═╡ 9ca72cb3-3ac5-4422-8ee4-efd0231b59f2
begin
	fig_2 = Plots.plot(
		layout=(3, 1),
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 800),
		legend=:bottomleft,
		plot_title="Гармоническая цепочка",
		xlabel="x",
		ylabel="y"
	)

	Plots.plot!(fig_2[1], X, find_Yₜ(X, 0.0, 1), color=:red, label="Гармоника №1")
	Plots.plot!(fig_2[2], X, find_Yₜ(X, 0.0, 2), color=:blue, label="Гармоника №2")
	Plots.plot!(fig_2[3], X, find_Yₜ(X, 0.0, 3), color=:green, label="Гармоника №3")

	Plots.savefig(fig_2, "artifacts/plot02.png")
end

# ╔═╡ 51b3d675-33a3-408b-a7e0-4e92d250f5e3
begin
	fig_3 = Plots.plot(
		layout=(3, 1),
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		size=(800, 800),
		legend=:bottomleft,
		plot_title="Гармоническая цепочка",
		xlabel="x",
		ylabel="y"
	)

	Plots.plot!(fig_3[1], X, find_Yₜ(X, 0.0, 1), color=:red, label="Гармоника №1")
	Plots.scatter!(fig_3[1], X, find_Yₜ(X, 0.0, 1), color=:red, label="", markerstrokewidth=0.4, markersize=4)
	Plots.plot!(fig_3[2], X, find_Yₜ(X, 0.0, 2), color=:blue, label="Гармоника №2")
	Plots.scatter!(fig_3[2], X, find_Yₜ(X, 0.0, 2), color=:blue, label="", markerstrokewidth=0.4, markersize=4)
	Plots.plot!(fig_3[3], X, find_Yₜ(X, 0.0, 3), color=:green, label="Гармоника №3")
	Plots.scatter!(fig_3[3], X, find_Yₜ(X, 0.0, 3), color=:green, label="", markerstrokewidth=0.4, markersize=4)

	Plots.savefig(fig_3, "artifacts/plot03.png")
end

# ╔═╡ f9db5e7e-78c0-46fa-a9e1-fd5dc348ab01
begin
	anim = Plots.@animate for time in 0.0:0.2:N
		fig = Plots.plot(
			layout=(3, 1),
			dpi=150,
			grid=:xy,
			gridcolor=:black,
			gridwidth=1,
			size=(800, 800),
			legend=:bottomleft,
			ylims=(-1.5, 1.5),
			plot_title="Гармоническая цепочка",
			xlabel="x",
			ylabel="y"
		)
	
		Plots.plot!(fig[1], X, find_Yₜ(X, time, 1), color=:red, label="Гармоника №1")
		Plots.scatter!(fig[1], X, Y_const, alpha=0.25, color=:grey, markerstrokewidth=0, label="" )
		Plots.scatter!(fig[1], X, find_Yₜ(X, time, 1), color=:red, label="", markerstrokewidth=0.4, markersize=4)

		Plots.plot!(fig[2], X, find_Yₜ(X, time, 2), color=:blue, label="Гармоника №2")
		Plots.scatter!(fig[2], X, Y_const, alpha=0.25, color=:grey, markerstrokewidth=0, label="" )
		Plots.scatter!(fig[2], X, find_Yₜ(X, time, 2), color=:blue, label="", markerstrokewidth=0.4, markersize=4)

		Plots.plot!(fig[3], X, find_Yₜ(X, time, 3), color=:green, label="Гармоника №3")
		Plots.scatter!(fig[3], X, Y_const, alpha=0.25, color=:grey, markerstrokewidth=0, label="" )
		Plots.scatter!(fig[3], X, find_Yₜ(X, time, 3), color=:green, label="", markerstrokewidth=0.4, markersize=4)
	end
	Plots.gif(anim, fps=60, "artifacts/anim01.gif")
end

# ╔═╡ d50712cb-c71d-4e14-bbe2-8cfa507e39d8
begin
	anim1 = Plots.@animate for time in 0.0:0.2:N+1
		fig = Plots.plot(
			layout=(3, 1),
			dpi=150,
			grid=:xy,
			gridcolor=:black,
			gridwidth=1,
			size=(800, 800),
			legend=:bottomleft,
			ylims=(-1.5, 1.5),
			plot_title="Гармоническая цепочка",
			xlabel="x",
			ylabel="Ось ординат"
		)
	
		Plots.plot!(fig[1], find_new_X(X, find_Yₜ(X, time, 1)), Y_const, color=:red, label="Гармоника №1")
		Plots.scatter!(fig[1], X, Y_const, alpha=0.8, color=:grey, markerstrokewidth=0, label="" )
		Plots.scatter!(fig[1], find_new_X(X, find_Yₜ(X, time, 1)), Y_const, color=:red, label="", markerstrokewidth=0.4, markersize=4)

		Plots.plot!(fig[2], find_new_X(X, find_Yₜ(X, time, 2)), Y_const, color=:blue, label="Гармоника №2")
		Plots.scatter!(fig[2], X, Y_const, alpha=0.8, color=:grey, markerstrokewidth=0, label="" )
		Plots.scatter!(fig[2], find_new_X(X, find_Yₜ(X, time, 2)), Y_const, color=:blue, label="", markerstrokewidth=0.4, markersize=4)

		Plots.plot!(fig[3], find_new_X(X, find_Yₜ(X, time, 3)), Y_const, color=:green, label="Гармоника №3")
		Plots.scatter!(fig[3], X, Y_const, alpha=0.8, color=:grey, markerstrokewidth=0, label="" )
		Plots.scatter!(fig[3], find_new_X(X, find_Yₜ(X, time, 3)), Y_const, color=:green, label="", markerstrokewidth=0.4, markersize=4)
	end
	Plots.gif(anim1, fps=60, "artifacts/anim02.gif")
end

# ╔═╡ Cell order:
# ╠═c49b5fc1-7e62-4341-b8a5-682658ea31be
# ╠═81359a0e-696d-415f-beef-9eafd09e7a00
# ╠═85c33022-bba3-4e9c-8ecd-30c89422592c
# ╠═3a195738-8991-43b2-94f2-6c3536e690d0
# ╠═5019ded1-db7f-432a-8f65-79bc79f39537
# ╠═71dda8fb-7995-4eb3-80af-9e7a9776c6d5
# ╠═9ca72cb3-3ac5-4422-8ee4-efd0231b59f2
# ╠═51b3d675-33a3-408b-a7e0-4e92d250f5e3
# ╠═f9db5e7e-78c0-46fa-a9e1-fd5dc348ab01
# ╠═d50712cb-c71d-4e14-bbe2-8cfa507e39d8
