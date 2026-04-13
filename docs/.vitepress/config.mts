import { resolve } from 'node:path';

import type { VoidZeroThemeConfig } from '@voidzero-dev/vitepress-theme';
import { extendConfig } from '@voidzero-dev/vitepress-theme/config';
import { defineConfig, type HeadConfig } from 'vitepress';
const guideSidebar = [
  {
    text: 'Introduction',
    items: [
      { text: 'What is Unne?', link: '/guide/' },
      { text: 'Getting Started', link: '/guide/getting-started' },
      { text: 'Architecture', link: '/guide/architecture' },
    ],
  },
];

const cliSidebar = [
  {
    text: 'Unne CLI',
    items: [
      { text: 'Overview', link: '/cli/' },
      { text: 'Installation', link: '/cli/installation' },
      { text: 'Configuration', link: '/cli/configuration' },
      { text: 'HTTP Tunnels', link: '/cli/http-tunnels' },
      { text: 'TCP Tunnels', link: '/cli/tcp-tunnels' },
      { text: 'TUI Dashboard', link: '/cli/tui' },
      { text: 'Web Inspector', link: '/cli/web-inspector' },
      { text: 'Proxy Support', link: '/cli/proxy' },
      { text: 'Error Codes', link: '/cli/error-codes' },
    ],
  },
];

const serverSidebar = [
  {
    text: 'Unne Server',
    items: [
      { text: 'Overview', link: '/server/' },
      { text: 'Installation', link: '/server/installation' },
      { text: 'Setup', link: '/server/setup' },
      { text: 'Configuration', link: '/server/configuration' },
      { text: 'User Management', link: '/server/users' },
      { text: 'Token Management', link: '/server/tokens' },
      { text: 'Admin Panel', link: '/server/admin-panel' },
      { text: 'Limits & Quotas', link: '/server/limits' },
      { text: 'Error Pages', link: '/server/error-pages' },
      { text: 'API Reference', link: '/server/api' },
    ],
  },
];

export default extendConfig(
  defineConfig({
    title: 'Unne',
    titleTemplate: ':title | Self-Hosted Tunnel Solution',
    description: 'Self-Hosted Tunnel Solution',
    cleanUrls: true,
    head: [
      ['link', { rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg' }],
      ['meta', { name: 'theme-color', content: '#0029CC' }],
      ['meta', { property: 'og:type', content: 'website' }],
      ['meta', { property: 'og:site_name', content: 'Unne' }],
    ],
    vite: {
      resolve: {
        tsconfigPaths: true,
        alias: [
          { find: '@local-assets', replacement: resolve(__dirname, 'theme/assets') },
          { find: '@layouts', replacement: resolve(__dirname, 'theme/layouts') },
        ],
      },
    },
    themeConfig: {
      variant: 'viteplus' as VoidZeroThemeConfig['variant'],
      nav: [
        {
          text: 'Guide',
          link: '/guide/',
          activeMatch: '^/guide/',
        },
        {
          text: 'CLI',
          link: '/cli/',
          activeMatch: '^/cli/',
        },
        {
          text: 'Server',
          link: '/server/',
          activeMatch: '^/server/',
        },
      ],
      sidebar: {
        '/guide/': guideSidebar,
        '/cli/': cliSidebar,
        '/server/': serverSidebar,
      },
      socialLinks: [
        { icon: 'github', link: 'https://github.com/unne-cli/core' },
      ],
      outline: {
        level: [2, 3],
      },
      search: {
        provider: 'local',
      },
      footer: {
        copyright: `© ${new Date().getFullYear()} Unne. Released under the MIT License.`,
        // nav: [],
        // social: [
        //   { icon: "github", link: "https://github.com/unne-cli/core" },
        // ],
      }
    },
  }),
);
