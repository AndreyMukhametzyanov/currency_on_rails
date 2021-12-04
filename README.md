# Currency API

Необходимо реализовать сервис со следующим функционалом на Ruby on Rails.

В базе данных (желательно применить Postgresql) должна быть таблица currency c колонками:
- id — первичный ключ
- name — название валюты
- rate — курс валюты к рублю

Должна быть Rake таска для обновления данных в таблице currency.

Данные по курсам валют можно взять отсюда: http://www.cbr.ru/scripts/XML_daily.asp

Реализовать 2 REST API метода:
- GET /currencies — должен возвращать список курсов валют с возможностью пагинации
- GET /currencies/:char_code — должен возвращать курс валюты для переданного char_code

Ответ должен быть в формате JSON.
Наличие тестов обязательно.
API должно быть закрыто bearer авторизацией.

Запуск:

- Создать БД
```shell
rails db:create
```

- Запустить миграции
```shell
rails db:migrate
```

- Запустить сервер
```shell
rails s
```

- Для загрузки валют в бд необходимо отправить POST запрос
```shell
POST http://localhost:3000/currencies/load
Content-Type: application/json
```

- Получить значение всех валют
```shell
GET http://localhost:3000/currencies
```

- Получение конкретной валюты на примере Доллара
```shell
GET http://localhost:3000/currencies/USD
```

- Обновить значение валют
```shell
 POST http://localhost:3000/currencies/update_rates
 Content-Type: application/json
```

