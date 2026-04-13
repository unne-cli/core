<template>
  <section id="feature-config" class="wrapper border-t grid md:grid-cols-2 divide-x divide-nickel">
    <div class="px-5 py-6 md:p-10 flex flex-col justify-between gap-15">
      <div class="flex flex-col gap-5">
        <span class="text-grey text-xs font-mono uppercase tracking-wide">unne.yml</span>
        <h4 class="text-white">Multi-tunnel configuration</h4>
        <p class="text-white/70 text-base max-w-[25rem] text-pretty">
          Define all your tunnels in a single <code class="mx-1 outline-none bg-nickel/50 text-aqua">unne.yml</code> file and start them with one command.
        </p>
        <ul class="checkmark-list">
          <li>Multiple tunnels in one config</li>
          <li>Named subdomains per tunnel</li>
          <li>Proxy settings per tunnel</li>
          <li>Start all with <code class="mr-1 outline-none bg-nickel/50 text-aqua">unne start</code></li>
        </ul>
      </div>
    </div>
    <div class="flex flex-col min-h-[22rem] sm:min-h-[30rem]">
      <div class="bg-feature pl-10 h-full flex flex-col justify-center overflow-clip">
        <div
          class="mr-5 sm:mr-10 px-5 py-6 relative bg-slate rounded-tl rounded-bl outline-1 outline-offset-[2px] outline-white/20 font-mono text-sm leading-[1.5rem] text-white"
        >
          <div class="text-grey"># unne.yml</div>
          <div class="h-2" />
          <div class="text-grey"><span class="terminal-blue">server:</span> unne.site</div>
          <div class="text-grey"><span class="terminal-blue">token:</span> unn_abc123...</div>
          <div class="h-2" />
          <div class="text-grey"><span class="terminal-blue">tunnels:</span></div>
          <div class="text-grey">  <span class="terminal-blue">web:</span></div>
          <div class="text-grey">    <span class="text-white">proto:</span> http</div>
          <div class="text-grey">    <span class="text-white">port:</span> 3000</div>
          <div class="text-grey">    <span class="text-white">subdomain:</span> myapp</div>
          <div class="h-2" />
          <div class="text-grey">  <span class="terminal-blue">api:</span></div>
          <div class="text-grey">    <span class="text-white">proto:</span> http</div>
          <div class="text-grey">    <span class="text-white">port:</span> 8080</div>
          <div class="text-grey">    <span class="text-white">subdomain:</span> api</div>
          <div class="h-2" />
          <div class="text-grey">  <span class="terminal-blue">db:</span></div>
          <div class="text-grey">    <span class="text-white">proto:</span> tcp</div>
          <div class="text-grey">    <span class="text-white">port:</span> 5432</div>
        </div>
      </div>
    </div>
  </section>
</template>


<style scoped>
.bg-feature {
  background-image: url('@local-assets/backgrounds/config.jpg');
  background-size: cover;
  background-position: center;
}
</style>