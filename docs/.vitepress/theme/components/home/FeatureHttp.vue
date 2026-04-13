<template>
  <section
    id="feature-http"
    class="wrapper border-t grid md:grid-cols-2 divide-x divide-nickel"
  >
    <div class="px-5 py-6 md:p-10 flex flex-col justify-between gap-15">
      <div class="flex flex-col gap-5">
        <span class="text-grey text-xs font-mono uppercase tracking-wide">unne http</span>
        <h4 class="text-white">HTTP tunnels with custom subdomains</h4>
        <p class="text-white/70 text-base max-w-[25rem] text-pretty">
          Expose any local web server to the internet instantly. Custom subdomains, automatic TLS, and live request inspection.
        </p>
        <ul class="checkmark-list">
          <li>Custom subdomains: <code class="mr-1 outline-none bg-nickel/50 text-aqua">--subdomain myapp</code></li>
          <li>Automatic TLS termination on the server</li>
          <li>Built-in TUI with request table</li>
          <li>Web inspector with <code class="mr-1 outline-none bg-nickel/50 text-aqua">--webui</code></li>
        </ul>
      </div>
    </div>
    <div class="flex flex-col min-h-[22rem] sm:min-h-[30rem]">
      <div class="bg-feature pl-10 h-full flex flex-col justify-center overflow-clip">
        <div
          class="mr-5 sm:mr-10 px-5 py-6 relative bg-slate rounded-tl rounded-bl outline-1 outline-offset-[2px] outline-white/20 font-mono text-sm leading-[1.5rem] text-white"
        >
          <div class="text-white">$ unne http 3000 --subdomain myapp</div>
          <div class="h-4" />
          <div class="text-grey">━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</div>
          <div class="h-2" />
          <div class="text-grey">Session Status    <span class="text-zest">online</span></div>
          <div class="text-grey">Forwarding        <span class="terminal-blue">https://myapp.unne.site</span> -> <span class="text-white">localhost:3000</span></div>
          <div class="text-grey">Tunnel            <span class="text-white">named</span></div>
          <div class="text-grey">Connections       <span class="text-white">total=4</span></div>
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
  background-image: url('@local-assets/backgrounds/http.jpg');
  background-size: cover;
  background-position: center;
}
</style>
