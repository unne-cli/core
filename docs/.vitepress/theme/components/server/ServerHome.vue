<script setup lang="ts">
import { Icon } from '@iconify/vue';
import { onBeforeUnmount, ref } from 'vue';

const commands = [
  { id: 'unix', label: 'macOS / Linux', command: 'curl -fsSL https://unne.site/server/install | bash' },
  { id: 'windows', label: 'Windows (PowerShell)', command: 'irm https://unne.site/server/install.ps1 | iex' },
];

const copiedId = ref<string | null>(null);
let copiedTimer: ReturnType<typeof setTimeout> | null = null;

const copyCommand = async (id: string, command: string) => {
  try {
    await navigator.clipboard.writeText(command);
    copiedId.value = id;
    if (copiedTimer) clearTimeout(copiedTimer);
    copiedTimer = setTimeout(() => { copiedId.value = null }, 1600);
  } catch {}
};

onBeforeUnmount(() => { if (copiedTimer) clearTimeout(copiedTimer) });
</script>

<template>
  <div class="server-home">
    <!-- Hero -->
    <div class="hero">
      <img src="/icon.svg" alt="Unne" class="hero-icon" />
      <h1>Unne Server</h1>
      <p class="hero-desc">
        Self-hosted tunnel relay with user management, admin panel, token auth, and per-user limits. All in a single binary.
      </p>
      <div class="hero-actions">
        <a href="/server/installation" class="btn btn-primary">Installation</a>
        <a href="/server/setup" class="btn">Setup Guide</a>
      </div>
    </div>

    <!-- Install -->
    <div class="install-section">
      <h2>Install Server</h2>
      <div class="install-cards">
        <div v-for="card in commands" :key="card.id" class="install-card">
          <div class="install-card-top">
            <span class="install-label">{{ card.label }}</span>
            <button class="copy-btn" @click="copyCommand(card.id, card.command)">
              <Icon :icon="copiedId === card.id ? 'lucide:check' : 'lucide:copy'" class="copy-icon" />
              {{ copiedId === card.id ? 'Copied' : 'Copy' }}
            </button>
          </div>
          <code class="install-cmd">{{ card.command }}</code>
        </div>
      </div>
    </div>

    <!-- CLI help -->
    <div class="terminal-section">
      <h2>Commands</h2>
      <div class="terminal">
        <div class="tl"><span class="tw">$ unns</span></div>
        <div class="tl-s"></div>
        <div class="tl"><span class="tb">Unne Server v2.0.1</span></div>
        <div class="tl-s"></div>
        <div class="tl td">Usage:</div>
        <div class="tl"><span class="tw">  unns setup</span><span class="tg">              </span><span class="td">Initial configuration</span></div>
        <div class="tl"><span class="tw">  unns start</span><span class="tg">              </span><span class="td">Start server</span></div>
        <div class="tl"><span class="tw">  unns config list</span><span class="tg">        </span><span class="td">View config</span></div>
        <div class="tl"><span class="tw">  unns config set ...</span><span class="tg">     </span><span class="td">Set config value</span></div>
        <div class="tl"><span class="tw">  unns user create ...</span><span class="tg">    </span><span class="td">Create users</span></div>
        <div class="tl"><span class="tw">  unns user list</span><span class="tg">          </span><span class="td">List users</span></div>
        <div class="tl"><span class="tw">  unns user delete &lt;id&gt;</span><span class="tg">   </span><span class="td">Delete user</span></div>
        <div class="tl"><span class="tw">  unns token gen ...</span><span class="tg">      </span><span class="td">Generate tokens</span></div>
        <div class="tl"><span class="tw">  unns token list</span><span class="tg">         </span><span class="td">List tokens</span></div>
        <div class="tl"><span class="tw">  unns token revoke ...</span><span class="tg">   </span><span class="td">Revoke token</span></div>
        <div class="tl"><span class="tw">  unns setup-check</span><span class="tg">        </span><span class="td">Print server info for CLI</span></div>
      </div>
    </div>

    <!-- Features grid -->
    <div class="features">
      <h2>Features</h2>
      <div class="features-grid">
        <div class="feature-card">
          <h3>Admin Panel</h3>
          <p>Web-based dashboard for managing users, tokens, monitoring active tunnels, and viewing traffic analytics in real-time.</p>
        </div>
        <div class="feature-card">
          <h3>User Management</h3>
          <p>Full user system with roles. Set per-user limits on tunnel count, device count, bandwidth, and protocol access.</p>
        </div>
        <div class="feature-card">
          <h3>Token Auth</h3>
          <p>Secure token-based authentication with expiration and device binding. Generate, list, and revoke tokens via CLI.</p>
        </div>
        <div class="feature-card">
          <h3>Limits & Quotas</h3>
          <p>Configure per-user bandwidth caps, connection limits, tunnel count, and rate limiting to prevent abuse.</p>
        </div>
        <div class="feature-card">
          <h3>Subdomain Formats</h3>
          <p>Choose auto-generated subdomain format: <code>random</code>, <code>uuid</code>, <code>ulid</code>, or <code>factory</code> (adjective-noun pairs). Changeable at runtime via admin API.</p>
        </div>
        <div class="feature-card">
          <h3>Custom Error Pages</h3>
          <p>Branded error pages when tunnels are offline or blocked. HTML templates with variable substitution.</p>
        </div>
        <div class="feature-card">
          <h3>REST API</h3>
          <p>Full API for programmatic management of users, tokens, tunnels, and server configuration.</p>
        </div>
      </div>
    </div>

    <!-- Ports table -->
    <div class="ports-section">
      <h2>Ports</h2>
      <table>
        <thead><tr><th>Port</th><th>Default</th><th>Purpose</th></tr></thead>
        <tbody>
          <tr><td>Control</td><td><code>8222</code></td><td>CLI client connections (yamux)</td></tr>
          <tr><td>HTTP Proxy</td><td><code>8223</code></td><td>Public HTTP traffic routing</td></tr>
          <tr><td>Admin Panel</td><td><code>4041</code></td><td>Web-based administration</td></tr>
          <tr><td>TCP</td><td>dynamic</td><td>Per-tunnel TCP listeners</td></tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<style scoped>
