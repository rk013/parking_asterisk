# Описание данной сборки

Сборка основанна на следующих компонентах:

- Docker compose

- Git

- Bash

# Как установить


Скачать проект с Github и запустить настройку и установку:

```bash
  git clone https://github.com/rk013/parking_asterisk
  cd parking_asterisk/compose
  ./run_stack.sh
```

Примем для примера, что текущая сеть в которой будет создан Asterisk **10.66.8.0/24** и наш IP **10.66.8.50**, следовательно, мы оставим без имзменений **Subnet**, **Gateway**, **Ethernet interface**, **Docker Network Name**. Задаём только **Asterisk address**, в этом случае 10.66.8.50 (случай зависит только от конкретных настроек сети на объекте)

```bash
Get main interface

Subnet (default 10.66.8.0/24): 
Gateway (default 10.66.8.1): 
Asterisk address: 10.66.8.50
Ethernet interface (default enp0s31f6): 
Docker Network Name: (default vip-50): 
```

Скрипт создаёт MACVLAN в Docker и запустит два контейнера, один с БД Postgres для хранения CDR и второй с Asterisk 18.3.

# Описание Asterisk

1. Будет создано по умолчанию 5 пользователь с **5001-5005**, с случайно созданными паролями. Пароли создаются только один раз при первом создании сервиса docker swarm. Все последующие пересоздания сервиса, не будут перетерать пароли и конфигурацию, т.к. она будет храниться в отдельном Volume в Docker. И один логин **6001**  для подключения телефонного аппарата, на который будет уходит вызов с панелей быстрого набора.
2. Драйвер для SIP в данной сборке выран и установлен **chan_pjsip**, следовательно **transport** и шаблоны пользователей созданы в **pjsip.conf**, пользователи прописаны в **pjsip_endpoints.conf**, а транки до остальных АТС в **pjsip_trunk.conf**.
3. Только настроена возможность звонить с **5001-5005** на **6001**.

# Настройка конфигурации в Asterisk

Что настроить конфигурацию в Asterisk нужно зайти в запущенный docker с Asterisk.

```bash
  docker exec -ti callcenter-asterisk-1 bash
```
Мы оказываемся внутри контейнера, где можем менять конфигурацию в по стандартному пути **/etc/asterisk** .  И так же пользоваться консолью **asterisk -rvvv** для применения.
