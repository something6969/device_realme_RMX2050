#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:7f05b73e04392d4e468b88dc07e45510f73d2d9f; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:167b6ecb0c2f2b189c2a03b426c04e5b8a7e2905 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:7f05b73e04392d4e468b88dc07e45510f73d2d9f && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
