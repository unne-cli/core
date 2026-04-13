<template>
  <section
    class="wrapper wrapper--ticks border-t grid lg:grid-cols-2 divide-x divide-y divide-stroke"
  >
    <div class="p-5 sm:p-10 flex flex-col gap-3">
      <h5>Complete self-hosting</h5>
      <p class="sm:max-w-[28rem] text-pretty">
        Run on your own VPS, bare metal, or Kubernetes. No external dependencies, no subscription fees, complete control over your data and infrastructure.
      </p>
    </div>
    <div class="p-5 sm:p-10 flex flex-col gap-3">
      <h5>Secure by default</h5>
      <p class="max-w-[26rem] text-pretty">
        Token-based authentication, per-user permissions, TLS termination, and configurable rate limiting.
        Keep your tunnels locked down.
      </p>
    </div>
    <div class="p-5 sm:p-10 flex flex-col gap-3">
      <h5>Lightweight & fast</h5>
      <p class="max-w-[26rem] text-pretty">
        Written in Go. Single binary, minimal memory footprint, yamux multiplexing for high-throughput tunnels.
      </p>
    </div>
    <div class="p-5 sm:p-10 flex flex-col gap-3">
      <h5>Multi-platform</h5>
      <p class="max-w-[26rem] text-pretty">
        Native binaries for macOS, Linux, and Windows. One-line install scripts, Homebrew, and manual downloads available.
      </p>
    </div>
  </section>
</template>
