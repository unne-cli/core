export type TerminalTone = 'base' | 'muted' | 'brand' | 'accent' | 'success' | 'warning';

export interface TerminalSegment {
  text: string;
  tone?: TerminalTone;
  bold?: boolean;
}

export interface TerminalLine {
  segments: TerminalSegment[];
  tone?: TerminalTone;
}

export interface TerminalTranscript {
  id: string;
  label: string;
  title: string;
  command: string;
  prompt?: string;
  lineDelay?: number;
  completionDelay?: number;
  lines: TerminalLine[];
}

export const terminalTranscripts: TerminalTranscript[] = [
  {
    id: 'http',
    label: 'http',
    title: 'HTTP Tunnel',
    command: 'unne http 3000',
    lineDelay: 180,
    completionDelay: 1200,
    lines: [
      {
        segments: [
          { text: '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: 'Session Status    ', tone: 'muted' },
          { text: 'online', tone: 'success' },
        ],
      },
      {
        segments: [
          { text: 'Version           ', tone: 'muted' },
          { text: '2.0.1', tone: 'base' },
        ],
      },
      {
        segments: [
          { text: 'Forwarding        ', tone: 'muted' },
          { text: 'https://k1qgjzv6.unne.site', tone: 'brand' },
          { text: ' -> ', tone: 'muted' },
          { text: 'localhost:3000', tone: 'base' },
        ],
      },
      {
        segments: [
          { text: 'Tunnel            ', tone: 'muted' },
          { text: 'quick', tone: 'base' },
        ],
      },
      {
        segments: [
          { text: 'Connections       ', tone: 'muted' },
          { text: 'total=4', tone: 'base' },
        ],
      },
      {
        segments: [
          { text: '───────────────────────────────────────────────────────────────', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: ' #   Method  Path                           Status   Time', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: '───────────────────────────────────────────────────────────────', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: ' 1   ', tone: 'muted' },
          { text: 'GET', tone: 'accent' },
          { text: '     /                              ', tone: 'base' },
          { text: '200', tone: 'success' },
          { text: '     12ms', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: ' 2   ', tone: 'muted' },
          { text: 'GET', tone: 'accent' },
          { text: '     /favicon.ico                   ', tone: 'base' },
          { text: '200', tone: 'success' },
          { text: '      4ms', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: ' 3   ', tone: 'muted' },
          { text: 'POST', tone: 'accent' },
          { text: '    /api/auth/login                ', tone: 'base' },
          { text: '201', tone: 'success' },
          { text: '     45ms', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: ' 4   ', tone: 'muted' },
          { text: 'GET', tone: 'accent' },
          { text: '     /api/users                     ', tone: 'base' },
          { text: '200', tone: 'success' },
          { text: '      8ms', tone: 'muted' },
        ],
      },
    ],
  },
  {
    id: 'tcp',
    label: 'tcp',
    title: 'TCP Tunnel',
    command: 'unne tcp 5432',
    lineDelay: 200,
    completionDelay: 1200,
    lines: [
      {
        segments: [
          { text: '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: 'Session Status    ', tone: 'muted' },
          { text: 'online', tone: 'success' },
        ],
      },
      {
        segments: [
          { text: 'Version           ', tone: 'muted' },
          { text: '2.0.1', tone: 'base' },
        ],
      },
      {
        segments: [
          { text: 'Forwarding        ', tone: 'muted' },
          { text: 'tcp://unne.site:19432', tone: 'brand' },
          { text: ' -> ', tone: 'muted' },
          { text: 'localhost:5432', tone: 'base' },
        ],
      },
      {
        segments: [
          { text: 'Protocol          ', tone: 'muted' },
          { text: 'TCP', tone: 'base' },
        ],
      },
      {
        segments: [
          { text: 'Connections       ', tone: 'muted' },
          { text: 'total=2', tone: 'base' },
        ],
      },
      {
        segments: [
          { text: '───────────────────────────────────────────────────────────────', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: ' #   Remote            Local             Bytes In   Bytes Out', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: '───────────────────────────────────────────────────────────────', tone: 'muted' },
        ],
      },
      {
        segments: [
          { text: ' 1   ', tone: 'muted' },
          { text: '93.175.2.41', tone: 'accent' },
          { text: '     localhost:5432   ', tone: 'base' },
          { text: '1.4 MB', tone: 'brand' },
          { text: '     ', tone: 'muted' },
          { text: '3.2 MB', tone: 'brand' },
        ],
      },
      {
        segments: [
          { text: ' 2   ', tone: 'muted' },
          { text: '185.22.67.8', tone: 'accent' },
          { text: '     localhost:5432   ', tone: 'base' },
          { text: '256 KB', tone: 'brand' },
          { text: '     ', tone: 'muted' },
          { text: '890 KB', tone: 'brand' },
        ],
      },
    ],
  },
];
