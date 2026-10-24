# 1. Force x86 Architecture Detection
resetprop ro.product.cpu.abi "x86"
resetprop ro.product.cpu.abilist "x86,armeabi-v7a,armeabi"
resetprop ro.product.cpu.abilist32 "x86,armeabi-v7a,abilist32"
resetprop ro.product.cpu.abilist64 "X86_64"

# 2. Fake the Hypervisor & QEMU Environment
resetprop ro.boot.hypervisor 1
resetprop hypervisor.type "kvm"
resetprop ro.kernel.qemu 1
resetprop ro.boot.qemu 1

# 3. Trigger ARM Translation Properties
resetprop ro.dalvik.vm.isa.arm "x86"
resetprop ro.enable.native.bridge.exec 1
resetprop ro.ndk.nativebridge 1
resetprop persist.sys.nativebridge 1
resetprop ro.dalvik.vm.native.bridge "libhoudini.so"

# 4. Identity & Hardware Spoofing (Goldfish Profile)
resetprop ro.hardware "goldfish"
resetprop ro.boot.hardware "goldfish"
resetprop ro.product.model "sdk_gphone_x86"
resetprop ro.product.brand "google"
resetprop ro.product.name "sdk_gphone_x86"
resetprop ro.product.device "generic_x86"
