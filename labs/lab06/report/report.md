---
## Front matter
title: "Лабораторная работа №6"
subtitle: "Задача об эпидемии"
author: "Ильин Андрей Владимирович"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: false # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Рассмотреть модель эпидемии. Построить вышеуказанную модель средствами OpenModellica и Julia.

# Задачи

На одном острове вспыхнула эпидемия. Известно, что из всех проживающих на острове ($N=15089$) в момент начала эпидемии ($t=0$) число заболевших людей (являющихся распространителями инфекции) $I(0)=95$, А число здоровых людей с иммунитетом к болезни $R(0)=45$. Таким образом, число людей восприимчивых к болезни, но пока здоровых, в начальный момент времени $S(0)=N-I(0)- R(0)$.

Построить графики изменения числа особей в каждой из трех групп. Рассмотреть, как будет протекать эпидемия в случае:

1. если $I(0) \leq I^*$
2. если $I(0) > I^*$

# Среда

-   Julia – это открытый свободный высокопроизводительный динамический язык высокого уровня, созданный специально для технических (математических) вычислений. Его синтаксис близок к синтаксису других сред технических вычислений, таких как Matlab и Octave. [@unn-julia]

-   OpenModelica — свободное открытое программное обеспечение для моделирования, симуляции, оптимизации и анализа сложных динамических систем. Основано на языке Modelica. [@wiki-om]

# Теоретическое введение

Предположим, что некая популяция, состоящая из $N$ особей, (считаем, что популяция изолирована) подразделяется на три группы. Первая группа - это восприимчивые к болезни, но пока здоровые особи, обозначим их через $S(t)$. Вторая группа – это число инфицированных особей, которые также при этом являются распространителями инфекции, обозначим их $I(t)$. А третья группа, обозначающаяся через $R(t)$ – это здоровые особи с иммунитетом к болезни. [@rudn-task]

До того, как число заболевших не превышает критического значения $I^*$, считаем, что все больные изолированы и не заражают здоровых. Когда $I(t) > I^*$, тогда инфицирование способны заражать восприимчивых к болезни особей.

Таким образом, скорость изменения числа $S(t)$ меняется по следующему закону:

$$
\frac{dS}{dt} =

\begin{cases}
-\alpha S,\ если\ I(t) > I^* \\
0,\ если\ I(t) \leq I^* \\
\end{cases}
$$

Поскольку каждая восприимчивая к болезни особь, которая, в конце концов, заболевает, сама становится инфекционной, то скорость изменения числа инфекционных особей представляет разность за единицу времени между заразившимися и теми, кто уже болеет и лечится, т.е.:

$$
\frac{dI}{dt} =

\begin{cases}
\alpha S - \beta I,\ если\ I(t) > I^* \\
- \beta I,\ если\ I(t) \leq I^* \\
\end{cases}
$$

А скорость изменения выздоравливающих особей (при этом приобретающие иммунитет к болезни)

$$
\frac{dR}{dt} = \beta I
$$

Постоянные пропорциональности $\alpha$, $\beta$ - это коэффициенты заболеваемости и выздоровления соответственно.

# Выполнение лабораторной работы

1. Начнем выполнения поставленных задач в Julia. Для этого запустим Pluto [@pluto-jl]. (рис. @fig:001)

