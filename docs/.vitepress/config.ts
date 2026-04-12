import { defineConfig } from 'vitepress'

const guideSidebar = (prefix: string) => [
  {
    text: prefix === '/' ? 'Introduction' : '',
    items: [
      { text: t(prefix, 'What is Unne?', 'Что такое Unne?', 'Unne nima?', 'Unne деген не?', "Qu'est-ce qu'Unne?", 'ما هو Unne؟', '什么是Unne？'), link: `${prefix}guide/what-is-unne` },
      { text: t(prefix, 'Getting Started', 'Быстрый старт', 'Boshlash', 'Бастау', 'Démarrage', 'البداية السريعة', '快速开始'), link: `${prefix}guide/getting-started` },
      { text: t(prefix, 'Architecture', 'Архитектура', 'Arxitektura', 'Архитектура', 'Architecture', 'الهندسة المعمارية', '架构'), link: `${prefix}guide/architecture` },
    ]
  },
]

const cliSidebar = (prefix: string) => [
  {
    text: 'Unne CLI',
    items: [
      { text: t(prefix, 'Overview', 'Обзор', 'Umumiy', 'Шолу', 'Aperçu', 'نظرة عامة', '概述'), link: `${prefix}cli/overview` },
      { text: t(prefix, 'Installation', 'Установка', "O'rnatish", 'Орнату', 'Installation', 'التثبيت', '安装'), link: `${prefix}cli/installation` },
      { text: t(prefix, 'Configuration', 'Конфигурация', 'Sozlamalar', 'Баптау', 'Configuration', 'الإعداد', '配置'), link: `${prefix}cli/configuration` },
      { text: t(prefix, 'HTTP Tunnels', 'HTTP туннели', 'HTTP tunnellar', 'HTTP туннельдер', 'Tunnels HTTP', 'أنفاق HTTP', 'HTTP隧道'), link: `${prefix}cli/http-tunnels` },
      { text: t(prefix, 'TCP Tunnels', 'TCP туннели', 'TCP tunnellar', 'TCP туннельдер', 'Tunnels TCP', 'أنفاق TCP', 'TCP隧道'), link: `${prefix}cli/tcp-tunnels` },
      { text: t(prefix, 'TUI Dashboard', 'TUI дашборд', 'TUI boshqaruv paneli', 'TUI басқару тақтасы', 'Tableau de bord TUI', 'لوحة TUI', 'TUI仪表盘'), link: `${prefix}cli/tui` },
      { text: t(prefix, 'Web Inspector', 'Веб инспектор', 'Web inspektor', 'Веб инспектор', 'Inspecteur Web', 'مفتش الويب', 'Web检查器'), link: `${prefix}cli/web-inspector` },
      { text: t(prefix, 'Proxy Support', 'Прокси', 'Proksi', 'Прокси', 'Proxy', 'البروكسي', '代理支持'), link: `${prefix}cli/proxy` },
      { text: t(prefix, 'Error Codes', 'Коды ошибок', 'Xato kodlari', 'Қате кодтары', "Codes d'erreur", 'رموز الخطأ', '错误码'), link: `${prefix}cli/error-codes` },
    ]
  },
]

const serverSidebar = (prefix: string) => [
  {
    text: 'Unne Server',
    items: [
      { text: t(prefix, 'Overview', 'Обзор', 'Umumiy', 'Шолу', 'Aperçu', 'نظرة عامة', '概述'), link: `${prefix}server/overview` },
      { text: t(prefix, 'Installation', 'Установка', "O'rnatish", 'Орнату', 'Installation', 'التثبيت', '安装'), link: `${prefix}server/installation` },
      { text: t(prefix, 'Setup', 'Настройка', 'Sozlash', 'Баптау', 'Configuration', 'الإعداد', '设置'), link: `${prefix}server/setup` },
      { text: t(prefix, 'Configuration', 'Конфигурация', 'Konfiguratsiya', 'Конфигурация', 'Configuration', 'التكوين', '配置'), link: `${prefix}server/configuration` },
      { text: t(prefix, 'User Management', 'Пользователи', 'Foydalanuvchilar', 'Пайдаланушылар', 'Utilisateurs', 'إدارة المستخدمين', '用户管理'), link: `${prefix}server/users` },
      { text: t(prefix, 'Token Management', 'Токены', 'Tokenlar', 'Токендер', 'Jetons', 'إدارة الرموز', '令牌管理'), link: `${prefix}server/tokens` },
      { text: t(prefix, 'Admin Panel', 'Админ панель', 'Admin panel', 'Админ панель', "Panneau d'admin", 'لوحة الإدارة', '管理面板'), link: `${prefix}server/admin-panel` },
      { text: t(prefix, 'Limits & Quotas', 'Лимиты', 'Limitlar', 'Лимиттер', 'Limites', 'الحدود', '限制'), link: `${prefix}server/limits` },
      { text: t(prefix, 'Error Pages', 'Страницы ошибок', 'Xato sahifalari', 'Қате беттері', "Pages d'erreur", 'صفحات الخطأ', '错误页面'), link: `${prefix}server/error-pages` },
      { text: t(prefix, 'API Reference', 'API справочник', 'API hujjat', 'API анықтама', 'Référence API', 'مرجع API', 'API参考'), link: `${prefix}server/api` },
    ]
  },
]

