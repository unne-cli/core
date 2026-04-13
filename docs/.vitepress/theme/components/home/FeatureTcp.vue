<template>
  <section id="feature-tcp" class="wrapper border-t grid md:grid-cols-2 divide-x divide-nickel">
    <div class="px-5 py-6 md:p-10 flex flex-col justify-between gap-15">
      <div class="flex flex-col gap-5">
        <span class="text-grey text-xs font-mono uppercase tracking-wide">unne tcp</span>
        <h4 class="text-white">TCP tunnels for any protocol</h4>
        <p class="text-white/70 text-base max-w-[25rem] text-pretty">
          Forward raw TCP ports for databases, SSH, game servers, or any TCP service. No protocol restrictions.
        </p>
        <ul class="checkmark-list">
          <li>Expose PostgreSQL, MySQL, Redis remotely</li>
          <li>SSH access to local machines</li>
          <li>Custom remote port with <code class="mr-1 outline-none bg-nickel/50 text-aqua">--remote-port</code></li>
          <li>Per-user connection and bandwidth limits</li>
        </ul>
      </div>
    </div>
    <div class="flex flex-col min-h-[22rem] sm:min-h-[30rem]">
      <div class="bg-feature pl-10 h-full flex flex-col justify-center overflow-clip">
        <div
          class="mr-5 sm:mr-10 px-5 py-6 relative bg-slate rounded-tl rounded-bl outline-1 outline-offset-[2px] outline-white/20 font-mono text-sm leading-[1.5rem] text-white"
        >
          <div class="text-white">$ unne tcp 5432</div>
          <div class="h-4" />
          <div class="text-grey">━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</div>
          <div class="h-2" />
          <div class="text-grey">Session Status    <span class="text-zest">online</span></div>
          <div class="text-grey">Forwarding        <span class="terminal-blue">tcp://unne.site:19432</span> -> <span class="text-white">localhost:5432</span></div>
          <div class="text-grey">Protocol          <span class="text-white">TCP</span></div>
          <div class="text-grey">Connections       <span class="text-white">total=2</span></div>
          <div class="h-2" />
          <div class="text-grey">───────────────────────────────────────────────────</div>
          <div class="text-grey"> #   Remote            Local            Bytes In   Out</div>
          <div class="text-grey">───────────────────────────────────────────────────</div>
          <div class="text-grey"> 1   <span class="terminal-blue">93.175.2.41</span>     <span class="text-white">localhost:5432</span>   <span class="text-zest">1.4 MB</span>   3.2 MB</div>
          <div class="text-grey"> 2   <span class="terminal-blue">185.22.67.8</span>     <span class="text-white">localhost:5432</span>   <span class="text-zest">256 KB</span>   890 KB</div>
          <div class="h-4" />
          <div><span class="text-zest">✓</span> PostgreSQL accessible at <span class="terminal-blue">unne.site:19432</span></div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.bg-feature {
  background-image: url('@local-assets/backgrounds/tcp.jpg');
  background-size: cover;
  background-position: center;
}
</style>