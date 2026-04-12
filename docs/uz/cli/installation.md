# CLI o'rnatish

## Yuklab olish

[GitHub Releases](https://github.com/unne-cli/core/releases) sahifasidan operatsion tizim va arxitekturangizga mos versiyani yuklab oling.

### Mavjud platformalar

| Platforma | Arxitektura | Fayl nomi |
|-----------|-------------|-----------|
| Linux | amd64 | `unne-linux-amd64` |
| Linux | arm64 | `unne-linux-arm64` |
| macOS | amd64 (Intel) | `unne-darwin-amd64` |
| macOS | arm64 (Apple Silicon) | `unne-darwin-arm64` |
| Windows | amd64 | `unne-windows-amd64.exe` |

### Linux / macOS

```bash
# Yuklab olish (misolda linux-amd64)
curl -Lo unne https://github.com/unne-cli/core/releases/latest/download/unne-linux-amd64

# Bajarilishi mumkin qilish
chmod +x unne

# PATH ga ko'chirish
sudo mv unne /usr/local/bin/
```

### Windows

1. [Releases](https://github.com/unne-cli/core/releases) sahifasidan `unne-windows-amd64.exe` faylini yuklab oling
2. Faylni qulay papkaga joylashtiring
3. Papkani `PATH` muhit o'zgaruvchisiga qo'shing

## O'rnatishni tekshirish

```bash
unne version
```

Kutilgan natija:

```
Unne CLI v2.0.0 (linux/amd64)
```

## Dastlabki sozlash

O'rnatishdan keyin mijozni sozlang:

```bash
unne setup
```

Sozlash ustasi quyidagilarni so'raydi:

1. **Server** -- Unne Server domeni (masalan, `tunnel.example.com`)
2. **Port** -- Boshqaruv porti (standart: `8222`)
3. **Auth token** -- Administrator tomonidan berilgan autentifikatsiya tokeni

Sozlamalar `~/.unne/settings.yml` fayliga saqlanadi.

## Ulanishni tekshirish

```bash
unne check
```

Muvaffaqiyatli natija:

```
Checking tunnel.example.com:8222...
Server is reachable!
```

## Yangilash

Yangi versiyani yuklab olib, eski faylni almashtiring:

```bash
curl -Lo unne https://github.com/unne-cli/core/releases/latest/download/unne-linux-amd64
chmod +x unne
sudo mv unne /usr/local/bin/
```
