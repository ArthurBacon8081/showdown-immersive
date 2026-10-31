import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.showdown.immersive',
  appName: 'Showdown Immersive',
  webDir: 'www',
  server: {
    hostname: 'showdown.psim.us',
    androidScheme: 'https',
  },
};

export default config;
