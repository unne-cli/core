// note: import the specific variant directly!
import BaseTheme from '@voidzero-dev/vitepress-theme/src/viteplus';
import UnneTheme from './unne';
import type { Theme } from 'vitepress';

import Layout from './Layout.vue';
import './styles.css';

export default {
  extends: UnneTheme as unknown as any,
  Layout,
} satisfies Theme;
