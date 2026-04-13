<template>
  <section id="feature-options" class="wrapper border-t grid md:grid-cols-2 divide-x divide-nickel">
    <div class="px-5 py-6 md:p-10 flex flex-col justify-between gap-15">
      <div class="flex flex-col gap-5">
        <span class="text-grey text-xs font-mono uppercase tracking-wide">options</span>
        <h4 class="text-white">Flexible CLI options</h4>
        <p class="text-white/70 text-base max-w-[25rem] text-pretty">
          Fine-tune every tunnel with powerful flags for subdomains, proxy, TUI, web inspector, and more.
        </p>
        <ul class="checkmark-list">
          <li><code class="mr-1 outline-none bg-nickel/50 text-aqua">--subdomain</code> custom subdomain</li>
          <li><code class="mr-1 outline-none bg-nickel/50 text-aqua">--proxy</code> SOCKS5/HTTP proxy</li>
          <li><code class="mr-1 outline-none bg-nickel/50 text-aqua">--no-tui</code> log-only mode</li>
          <li><code class="mr-1 outline-none bg-nickel/50 text-aqua">--webui</code> web inspector</li>
        </ul>
      </div>
    </div>
    <div class="flex flex-col min-h-[22rem] sm:min-h-[30rem]">
      <div class="bg-feature pl-10 h-full flex flex-col justify-center overflow-clip">
        <div
          class="mr-5 sm:mr-10 px-5 py-6 relative bg-slate rounded-tl rounded-bl outline-1 outline-offset-[2px] outline-white/20 font-mono text-sm leading-[1.5rem] text-white"
        >
          <div class="text-white">$ unne</div>
          <div class="h-4" />
          <div class="text-grey"><span class="terminal-blue">Unne CLI v2.0.1</span> - Self-hosted tunnel solution</div>
          <div class="h-2" />
          <div class="text-grey">Options:</div>
          <div class="text-grey">  <span class="text-white">--config, -c &lt;path&gt;</span>          Config file path</div>
          <div class="text-grey">  <span class="text-white">--subdomain, -s &lt;name&gt;</span>       Desired subdomain</div>
          <div class="text-grey">  <span class="text-white">--remote-port, -rp &lt;port&gt;</span>    Remote port (tcp)</div>
          <div class="text-grey">  <span class="text-white">--proxy, -p &lt;url&gt;</span>            Proxy URL</div>
          <div class="text-grey">  <span class="text-white">--skip-warning, --sw</span>          Skip browser warning</div>
          <div class="text-grey">  <span class="text-white">--no-tui</span>                      Disable TUI</div>
          <div class="text-grey">  <span class="text-white">--webui, -w</span>                   Enable web inspector</div>
          <div class="text-grey">  <span class="text-white">--webui-port, -wp &lt;port&gt;</span>     Inspector port</div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.bg-feature {
  background-image: url('@local-assets/backgrounds/options.jpg');
  background-size: cover;
  background-position: center;
}
</style>