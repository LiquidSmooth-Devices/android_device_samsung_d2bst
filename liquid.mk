$(call inherit-product, device/samsung/d2bst/full_d2bst.mk)

# Enhanced NFC
$(call inherit-product, vendor/liquid/config/nfc_enhanced.mk)

# Inherit some common LiquidSmooth stuff.
$(call inherit-product, vendor/liquid/config/common_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=d2bst \
    TARGET_DEVICE=d2bst \
    BUILD_FINGERPRINT="samsung/d2lterefreshspr/d2lterefreshspr:4.4.2/KOT49H/L710TVPU0ANF4:user/release-keys" \
    PRIVATE_BUILD_DESC="d2lterefreshspr-user 4.4.2 KOT49H L710TVPU0ANF4 release-keys"

PRODUCT_NAME := liquid_d2bst
PRODUCT_DEVICE := d2bst

