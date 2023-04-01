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
-   Модель конкуренции двух фирм.

## Цель

-   Рассмотреть модель конкуренции двух фирм.
-   Построить данную модель средствами OpenModellica и Julia.

## Задачи

1. Постройте графики изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 1.

2. Постройте графики изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случая 2.

Нормировка: $t = c_1\theta$

Начальными условия и параметры: $M_0^1 = 6.8$, $M_0^2= 6$, $p_{cr} = 35$, $N = 31$, $q = 1$, $\tau_1 = 18$, $\tau_2 = 23$, $p_1 = 1.5$, $p_2 = 8.7$

Значения $p_{cr}, p_{1,2}, N$ указаны в тысячах единиц, а значения $M_{1,2}$ указаны в млн. единиц.

## Материалы и методы

-   Julia, Pluto
-   Modelica, OMEdit

# Выполнение работы

## Julia. Cкрипт

:::::::::::::: {.columns align=center}

::: {.column width="50%"}
![Julia. Скрипт (1). Конкуренция двух фирм.](image/02.png)
:::

::: {.column width="50%"}
![Julia. Скрипт (2). Конкуренция двух фирм.](image/03.png)
:::

::::::::::::::

## Julia. Модель

:::::::::::::: {.columns align=center}

::: {.column width="50%"}
![Julia. Модель. Конкуренция двух фирм. Случай I](image/JL.lab08-01.png)
:::

::: {.column width="50%"}
![Julia. Модель. Конкуренция двух фирм. Случай II](image/JL.lab08-02.png)
:::

::::::::::::::

## Modellica. Cкрипт

:::::::::::::: {.columns align=center}

::: {.column width="50%"}
![Modelica. Скрипт. Конкуренция двух фирм. Cлучай I](image/04.png)
:::

::: {.column width="50%"}
![Modelica. Скрипт. Конкуренция двух фирм. Cлучай II](image/05.png)
:::

::::::::::::::

## Modellica. Модель (1)

:::::::::::::: {.columns align=center}

::: {.column width="50%"}
![Modelica. Модель. Конкуренция двух фирм. Cлучай I](image/MO.lab08-01.png)
:::

::: {.column width="50%"}
![Modelica. Модель. Конкуренция двух фирм. Cлучай II](image/MO.lab08-02.png)
:::

::::::::::::::

# Результаты

## Итог

Мы улучшили практические навыки в области дифференциальных уравнений, улучшили навыки моделирования на Julia, а также навыки моделирования на OpenModelica. Изучили и построили модель конкуренции двух фирм.

## {.standout}

Спасибо за внимание!
