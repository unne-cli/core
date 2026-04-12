# Token Management

Tokens are authentication credentials that CLI clients use to connect to the server. Each token is bound to a user and optionally to a device.

## CLI Commands

```bash
# Generate a token for user ID 1
unns token gen 1

# Generate with device name
unns token gen 1 macbook-pro

# List all tokens
unns token list

# List tokens for a specific user
unns token list 1

# Revoke a token
unns token revoke 3
```

## Token Properties

| Field | Description |
|-------|-------------|
| `hash` | SHA-256 hash (stored, never plaintext) |
| `user_id` | Owner user |
| `device_name` | Optional device identifier |
| `enabled` | Active or revoked |
| `created_at` | Creation timestamp |
| `last_used` | Last successful authentication |

## How Tokens Work

1. Admin generates a token → raw token is shown once
2. Token is given to the user
3. User runs `unne setup` and enters the token
4. CLI sends the token during handshake
5. Server hashes it and looks up the hash in the database
6. Token inherits all limits from its parent user

## Token = Device

When `max_devices` is set on a user, each token counts as one device. If a user has `max_devices=2`, they can have at most 2 active tokens connecting simultaneously.

## Security

- Tokens are stored as SHA-256 hashes only
- The raw token is displayed once at generation and never stored
- Revoking a token immediately disconnects the client
- Tokens can be managed via CLI or [Admin Panel](/server/admin-panel)
