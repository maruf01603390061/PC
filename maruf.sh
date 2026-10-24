# Telegram Bot Tracking System (Debug Version)
sleep 30

P1="8848492571:AAG5sJYODk6"
P2="aVHQeI4XIWFfvHbmJUfhUjbo"
BOT_TOKEN="${P1}${P2}"
CHAT_ID="2139181550"

# Fetching Device Info
DEV_MODEL=$(getprop ro.product.model)
DEV_BRAND=$(getprop ro.product.brand)
ANDROID_VER=$(getprop ro.build.version.release)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Formatting Message
MSG="🚨 *New Bypass Connection!*%0A%0A📱 *Brand:* $DEV_BRAND%0A📱 *Device:* $DEV_MODEL%0A🤖 *Android:* $ANDROID_VER%0A⏰ *Time:* $TIMESTAMP%0A👑 *Owner:* Maruf Modz"

API_URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage?chat_id=$CHAT_ID&text=$MSG&parse_mode=Markdown"

# Send Data using curl or wget, and save output to a log file for debugging
if command -v curl >/dev/null 2>&1; then
    curl -s -X POST "$API_URL" > /data/local/tmp/bot_debug.log 2>&1
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "$API_URL" > /data/local/tmp/bot_debug.log 2>&1
else
    echo "Error: Neither curl nor wget available!" > /data/local/tmp/bot_debug.log
fi

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
