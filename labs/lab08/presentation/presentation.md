---
## Front matter
lang: ru-RU
title: Лабораторная работа №8
subtitle: Модель конкуренции двух фирм
author:
    - Ильин А.В.
institute:
    - Российский университет дружбы народов, Москва, Россия
date: 1 апреля 2023

## i18n babel
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

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
    - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
    - '\makeatletter'
    - '\beamer@ignorenonframefalse'
    - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

-   Ильин Андрей Владимирович
-   НФИбд-01-20
-   1032201656
-   Российский Университет Дружбы Народов
-   [1032201656@pfur.ru](mailto:1032201656@pfur.ru)
-   <https://github.com/av-ilin>

:::
::: {.column width="30%"}

![](./image/avilin.jpg)

:::
::::::::::::::

# Вводная часть

## Актуальность

-   Приобрести необхдимые в современном научном сообществе навыки моделирования задач.
-   Освоить средства моделирования, такие как Julia и OpenModelica

## Объект и предмет исследования

-   Язык программирования Julia
-   OpenModelica
-   модель распространения рекламы.

## Цель

-   Рассмотреть модель распространения рекламы.
-   Построить данную модель средствами OpenModellica и Julia.

## Задачи

Построить график распространения рекламы, математическая модель которой описывается следующим уравнением

1. $\frac{dn}{dt} = (0.133 + 0.000033n(t))(N - n(t))$
2. $\frac{dn}{dt} = (0.0000132 + 0.32n(t))(N - n(t))$
3. $\frac{dn}{dt} = (0.8t + 0.15\sin(t)n(t))(N - n(t))$

При этом объем аудитории $N = 1670$, в начальный момент о товаре знает 12 человек. Для случая 2 определить в какой момент времени скорость распространения рекламы будет иметь максимальное значение.

## Материалы и методы

-   Julia, Pluto
-   Modelica, OMEdit

# Выполнение работы

## Julia. Cкрипт (1)

![Julia. Скрипт (1). Эффективность рекламы](image/02.png)

## Julia. Cкрипт (2)

![Julia. Скрипт (2). Эффективность рекламы ($\alpha_1 = 0.133$, $\alpha_2 = 0.000033$)](image/03.png)

## Julia. Модель(1)

:::::::::::::: {.columns align=center}
::: {.column width="33%"}

![Julia. Модель. Эффективность рекламы ($\alpha_1 = 0.133$, $\alpha_2 = 0.000033$)](image/JL.lab07-01.png)
:::
::: {.column width="33%"}

![Julia. Модель. Эффективность рекламы ($\alpha_1 = 0.0000132$, $\alpha_2 = 0.32$)](image/JL.lab07-02.png)
:::
::: {.column width="33%"}

![Julia. Модель. Эффективность рекламы ($\alpha_1 = 0.8$, $\alpha_2 = 0.15$)](image/JL.lab07-03.png)

:::
::::::::::::::

## Modellica. Cкрипт

![Modelica. Скрипт. Эффективность рекламы ($\alpha_1 = 0.133$, $\alpha_2 = 0.000033$)](image/06.png)

## Modellica. Модель (1)

:::::::::::::: {.columns align=center}
::: {.column width="33%"}

![Modelica. Модель. Эффективность рекламы ($\alpha_1 = 0.133$, $\alpha_2 = 0.000033$)](image/MO.lab07-01.png)
:::
::: {.column width="33%"}

![Modelica. Модель. Эффективность рекламы ($\alpha_1 = 0.0000132$, $\alpha_2 = 0.32$)](image/MO.lab07-02.png)
:::
::: {.column width="33%"}

![Modelica. Модель. Эффективность рекламы  ($\alpha_1 = 0.8$, $\alpha_2 = 0.15$)](image/MO.lab07-03.png)

:::
::::::::::::::

# Результаты

## Итог

Мы улучшили практические навыки в области дифференциальных уравнений, улучшили навыки моделирования на Julia, а также навыки моделирования на OpenModelica. Изучили и построили модель распространения рекламы.

## {.standout}

Спасибо за внимание!
