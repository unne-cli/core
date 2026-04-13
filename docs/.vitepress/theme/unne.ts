import { VoidZeroTheme, themeContextKey } from "@voidzero-dev/vitepress-theme";
import type { Theme } from "vitepress";

// inject project variant assets
import logoDark from "/logo-light.svg";
import logoLight from "/logo-dark.svg";
import footerBg from "@voidzero-dev/vitepress-theme/src/assets/vitest/footer-background.jpg";
import monoIcon from "@voidzero-dev/vitepress-theme/src/assets/icons/vitest-mono.svg";

export default {
  ...VoidZeroTheme,
  enhanceApp(ctx) {
    ctx.app.provide(themeContextKey, {
      logoDark,
      logoLight,
      logoAlt: "Unne",
      footerBg,
      monoIcon,
    });
    VoidZeroTheme.enhanceApp(ctx)
  },
} satisfies Theme;
