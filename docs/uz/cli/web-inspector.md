# Web inspektor

Web inspektor -- bu brauzer orqali foydalaniladigan so'rovlar kuzatuv vositasi bo'lib, Chrome DevTools Network paneli uslubida ishlaydi. U HTTP so'rovlar va javoblarni real vaqtda kuzatish imkonini beradi.

## Ishga tushirish

Buyruq qatori orqali:

```bash
# HTTP tunnel bilan
unne http 3000 --webui

# Maxsus port bilan
unne http 3000 --webui --webui-port 5050
```

`unne.yml` orqali:

```yaml
gui:
  webui: true
  webui_port: 4040
```

Ishga tushirilgandan so'ng:

```
WebUI available at http://localhost:4040
```

Brauzerni ochib `http://localhost:4040` manziliga o'ting.

## Imkoniyatlar

### So'rovlar ro'yxati

Asosiy sahifada barcha tutib olingan HTTP so'rovlari ro'yxati ko'rsatiladi:
- Vaqt belgisi
- HTTP usuli
- URL yo'li
- Host sarlavhasi
- Javob status kodi
- So'rov davomiyligi (millisekundlarda)

### So'rov tafsilotlari

Ro'yxatdan so'rovni tanlaganingizda batafsil ma'lumotlar ko'rsatiladi:
- **So'rov sarlavhalari** -- barcha HTTP so'rov sarlavhalari
- **Javob sarlavhalari** -- barcha HTTP javob sarlavhalari
- **So'rov tanasi** -- yuborilgan ma'lumotlar
- **Javob tanasi** -- qabul qilingan ma'lumotlar

### Real vaqtda yangilanish

Web inspektor WebSocket orqali yangi so'rovlarni real vaqtda oladi. Sahifani qayta yuklash shart emas -- yangi so'rovlar avtomatik ravishda ro'yxatga qo'shiladi.

### Tunnel bo'yicha filtrlash

Bir nechta tunnel ishlatganda, `tunnel` parametri orqali ma'lum bir tunnelning so'rovlarini filtrlash mumkin.

## API endpointlari

Web inspektor quyidagi API endpointlarni taqdim etadi:

| Endpoint | Usul | Tavsif |
|----------|------|--------|
| `/api/requests` | GET | Barcha so'rovlar ro'yxati |
| `/api/requests?tunnel=<name>` | GET | Tunnel bo'yicha filtrlangan so'rovlar |
| `/api/requests/<id>` | GET | Bitta so'rovning tafsilotlari |
| `/api/ws` | WebSocket | Real vaqtda yangi so'rovlar oqimi |

### So'rov javob formati

```json
{
  "id": "a1b2c3d4e5f6",
  "tunnel_name": "frontend",
  "client_ip": "192.168.1.1",
  "timestamp": 1700000000000,
  "duration_ms": 45,
  "protocol": "http",
  "method": "GET",
  "path": "/api/users",
  "host": "myapp.tunnel.example.com",
  "status_code": 200,
  "req_headers": {
    "Content-Type": "application/json"
  },
  "res_headers": {
    "Content-Type": "application/json"
  },
  "req_body": "...",
  "res_body": "..."
}
```

## Xotira boshqaruvi

Web inspektor xotiradagi ring buffer dan foydalanadi. Standart holatda oxirgi **1000** ta so'rov saqlanadi. Yangi so'rovlar kelganida eng eski so'rovlar o'chiriladi.

## TUI bilan birgalikda ishlatish

Web inspektor va TUI bir vaqtda ishlatilishi mumkin:

```bash
unne http 3000 --webui
```

Bu holatda terminalda TUI ko'rinadi, brauzerda esa web inspektor ishlaydi.
