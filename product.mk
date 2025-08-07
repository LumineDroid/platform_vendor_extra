#
# Copyright (C) 2025 LumineDroid
#
# SPDX-License-Identifier: Apache-2.0
#

EXTRA_PATH := vendor/extra

# APEX
DISABLE_DEXPREOPT_CHECK := true

PRODUCT_PACKAGES += \
    com.google.android.permission

# Bootanimation
include $(EXTRA_PATH)/config/bootanimation.mk

# Charger
WITH_LINEAGE_CHARGER := false
PRODUCT_PACKAGES += \
    custom_charger_animation \
    custom_charger_animation_vendor

# Enable blur
TARGET_ENABLE_BLUR ?= true
ifeq ($(TARGET_ENABLE_BLUR),true)
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=true \
    ro.surface_flinger.supports_background_blur=1
else
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=false \
    ro.surface_flinger.supports_background_blur=0
endif

# Fonts
PRODUCT_PACKAGES += \
    fonts_customization.xml \
    FontAccuratistOverlay \
    FontAclonicaOverlay \
    FontAmaranteOverlay \
    FontBariolOverlay \
    FontCagliostroOverlay \
    FontCoconOverlay \
    FontComfortaaOverlay \
    FontComicSansOverlay \
    FontCookieRunOverlay \
    FontCoolstoryOverlay \
    FontExotwoOverlay \
    FontFifa2018Overlay \
    FontGrandHotelOverlay \
    FontGoogleSansFlexOverlay \
    FontHarmonySansOverlay \
    FontLatoOverlay \
    FontLinotteOverlay \
    FontNokiaPureOverlay \
    FontNothingDotHeadlineOverlay \
    FontNothingDotOverlay \
    FontNunitoOverlay \
    FontOneplusSansOverlay \
    FontOneplusSlateOverlay \
    FontOswaldOverlay \
    FontPlayOverlay \
    FontQuandoOverlay \
    FontRedressedOverlay \
    FontReemKufiOverlay \
    FontRobotoCondensedOverlay \
    FontRookeryOverlay \
    FontRubikOverlay \
    FontSanFranciscoDisplayProSourceOverlay \
    FontSamsungOneOverlay \
    FontSansSerifOverlay \
    FontSonySketchOverlay \
    FontStoropiaOverlay \
    FontSurferOverlay \
    FontUbuntuOverlay

$(call inherit-product-if-exists, external/google-fonts/lato/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/rubik/fonts.mk)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(EXTRA_PATH)/prebuilt/product/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts)

# GameProps
TARGET_PRODUCT_PROP += vendor/extra/gameprops/gameprops.prop

# LMOFreeform
PRODUCT_PACKAGES += \
    LMOFreeform \
    LMOFreeformSidebar

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay/common
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/extra/overlay/common/packages/apps/Launcher3