function t(prefix: string, en: string, ru: string, uz: string, kz: string, fr: string, ar: string, zh: string) {
  const map: Record<string, string> = { '/': en, '/ru/': ru, '/uz/': uz, '/kz/': kz, '/fr/': fr, '/ar/': ar, '/zh/': zh }
  return map[prefix] || en
}

export default defineConfig({
  title: 'Unne',
  description: 'Self-hosted tunnel solution',
  head: [['link', { rel: 'icon', type: 'image/svg+xml', href: '/logo.svg' }]],

  locales: {
    root: {
      label: 'English',
      lang: 'en',
      themeConfig: {
        nav: [
          { text: 'Guide', link: '/guide/getting-started' },
          { text: 'CLI', link: '/cli/overview' },
          { text: 'Server', link: '/server/overview' },
        ],
        sidebar: { '/guide/': guideSidebar('/'), '/cli/': cliSidebar('/'), '/server/': serverSidebar('/') },
      }
    },
    ru: {
      label: 'Русский',
      lang: 'ru',
      themeConfig: {
        nav: [
          { text: 'Руководство', link: '/ru/guide/getting-started' },
          { text: 'CLI', link: '/ru/cli/overview' },
          { text: 'Сервер', link: '/ru/server/overview' },
        ],
        sidebar: { '/ru/guide/': guideSidebar('/ru/'), '/ru/cli/': cliSidebar('/ru/'), '/ru/server/': serverSidebar('/ru/') },
      }
    },
    uz: {
      label: "O'zbek",
      lang: 'uz',
      themeConfig: {
        nav: [
          { text: "Qo'llanma", link: '/uz/guide/getting-started' },
          { text: 'CLI', link: '/uz/cli/overview' },
          { text: 'Server', link: '/uz/server/overview' },
        ],
        sidebar: { '/uz/guide/': guideSidebar('/uz/'), '/uz/cli/': cliSidebar('/uz/'), '/uz/server/': serverSidebar('/uz/') },
      }
    },
    kz: {
      label: 'Қазақша',
      lang: 'kk',
      themeConfig: {
        nav: [
          { text: 'Нұсқаулық', link: '/kz/guide/getting-started' },
          { text: 'CLI', link: '/kz/cli/overview' },
          { text: 'Сервер', link: '/kz/server/overview' },
        ],
        sidebar: { '/kz/guide/': guideSidebar('/kz/'), '/kz/cli/': cliSidebar('/kz/'), '/kz/server/': serverSidebar('/kz/') },
      }
    },
    fr: {
      label: 'Français',
      lang: 'fr',
      themeConfig: {
        nav: [
          { text: 'Guide', link: '/fr/guide/getting-started' },
          { text: 'CLI', link: '/fr/cli/overview' },
          { text: 'Serveur', link: '/fr/server/overview' },
        ],
        sidebar: { '/fr/guide/': guideSidebar('/fr/'), '/fr/cli/': cliSidebar('/fr/'), '/fr/server/': serverSidebar('/fr/') },
      }
    },
    ar: {
      label: 'العربية',
      lang: 'ar',
      dir: 'rtl',
      themeConfig: {
        nav: [
          { text: 'الدليل', link: '/ar/guide/getting-started' },
          { text: 'CLI', link: '/ar/cli/overview' },
          { text: 'الخادم', link: '/ar/server/overview' },
        ],
        sidebar: { '/ar/guide/': guideSidebar('/ar/'), '/ar/cli/': cliSidebar('/ar/'), '/ar/server/': serverSidebar('/ar/') },
      }
    },
    zh: {
      label: '中文',
      lang: 'zh-CN',
      themeConfig: {
        nav: [
          { text: '指南', link: '/zh/guide/getting-started' },
          { text: 'CLI', link: '/zh/cli/overview' },
          { text: '服务器', link: '/zh/server/overview' },
        ],
        sidebar: { '/zh/guide/': guideSidebar('/zh/'), '/zh/cli/': cliSidebar('/zh/'), '/zh/server/': serverSidebar('/zh/') },
      }
    },
  },

  themeConfig: {
    logo: '/logo.svg',
    socialLinks: [
      { icon: 'github', link: 'https://github.com/unne-cli/core' },
    ],
    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright 2024-present Unne',
    },
    search: { provider: 'local' },
  },
})