![Julia. Запуск Pluto](image/01.png){#fig:001 width=86%}

2. Первым делом подкючим пакеты "Plots" [@docs-plots] и "DifferentialEquations" [@docs-de]. Далее объявим начальные данные при помощи констант. Также объявим начальное условие для системы ДУ и промежуток времени, на котором будет проходить моделирование. После этого объявим функцию, представляющую систему. (рис. @fig:002)

```Julia
# подключение пакетов
using Plots
using DifferentialEquations

# входные данные
const a = 0.810
const b = 0.048
const c = 0.760
const d = 0.038
const x0 = 7
const y0 = 29

const t = (0, 50) # промежуток времени

function HunterPray!(du, u, p, t)
	du[1] = -a * u[1] + b * u[1] * u[2]
	du[2] = c * u[2] - d * u[1] * u[2]
end
```

![Julia. Скрипт (1). Модель "Хищник-жертва" (при начальных условиях x = 7, y = 29)](image/02.png){#fig:002 width=86%}

3. В следующей ячейке Pluto построим график зависимости $x$ от $y$ и графики функций $x(t)$, $y(t)$. При помощи 'DifferentialEquations' зададим и решим систему ДУ, после чего построим графики функций $x(t)$, $y(t). Так же создадим два списка, в которых будут храниться точки уравнений. Воспользуемся данным списком, чтобы построить график зависимости $x$ от $y$. Далее запустим итоговый скрипт. (рис. @fig:003, @fig:004, @fig:005)

```Julia
begin
u0 = [x0, y0]  # начальные условия
prob = ODEProblem(HunterPray!, u0, t)
sol = solve(prob, dtmax=0.05)

X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]

# используем Plots,
# чтобы построить графики
plt01 = plot(sol,
      dpi=500,
      plot_title = "Хищник-жертва",
      xlabel="Время (s)",
      ylabel="x, y",
      label=["x - хищник" "y - жертва"])
savefig(plt01, "artifacts/JL.lab05_01-1.png")

plt02 = plot(X, Y,
      dpi=500,
      plot_title = "Хищник-жертва",
      xlabel="x",
      ylabel="y",
      label="Зависимость x (хищник) от y (жертва)")
savefig(plt02, "artifacts/JL.lab05_01-2.png")

println("Success!")
```

![Julia. Скрипт (2). Модель "Хищник-жертва" (при начальных условиях x = 7, y = 29)](image/03.png){#fig:003 width=86%}

![Julia. Модель. Графики функций изменения численности хищников и изменения численности жертв (при начальных условиях x = 7, y = 29)](image/JL.lab05_01-1.png){#fig:004 width=86%}

![Julia. Модель. График зависимости изменения численности хищников от изменения численности жертв (при начальных условиях x = 7, y = 29)](image/JL.lab05_01-2.png){#fig:005 width=86%}

4. Изменим начальные значения в вышеуказанном скрипте, при которых будет достигаться положение равновесия (не зависящее от времени решение). (рис. @fig:006, @fig:007, @fig:008)

```Julia
u0 = [c/d, a/b] #!
prob = ODEProblem(HunterPray!, u0, t)
sol = solve(prob, dtmax=0.05)

X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]

plt01 = plot(sol,
      dpi=500,
      plot_title = "Хищник-жертва",
      xlabel="Время (s)",
      ylabel="x, y",
      label=["x - хищники" "y - жертва"])
savefig(plt01, "artifacts/JL.lab05_02-1.png")

plt02 = scatter(X, Y,
      dpi=500,
      plot_title = "Хищник-жертва",
      xlabel="x",
      ylabel="y",
      label="Зависимость x (хищники) от y (жертва)")
savefig(plt02, "artifacts/JL.lab05_02-2.png")

println("Success!")
```

![Julia. Скрипт. Модель "Хищник-жертва" (стационарное состояние)](image/04.png){#fig:006 width=86%}

![Julia. Модель. Графики функций изменения численности хищников и изменения численности жертв (стационарное состояние)](image/JL.lab05_02-1.png){#fig:007 width=86%}

![Julia. Модель. График зависимости изменения численности хищников от изменения численности жертв (стационарное состояние)](image/JL.lab05_02-2.png){#fig:008 width=86%}

6. Построим график зависимости численности хищников от численности жертв, а также графики изменения численности хищников и численности жертв при начальных условиях на Modelica. (рис. @fig:009, @fig:010, @fig:011)

```modelica
model lab05_01
  constant Real a = 0.810;
  constant Real b = 0.048;
  constant Real c = 0.760;
  constant Real d = 0.038;
  Real t = time;
  Real x(t);
  Real y(t);
initial equation
  x = 7;
  y = 29;
equation
  der(x) = -a * x + b * x * y;
  der(y) = c * y - d * x * y;
  annotation(experiment(StartTime = 0, StopTime = 50, Interval = 0.05));
end lab05_01;
```

![Modelica. Скрипт. Модель "Хищник-жертва" (при начальных условиях x = 7, y = 29)](image/05.png){#fig:009 width=86%}

![Modelica. Модель. Графики функций изменения численности хищников и изменения численности жертв (при начальных условиях x = 7, y = 29)](image/MO.lab05_01-1.png){#fig:010 width=86%}

![Modelica. Модель. График зависимости изменения численности хищников от изменения численности жертв (при начальных условиях x = 7, y = 29)](image/MO.lab05_01-2.png){#fig:011 width=86%}

7. Построим график зависимости численности хищников от численности жертв, а также графики изменения численности хищников и численности жертв в стационарном состоянии на Modelica. (рис. @fig:012, @fig:013, @fig:014)

```modelica
model lab05_02
  constant Real a = 0.810;
  constant Real b = 0.048;
  constant Real c = 0.760;
  constant Real d = 0.038;
  Real t = time;
  Real x(t);
  Real y(t);
initial equation
  x = c / d;
  y = a / b;
equation
  der(x) = -a * x + b * x * y;
  der(y) = c * y - d * x * y;
  annotation(experiment(StartTime = 0, StopTime = 50, Interval = 0.05));
end lab05_02;
```

![Modelica. Скрипт. Модель "Хищник-жертва" (стационарное состояние)](image/06.png){#fig:012 width=86%}

![Modelica. Модель. Графики функций изменения численности хищников и изменения численности жертв (стационарное состояние)](image/MO.lab05_02-1.png){#fig:013 width=86%}

![Modelica. Модель. График зависимости изменения численности хищников от изменения численности жертв (стационарное состояние)](image/MO.lab05_02-2.png){#fig:014 width=86%}

# Анализ результатов

Работа выполненна без непредвиденных проблем в соответствии с руководством. Ошибок и сбоев не произошло.

Моделирование на OMEdit было проще и быстрее, чем при использовании средств Julia. Скрипт на Modelica вышел более лакончиным, понятным и коротким. Более того OpenModelica быстрее обрабатывала скрипт и симмулировала модель. Стоит отметить, что OpenModelica имеет множество разлиных полезных инструментов для настройки с симмуляцией и работой с ней. К плюсам Julia можно отнести, что она является языком программирования, который хорошо подходит для математических и технических задач.

# Выводы

Мы улучшили практические навыки в области дифференциальных уравнений, улучшили навыки моделирования на Julia, также навыки моделирования на OpenModelica. Изучили модель взаимодействия двух видов типа «хищник — жертва», а именно модель Лотки-Вольтерры.

# Список литературы{.unnumbered}

::: {#refs}
:::
