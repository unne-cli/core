# Contributing to Unne Docs

Thank you for your interest in contributing to Unne documentation!

## Translations

We welcome translations into any language. Currently supported:

| Language | Code | Status            |
|----------|------|-------------------|
| English  | `en` | Complete          |
| Русский  | `ru` | Partial           |
| O'zbek   | `uz` | Needs translation |
| Қазақша  | `kz` | Needs translation |
| Français | `fr` | Needs translation |
| العربية  | `ar` | Needs translation |
| 中文       | `zh` | Needs translation |

### How to translate

1. Fork the [unne-cli/core](https://github.com/unne-cli/core) repository
2. Find the page you want to translate in `docs/<lang>/`
3. Replace the stub content with the translated version
4. Use the English version (`docs/`) as reference
5. Submit a Pull Request

### Translation guidelines

- Keep code blocks, commands, and technical terms (like `unne`, `unns`, `yaml`) unchanged
- Translate UI text, descriptions, and explanations
- Keep the same Markdown structure and headings
- For RTL languages (Arabic), the `dir: rtl` is already configured

### Adding a new language

1. Create a new directory `docs/<lang-code>/`
2. Add the locale config in `docs/.vitepress/config.ts`
3. Copy the English pages and translate them
4. Submit a PR

## Documentation

- Docs use [VitePress](https://vitepress.dev/)
- Run locally: `cd docs && bun install && bun run dev`
- Build: `bun run build`

## Reporting Issues

Open an issue on [GitHub](https://github.com/unne-cli/core/issues) for:
- Documentation errors
- Missing translations
- Unclear instructions
