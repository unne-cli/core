# CLI konfiguratsiyasi

Unne CLI ikki darajali konfiguratsiya tizimidan foydalanadi: global sozlamalar va loyiha konfiguratsiyasi. Loyiha konfiguratsiyasi global sozlamalardan ustun turadi.

## Global sozlamalar

Joylashuv: `~/.unne/settings.yml`

`unne setup` buyrug'i orqali yaratiladi yoki qo'lda tahrirlanishi mumkin.

```yaml
version: "3"
server: tunnel.example.com
port: 8222
authtoken: your-auth-token-here
gui:
  tui: true
  webui: false
  webui_port: 4040
```

| Maydon | Tur | Standart | Tavsif |
|--------|-----|----------|--------|
| `version` | string | `"3"` | Konfiguratsiya formati versiyasi |
| `server` | string | | Unne Server domeni |
| `port` | int | `8222` | Boshqaruv porti |
| `authtoken` | string | | Autentifikatsiya tokeni |
| `gui.tui` | bool | `true` | TUI boshqaruv panelini yoqish |
| `gui.webui` | bool | `false` | Web inspektorni yoqish |
| `gui.webui_port` | int | `4040` | Web inspektor porti |

## Loyiha konfiguratsiyasi (`unne.yml`)

Loyiha papkasida joylashadi. Bir nechta tunnellarni aniqlash imkonini beradi.

```yaml
version: "3"
server: tunnel.example.com
port: 8222
authtoken: your-auth-token

gui:
  tui: true
  webui: true
  webui_port: 4040

proxy:
  url: socks5://127.0.0.1:1080

skip_warning: true

tunnels:
  - name: frontend
    protocol: http
    subdomain: myapp
    upstream: localhost:3000

  - name: api
    protocol: http
    subdomain: api
    upstream: localhost:8080

  - name: database
    protocol: tcp
    remote_port: 5432
    upstream: localhost:5432
```

### Tunnel konfiguratsiyasi

| Maydon | Tur | Tavsif |
|--------|-----|--------|
| `name` | string | Tunnel nomi (TUI da ko'rinadi) |
| `protocol` | string | `http` yoki `tcp` |
| `subdomain` | string | Istalgan subdomen (faqat HTTP, bo'sh bo'lsa tasodifiy) |
| `remote_port` | int | Masofaviy port (faqat TCP) |
| `upstream` | string | Mahalliy xizmat manzili (masalan, `localhost:3000`) |
| `proxy` | object | Tunnel uchun alohida proksi sozlamalari |

## Konfiguratsiya birlashtirish

Unne CLI konfiguratsiyalarni quyidagi tartibda birlashtiradi:

1. **Global sozlamalar** (`~/.unne/settings.yml`) bazaviy qiymatlar sifatida yuklanadi
2. **Loyiha konfiguratsiyasi** (`unne.yml`) bo'sh bo'lmagan qiymatlarni qayta yozadi
3. **Buyruq qatori parametrlari** eng yuqori ustuvorlikka ega

### Misol

Agar global sozlamalarda `server: a.com` va loyiha faylida `server: b.com` bo'lsa, `b.com` ishlatiladi.

## Buyruq qatori bilan ishlatish

```bash
# Maxsus konfiguratsiya fayl
unne start --config ./custom-config.yml

# Parametrlarni qayta yozish
unne http 3000 --subdomain myapp --proxy socks5://127.0.0.1:1080

# TUI ni o'chirish
unne start --no-tui

# Web inspektorni yoqish
unne start --webui --webui-port 5050
```
