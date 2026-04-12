# Быстрый старт

## Требования

- VPS или сервер с публичным IP-адресом
- Домен с wildcard DNS (`*.yourdomain.com → IP сервера`)

## Быстрая установка

### 1. Установите сервер

На вашем VPS:

```bash
# Установка одной командой (определяет OS/arch автоматически)
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

Или скачайте бинарник вручную из [GitHub Releases](https://github.com/unne-cli/core/releases).

### 2. Настройте DNS

Добавьте wildcard DNS запись:

```
*.tunnel.example.com → IP_ВАШЕГО_СЕРВЕРА
```

### 3. Установите CLI

Скачайте из [Releases](https://github.com/unne-cli/core/releases), затем:

```bash
unne setup
```

Введите адрес сервера, порт и токен авторизации.

### 4. Создайте первый туннель

```bash
# Запустите локальный сервер
python3 -m http.server 8080

# Создайте туннель
unne http 8080
```

Ваш сервис доступен по адресу `https://random.tunnel.example.com`.

## Что дальше?

- [Конфигурация CLI](/ru/cli/configuration)
- [HTTP туннели](/ru/cli/http-tunnels)
- [TCP туннели](/ru/cli/tcp-tunnels)
- [Настройка сервера](/ru/server/setup)
- [Управление пользователями](/ru/server/users)
