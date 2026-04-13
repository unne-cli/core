<template>
  <section
    class="wrapper border-t grid grid-rows-3 lg:grid-rows-1 lg:grid-cols-3 lg:h-80 divide-y lg:divide-y-0 lg:divide-x"
  >
    <div class="p-5 lg:p-10 flex flex-col justify-between">
      <div class="flex flex-col gap-3 h-30 lg:h-auto">
        <h5>HTTP & TCP tunnels</h5>
        <p>
          Expose HTTP services with custom subdomains or forward raw TCP ports for databases, SSH, and more.
        </p>
      </div>
      <div class="flex flex-wrap gap-2">
        <code>unne http</code>
        <code>unne tcp</code>
        <code>unne start</code>
      </div>
    </div>
    <div class="p-5 lg:p-10 flex flex-col justify-between">
      <div class="flex flex-col gap-3 h-30 lg:h-auto">
        <h5>One config, full control</h5>
        <p>Single <code>unne.yml</code> configuration for multi-tunnel setups, subdomains, and proxy settings.</p>
      </div>
      <div class="flex flex-wrap gap-2">
        <code>unne setup</code>
        <code>unne domains</code>
        <code>unne check</code>
      </div>
    </div>
    <div class="p-5 lg:p-10 flex flex-col justify-between">
      <div class="flex flex-col gap-3 h-30 lg:h-auto">
        <h5>Built-in observability</h5>
        <p>TUI dashboard, web inspector, and request analytics — see every request as it flows.</p>
      </div>
      <div class="flex flex-wrap gap-2">
        <code>--webui</code>
        <code>TUI</code>
        <code>Inspector</code>
      </div>
    </div>
  </section>
</template>
