<template>
  <div class="wrapper flex flex-col justify-start items-center gap-6 pt-14 pb-6">
    <div class="w-full sm:w-2xl flex flex-col justify-start items-center gap-10 px-5 sm:px-0">
      <div class="flex flex-col justify-start items-center gap-4">
        <img src="/icon.svg" alt="Unne Logo" class="w-9" />
        <h1 class="text-center text-primary text-balance shine-text">
          <span class="inline-block">Self-Hosted Tunnels.</span>
          <span class="inline-block">Your Server, Your Rules.</span>
        </h1>
        <p class="self-stretch text-center text-balance text-nickel">
          Expose local services to the internet through your own infrastructure. No third parties, no limits, no vendor lock-in.
        </p>
      </div>
      <div class="flex items-center gap-5">
        <a href="/guide/" target="_self" class="button button--primary"> Get Started </a>
        <a href="/cli/" target="_self" class="button"> CLI Reference </a>
      </div>
    </div>
  </div>
</template>

<style scoped>
.shine-text {
  background: linear-gradient(
    110deg,
    var(--color-primary) 0%,
    var(--color-primary) 40%,
    #0063CC 48%,
    #0063CC 50%,
    #0063CC 52%,
    var(--color-primary) 60%,
    var(--color-primary) 100%
  );
  background-size: 400% 100%;
  background-position: 100% 0;
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: shine 5s ease-in-out 0s 1 forwards;
}

@keyframes shine {
  to {
    background-position: 35% 0;
  }
}
</style>
