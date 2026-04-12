# Error Pages

Unne Server shows styled error pages to browser visitors when something goes wrong.

## Page Types

### Warning Page (200)

Shown on the first browser visit to a tunnel. Asks the visitor to confirm they want to proceed.

**Bypass options:**
- Cookie `unne_confirmed_<subdomain>=1` (set automatically after confirming, lasts 24h)
- Header `X-Unne-Skip-Warning: 1`
- Non-browser User-Agent (API clients, curl, etc.)
- Client flag `--skip-warning` (if user has `skip_warning` permission)

### Not Found (404)

Shown when a subdomain has no active tunnel. Includes:
- Error code `ERR_UNNE_404`
- CLI command to fix the issue
- Refresh button

### Offline (502)

Shown when a tunnel is registered but the upstream is unreachable. This means:
- The CLI client is connected to the server
- But the local service is not running or not responding

### Generic Error

Shown for other errors with a custom error code and message.

## Design

All pages use a shadcn-inspired design:
- Clean white background
- Alert component with colored left border (red for errors, amber for warnings)
- Lucide icons
- Request ID badge for debugging
- Responsive layout

## Customization

Error page templates are embedded in the server binary at `internal/server/pages/`. To customize:

1. Fork the repository
2. Edit the HTML templates in `internal/server/pages/`
3. Modify styles in `internal/server/pages/base.css`
4. Rebuild the server binary

The CSS and HTML are embedded via Go's `embed.FS` — no external dependencies at runtime.
