<template>
  <section id="feature-tui" class="wrapper border-t grid md:grid-cols-2 divide-x divide-nickel">
    <div class="px-5 py-6 md:p-10 flex flex-col justify-between gap-15">
      <div class="flex flex-col gap-5">
        <span class="text-grey text-xs font-mono uppercase tracking-wide">--webui</span>
        <h4 class="text-white">TUI dashboard & web inspector</h4>
        <p class="text-white/70 text-base max-w-[25rem] text-pretty">
          See every request flowing through your tunnels with the built-in terminal UI and Chrome DevTools-style web inspector.
        </p>
        <ul class="checkmark-list">
          <li>Live request/response inspection</li>
          <li>mitmproxy-style split pane view</li>
          <li>Filter by method, status, path</li>
          <li>Web inspector at <code class="mr-1 outline-none bg-nickel/50 text-aqua">localhost:4040</code></li>
        </ul>
      </div>
    </div>
    <div class="flex flex-col min-h-[22rem] sm:min-h-[30rem]">
      <div class="bg-feature pl-10 h-full flex flex-col justify-center overflow-clip">
        <div
          class="mr-5 sm:mr-10 px-5 py-6 relative bg-slate rounded-tl rounded-bl outline-1 outline-offset-[2px] outline-white/20 font-mono text-sm leading-[1.5rem] text-white"
        >
          <div class="text-white">$ unne http 3000 --webui</div>
          <div class="h-4" />
          <div class="text-grey">━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</div>
          <div class="h-2" />
          <div class="text-grey">Forwarding        <span class="terminal-blue">https://app.unne.site</span> -> <span class="text-white">localhost:3000</span></div>
          <div class="text-grey">Web Inspector     <span class="terminal-blue">http://127.0.0.1:4040</span></div>
          <div class="h-2" />
          <div class="text-grey">───────────────────────────────────────────────────</div>
          <div class="text-grey"> #   Method  Path               Status   Time</div>
          <div class="text-grey">───────────────────────────────────────────────────</div>
          <div class="text-grey"> 1   <span class="terminal-blue">GET</span>     <span class="text-white">/</span>                  <span class="text-zest">200</span>     12ms</div>
          <div class="text-grey"> 2   <span class="terminal-blue">POST</span>    <span class="text-white">/api/login</span>         <span class="text-zest">201</span>     45ms</div>
          <div class="text-grey"> 3   <span class="terminal-blue">GET</span>     <span class="text-white">/api/users</span>         <span class="text-zest">200</span>      8ms</div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.bg-feature {
  background-image: url('@local-assets/backgrounds/inspect.jpg');
  background-size: cover;
  background-position: center;
}
</style>