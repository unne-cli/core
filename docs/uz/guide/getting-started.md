# Boshlash

## Talablar

- Umumiy IP manzilli VPS yoki server
- Wildcard DNS sozlangan domen (`*.yourdomain.com → server IP`)

## Tezkor sozlash

### 1. Serverni o'rnatish

VPS serveringizda:

```bash
# Bir qatorlik o'rnatish (OS/arxitekturani avtomatik aniqlaydi, sozlashni ishga tushiradi)
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

Yoki [GitHub Releases](https://github.com/unne-cli/core/releases) sahifasidan qo'lda yuklab oling.

Sozlash ustasi quyidagilarni so'raydi:
- Server domeni (masalan, `tunnel.example.com`)
- Boshqaruv porti (standart: `8222`)
- HTTP proksi porti (standart: `8223`)
- Admin panel sozlamalari
- Admin hisob ma'lumotlari

### 2. DNS sozlash

Wildcard DNS yozuvini serveringizga yo'naltiring:

```
*.tunnel.example.com → SIZNING_SERVER_IP
```

### 3. CLI o'rnatish

Mahalliy kompyuteringizda -- [Releases](https://github.com/unne-cli/core/releases) sahifasidan yuklab oling, keyin:

```bash
# Mijozni sozlash
unne setup
```

So'ralganda server manzili, port va autentifikatsiya tokenini kiriting.

### 4. Birinchi tunnelingizni yaratish

```bash
# Mahalliy veb-serverni ishga tushiring (misol)
python3 -m http.server 8080

# Boshqa terminalda tunnel yarating
unne http 8080
```

Mahalliy serveringiz endi `https://random.tunnel.example.com` manzilida ochiq.

## Keyingi qadamlar

- [CLI konfiguratsiyasi](/uz/cli/configuration) -- `unne.yml` konfiguratsiya fayllari haqida
- [HTTP tunnellar](/uz/cli/http-tunnels) -- Maxsus subdomenlar, bir nechta tunnellar
- [TCP tunnellar](/uz/cli/tcp-tunnels) -- Ma'lumotlar bazasi va SSH tunnellari
- [Server sozlash](/uz/server/setup) -- Batafsil server konfiguratsiyasi
- [Foydalanuvchilarni boshqarish](/uz/server/users) -- Foydalanuvchilar yaratish va limitlar o'rnatish