.server-home {
  max-width: 52rem;
  margin: 0 auto;
  padding: 0 1.5rem 4rem;
}

/* Hero */
.hero {
  text-align: center;
  padding: 3rem 0 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
}

.hero-icon {
  width: 3rem;
  height: 3rem;
}

.hero h1 {
  font-size: 2.5rem;
  font-weight: 800;
  letter-spacing: -0.02em;
  margin: 0;
  border: none;
}

.hero-desc {
  color: var(--vp-c-text-2);
  max-width: 32rem;
  font-size: 1.1rem;
  line-height: 1.6;
  text-wrap: balance;
}

.hero-actions {
  display: flex;
  gap: 1rem;
  margin-top: 0.5rem;
}

.btn {
  display: inline-flex;
  align-items: center;
  padding: 0.6rem 1.4rem;
  border-radius: 8px;
  font-size: 0.9375rem;
  font-weight: 600;
  text-decoration: none;
  border: 1px solid var(--vp-c-divider);
  color: var(--vp-c-text-1);
  transition: all 0.2s;
}

.btn:hover { border-color: var(--vp-c-text-3); }

.btn-primary {
  background: #0029CC;
  color: #fff;
  border-color: #0029CC;
}

.btn-primary:hover { background: #0035e0; }

/* Install */
.install-section {
  margin-top: 3rem;
}

.install-section h2 {
  border: none;
  margin: 0 0 1rem;
}

.install-cards {
  display: grid;
  gap: 0.75rem;
}

.install-card {
  background: var(--vp-c-bg-alt);
  border: 1px solid var(--vp-c-divider);
  border-radius: 12px;
  padding: 1rem 1.25rem;
}

.install-card-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.5rem;
}

.install-label {
  font-family: monospace;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.06em;
  color: var(--vp-c-text-3);
}

.copy-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.35rem;
  padding: 0.3rem 0.6rem;
  border: 1px solid var(--vp-c-divider);
  border-radius: 6px;
  background: none;
  font-size: 0.8rem;
  color: var(--vp-c-text-3);
  cursor: pointer;
}

.copy-btn:hover { color: var(--vp-c-text-1); border-color: var(--vp-c-text-3); }

.copy-icon { width: 14px; height: 14px; }

.install-cmd {
  display: block;
  font-size: 0.875rem;
  white-space: nowrap;
  overflow-x: auto;
}

/* Terminal */
.terminal-section {
  margin-top: 3rem;
}

.terminal-section h2 {
  border: none;
  margin: 0 0 1rem;
}

.terminal {
  background: #111;
  border-radius: 12px;
  padding: 1.25rem 1.5rem;
  font-family: 'SF Mono', 'Cascadia Code', 'Fira Code', ui-monospace, monospace;
  font-size: 0.8125rem;
  line-height: 1.55;
  color: #ccc;
  outline: 1px solid rgba(255,255,255,0.08);
}

.tl { white-space: pre; }
.tl-s { height: 0.3rem; }
.tw { color: #fff; }
.tb { color: #4d9eff; }
.td { color: rgba(255,255,255,0.4); }
.tg { }

/* Features */
.features {
  margin-top: 3rem;
}

.features h2 {
  border: none;
  margin: 0 0 1rem;
}

.features-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}

@media (min-width: 640px) {
  .features-grid { grid-template-columns: 1fr 1fr; }
}

@media (min-width: 960px) {
  .features-grid { grid-template-columns: 1fr 1fr 1fr; }
}

.feature-card {
  padding: 1.25rem;
  border: 1px solid var(--vp-c-divider);
  border-radius: 12px;
}

.feature-card h3 {
  font-size: 1rem;
  font-weight: 600;
  margin: 0 0 0.5rem;
}

.feature-card p {
  font-size: 0.875rem;
  color: var(--vp-c-text-2);
  line-height: 1.5;
  margin: 0;
}

/* Ports */
.ports-section {
  margin-top: 3rem;
}

.ports-section h2 {
  border: none;
  margin: 0 0 1rem;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  text-align: left;
  padding: 0.6rem 1rem;
  border-bottom: 1px solid var(--vp-c-divider);
  font-size: 0.875rem;
}

th {
  font-weight: 600;
  color: var(--vp-c-text-2);
}
</style>
