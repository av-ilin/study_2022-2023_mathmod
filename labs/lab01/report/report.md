---
# Front matter
lang: ru-RU
title: "Лабораторная работа №1"
subtitle: "GitHub. Markdown"
author: "Ильин Андрей Владимирович"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
lof: true # Список изображений
lot: false # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: lualatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы
Создать каталоги для работы. Создать рабочее пространство для лабораторной работы. Создать репозиторий. Написать отчет, используя средства markdown.

# Термины
* [2] Система контроля версий (СКВ) — это система, регистрирующая изменения в одном или нескольких файлах с тем, чтобы в дальнейшем была возможность вернуться к определённым старым версиям этих файлов.

* [1] Репозиторий (Репозиторий Git) — это папка, в которую Git отслеживает изменения. На компьютере может быть любое количество репозиториев, каждое из которых хранится в собственной папке. Каждый репозиторий Git в системе является независимым, поэтому изменения, сохраненные в одном репозитории Git, не влияют на содержимое другого.

* [1] Markdown — это облегченный язык разметки с синтаксисом форматирования обычного текста. 

* [3] Pandoc — это бесплатный конвертер документов с открытым исходным кодом, широко используемый в качестве инструмента написания (особенно учеными) и в качестве основы для публикации рабочих процессов.

# Выполнение лабораторной работы.
1. В домашнем каталоге создаём подкаталог ~/work. (рис. 1)
```
mkdir work/study/2022-2023/Математическое моделирование/mathmod
```
![Подготовка рабочей среды](image/01.png)
   
2. Создадим пустой репозиторий с названием study_2022-2023_mathmod. (рис. 2)
   
![Создание репозитория](image/02.png)

3. В рабочем каталоге создадим необходимые файлы. (рис. 3)
```
touch LICENSE.md
touch CHANGELOG.md
touch README.md
touch .gitignore
```
![Создание README.md, .gitignore, CHANGELOG.md, LICENSE.md](image/03.png)

4. Заполняем вышеуказанные файлы первичной информацией. В .gitignore указываем элементы для языка Julia. (рис. 4)

![.gitignore для Julia](image/04.png)

5. Сгенерируем токен, для того чтобы отправить коммит с локальной машины на сервер. (рис. 5)

![Git Token Classic](image/05.png)

1. Инициализируем git в рабочем каталоге и делаем первый коммит. (рис. 6 - 7)
```
git init
git add LICENSE.md
git add CHANGELOG.md
git add README.md
git add .gitignore
git commit -m "init commit"
git branch -M main
git remote add origin https://github.com/av-ilin/study_2022-2023_mathmod.git
git push https://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@github.com/av-ilin/study_2022-2023_mathmod.git
```
![Init commit (local)](image/06.png)

![Init commit (git)](image/07.png)

7. Создадим в рабочем каталоге папку labs, а также group-project. В папке labs в свою очередь создадим каталог lab01, в котором расположим report.md. (рис. 8)
```
mkdir -p labs/lab01
cd labs/lab01/
touch report.md
```
![Создание report.md](image/08.png)

8. Создадим коммит, пока пустого отчета. (рис. 9)
``` 
git add labs/lab01/report.md 
git commit -m "empty report"
git push https://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@github.com/av-ilin/study_2022-2023_mathmod.git
```
![Commit report.md](image/09.png)

9. Приступим к написанию отчета на markdown. Напишем титульный лист и необходимые настройки. (рис. 10)
   
![Markdown Title](image/10.png)

10. Для заголовков воспользуемся `#`. (рис. 11)
   
![Headers](image/11.png)

11.  Для создания списков воспользуемся семантикой: "1. 2. ...". (рис. 12)
   
![List](image/12.png)

12.  Вставим в наш отчет изображения. (рис. 13)

![Image](image/13.png)

13.  Конвертируем отчет в нужные форматы при помощи pandoc. (рис. 14 - 15)
```
pandoc report.md -o report.pdf
pandoc report.md -o report.docx
```
![Markdown to PDF](image/14.png)

![PDF](image/15.png)


# Анализ результатов
Работа выполненна без непредвиденных проблем в соответствии с руководством. Ошибок и сбоев не произошло.

# Выводы
Мы приобрели практические навыки работы с github и markdown. Создали репозиторий для хранения работ данной дисциплины.

# Библиография
* [1] docs.microsoft.com
* [2] github.com
* [3] en.wikipedia.org
