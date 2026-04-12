# TCP tunnellar

TCP tunnellar mahalliy TCP xizmatlarni (ma'lumotlar bazalari, SSH, va boshqalar) masofaviy port orqali internetga ochish imkonini beradi.

## Tezkor foydalanish

```bash
# Mahalliy port = masofaviy port
unne tcp 5432

# Maxsus masofaviy port
unne tcp 5432 --remote-port 15432
```

Natija:

```
[quick] Connected: tcp://tunnel.example.com:5432 -> localhost:5432
```

## Port sozlamalari

### Standart (bir xil port)

Agar `--remote-port` ko'rsatilmasa, masofaviy port mahalliy port bilan bir xil bo'ladi:

```bash
unne tcp 5432
# Masofaviy: 5432, Mahalliy: 5432
```

### Maxsus masofaviy port

```bash
unne tcp 5432 --remote-port 15432
# yoki
unne tcp 5432 -rp 15432
```

### Konfiguratsiya fayli orqali

```yaml
tunnels:
  - name: postgres
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432
```

## Port cheklovlari

- Masofaviy port **1024 dan 65535** oralig'ida bo'lishi kerak
- Port allaqachon ishlatilayotgan bo'lsa, `STATUS_UNNE_PORT_UNAVAILABLE` xatosi qaytariladi
- Serverda tizim portlari (0-1023) TCP tunnellar uchun ruxsat etilmagan

## Foydalanish holatlari

### Ma'lumotlar bazasi ulanishi

```bash
# PostgreSQL
unne tcp 5432 --remote-port 15432

# Ulanish (boshqa kompyuterdan)
psql -h tunnel.example.com -p 15432 -U myuser mydb
```

### SSH ulanishi

```bash
# SSH serverni ochish
unne tcp 22 --remote-port 2222

# Ulanish
ssh user@tunnel.example.com -p 2222
```

### Redis

```bash
unne tcp 6379 --remote-port 16379

# Ulanish
redis-cli -h tunnel.example.com -p 16379
```

## Bir nechta TCP tunnellar

```yaml
tunnels:
  - name: postgres
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432

  - name: redis
    protocol: tcp
    remote_port: 16379
    upstream: localhost:6379

  - name: ssh
    protocol: tcp
    remote_port: 2222
    upstream: localhost:22
```

## TCP tunnel ishlash jarayoni

1. Mijoz serverga ulanadi va TCP tunnel so'raydi
2. Server ko'rsatilgan masofaviy portda tinglashni boshlaydi
3. Tashqi mijoz masofaviy portga ulanganida:
   - Server yangi yamux oqimi ochadi
   - Oqim orqali ma'lumotlar ikki tomonlama yo'naltiriladi
   - Mijoz ma'lumotlarni mahalliy xizmatga yo'naltiradi
4. Tunnel ulanishi uzilganida server portni yopadi

## Trafik kuzatuvi

TCP tunnellar uchun quyidagi ma'lumotlar kuzatiladi:

- Mijoz IP manzili
- Yuborilgan baytlar soni
- Qabul qilingan baytlar soni
- Ulanish davomiyligi
