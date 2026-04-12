# Translations

Unne documentation is available in the following languages. Help us translate!

## Available Languages

| Language | Link | Status | Maintainer |
|----------|------|--------|------------|
| **English** | [Docs](/) | Complete | Core Team |
| **Русский** | [Документация](/ru/) | Complete | Core Team |
| **O'zbek** | [Hujjatlar](/uz/) | Complete | Community |
| **Қазақша** | [Құжаттама](/kz/) | Complete | Community |
| **Français** | [Documentation](/fr/) | Complete | Community |
| **العربية** | [التوثيق](/ar/) | Complete | Community |
| **中文** | [文档](/zh/) | Complete | Community |

## Help Us Translate

We welcome contributions to improve existing translations or add new languages.

### How to Contribute

1. **Fork** the [unne-cli/core](https://github.com/unne-cli/core) repository
2. **Find** the page you want to improve in `docs/<lang>/`
3. **Edit** the translation — use the English version (`docs/`) as reference
4. **Submit** a Pull Request

### Translation Guidelines

- Keep **code blocks**, commands, and technical terms (`unne`, `unns`, `yaml`, `yamux`) unchanged
- Keep the same **Markdown structure** — headings, tables, lists
- Translate **UI text**, descriptions, and explanations naturally
- For **RTL languages** (Arabic), the `dir: rtl` is already configured in VitePress
- Use the **native script** for each language (Cyrillic for Russian/Kazakh, Latin for Uzbek/French, etc.)

### Adding a New Language

Want to add a language we don't support yet?

1. Create a new directory: `docs/<lang-code>/`
2. Copy all English pages into it
3. Translate the pages
4. Add locale config in `docs/.vitepress/config.ts`:

```ts
// In the locales section:
xx: {
  label: 'Your Language',
  lang: 'xx',
  themeConfig: {
    nav: [...],
    sidebar: {...},
  }
}
```

5. Submit a PR — we'll review and merge!

### Translation Priorities

If you're looking for where to start, prioritize these pages:

1. `guide/getting-started.md` — most visited page
2. `guide/what-is-unne.md` — introduction
3. `cli/overview.md` — CLI reference
4. `server/installation.md` — server setup
5. `cli/configuration.md` — config reference

### Quality Standards

- Translations should read naturally — not word-for-word machine translation
- Technical accuracy is more important than literary style
- When in doubt, keep the English term with a brief explanation in parentheses
- Test your changes locally: `cd docs && bun run dev`

## Contact

- Open an [issue](https://github.com/unne-cli/core/issues) for translation questions
- Tag your PR with `translation` label
