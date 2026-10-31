{ pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
  }
}:

let
  androidSdk = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "latest";
    platformToolsVersion = "35.0.2";
    buildToolsVersions = [ "35.0.0" "36.0.0" ];
    platformVersions = [ "36" ];
    includeEmulator = false;
    includeSystemImages = false;
  };
in
pkgs.mkShell {
  packages = [
    pkgs.jdk21
    pkgs.nodejs
    pkgs.android-tools
    androidSdk.androidsdk
  ];

  JAVA_HOME = "${pkgs.jdk21}";
  ANDROID_HOME = "${androidSdk.androidsdk}/libexec/android-sdk";
  ANDROID_SDK_ROOT = "${androidSdk.androidsdk}/libexec/android-sdk";

  shellHook = ''
    export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
    echo "Showdown Immersive Android environment ready!"
  '';
}
