# [похавай.рф](https://похавай.рф)

Веб-сайт "Студенческая столовая" &mdash; отборочное задание [BEST Hack'19](https://vk.com/besthack2019).

## Использование

На главной странице сайта [похавай.рф](https://похавай.рф) можно выбрать заведение (Нажать на кнопку "Подробнее").
На странице заведения представлена информация о заведении и меню на сегодняшний день. 

Чтобы добавить блюдо в "корзину", необходимо нажать на иконку корзины рядом с изображением блюда.

Чтобы перейти в "корзину", нужно нажать на иконку карзины в правом нижнем углу страницы заведения. В корзине можно посмотреть общую стоимость и КБЖУ выбранных блюд, а также редактировать заказ.

Для внесения изменений (добавление новых заведений, корректировка меню) нужно воспользоваться панелью администратора, которая находится по адресу [похавай.рф/admin/](https://похавай.рф/admin/).

Данные для входа в административную панель мы указали в тексте письма.

## Технологии
* [React](https://reactjs.org/) &mdash; современная JS-библиотека для разработки пользовательских интерфейсов.
* [Material-UI](https://material-ui.com/) &mdash; React UI фреймворк для воплощения [Material Design](https://material.io/).
* [Django](https://www.djangoproject.com/) &mdash; фреймворк для веб-приложений на Python, предалагющий хорошую админку из коробки, ORM и реализующий MVC.
* [PostgreSQL](https://www.postgresql.org/) &mdash; объектно-реляционная СУБД.

## Запуск локальной версии проекта*

#### 1. Склонировать репозиторий

#### 2. Создать и запустить виртуальное окружение
```
$ python -m venv server/venv
$ source server/venv/bin/activate
```

#### 3. Установить зависимости
```
$ pip install -r requirements.txt
$ npm install
```

#### 4. Создать базу данных
Зайти в консоль postgres:
```
$ sudo -u postgres psql
```

И выполнить следующие команды:
```postgresql
create user solid_happines with password 'qwerty';
alter role solid_happines set client_encoding to 'utf8';
alter role solid_happines set default_transaction_isolation to 'read committed';
alter role solid_happines set timezone to 'Europe/Moscow';
create database solid_happines_db owner solid_happines;
```

#### 5. Заполнить базу данных
```
$ sudo -u postgres psql solid-happines_db < fixtures/dump.pgsql
$ mkdir media
$ cp -r fixtures/pictures/* media
```

#### 6. Запустить проект
В первой консоли запустить сборку клиентской части:
```
$ npm run start
```
Во второй консоли запустить django-сервер:
```
$ python server/manage.py runserver
```

*на Ubuntu 16.04/18.04

## Авторы
Название команды: **solid-happiness**

Состав команды:
* **Алесин Александр** &mdash; капитан команды
* **Туманов Иван**
* **Чебаков Дмитрий**

Направление: **WEB**
