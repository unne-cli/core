# Arxitektura

## Tizim ko'rinishi

```
┌─────────────────┐         ┌──────────────────────────┐
│   Unne CLI      │         │     Unne Server          │
│                 │   TCP   │                          │
│  Mahalliy xizmat│◄───────►│  Boshqaruv    (:8222)   │
│  TUI panel      │  yamux  │  HTTP proksi  (:8223)   │
│  Web inspektor  │         │  Admin panel  (:4041)   │
│                 │         │  TCP portlar  (dinamik)  │
└─────────────────┘         └──────────────────────────┘
```

## Ulanish jarayoni

### Handshake (v2)

```
Mijoz → Server:
  UNNE_HANDSHAKE:v2
  TOKEN:<auth_token>
  PROTOCOL:<http|tcp>
  SUBDOMAIN:<name>           # HTTP uchun
  REMOTE_PORT:<port>         # TCP uchun
  SKIP_WARNING:1             # ixtiyoriy

Server → Mijoz:
  UNNE_READY:<subdomain>     # HTTP muvaffaqiyatli
  UNNE_READY_TCP:<port>      # TCP muvaffaqiyatli
  STATUS_UNNE_*              # xato kodlari
```

### HTTP so'rov jarayoni

```
Brauzer → Server:8223 → Host sarlavhasidan subdomen ajratiladi
  → yamux sessiya qidirish → Oqim ochish → Mijozga yo'naltirish
  → Mijoz localhost:PORT ga yo'naltiradi → Javob qaytadi
```

### TCP so'rov jarayoni

```
TCP mijoz → Server:REMOTE_PORT → yamux oqimi ochiladi
  → Mijozga yo'naltirish → Mijoz localhost:PORT ga yo'naltiradi
  → Ikki tomonlama xom TCP yo'naltirish
```

## Ma'lumotlar saqlash

| Komponent | Saqlash | Maqsad |
|-----------|---------|--------|
| Server | SQLite (`unne.db`) | Foydalanuvchilar, tokenlar, sessiyalar, trafik loglari |
| Server | YAML (`config.yml`) | Server konfiguratsiyasi |
| Mijoz | YAML (`~/.unne/settings.yml`) | Global mijoz sozlamalari |
| Mijoz | YAML (`unne.yml`) | Loyihaga xos tunnel konfiguratsiyasi |
| Mijoz | Xotiradagi ring buffer | Tutib olingan HTTP almashinuvlar |

## Loyiha tuzilmasi

```
cmd/
  unne/main.go              # CLI mijoz kirish nuqtasi
  unns/main.go       # Server kirish nuqtasi
internal/
  config/                   # Mijoz konfiguratsiyasi
  tunnel/                   # Tunnel mijozi + HTTP tutib olish
  tui/                      # BubbleTea terminal interfeysi
  webui/                    # Mijoz tomonidagi web inspektor
  proxy/                    # SOCKS5/HTTP proksi dialer
  server/                   # Server yadrosi + HTTP handler
  store/                    # SQLite ma'lumotlar qatlami
  admin/                    # Admin panel WebUI
  setup/                    # Server sozlash ustasi + config CLI
```
