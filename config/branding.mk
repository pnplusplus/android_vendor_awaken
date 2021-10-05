BUILD_DATE := $(shell date +%Y%m%d)
BUILD_TIME := $(shell date +%H%M)
# Versioning System
# Use signing keys for only official
ifndef AWAKEN_BUILD_TYPE
    AWAKEN_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
AWAKEN_BASE_VERSION := 1.12
AWAKEN_CODENAME := Adios
AWAKEN_PLATFORM_VERSION := 11
ROM_FINGERPRINT := Awaken/$(PLATFORM_VERSION)/$(AWAKEN_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)

ifeq ($(USE_GAPPS), true)
    AWAKEN_VERSION := $(TARGET_PRODUCT)-$(AWAKEN_BASE_VERSION)-$(AWAKEN_CODENAME)-$(AWAKEN_BUILD_TYPE)-gapps-$(BUILD_DATE)-$(BUILD_TIME)
else
    AWAKEN_VERSION := $(TARGET_PRODUCT)-$(AWAKEN_BASE_VERSION)-$(AWAKEN_CODENAME)-$(AWAKEN_BUILD_TYPE)-$(BUILD_DATE)-$(BUILD_TIME)
endif

# Declare it's a Awaken build
AWAKEN_BUILD := true

ifneq ($(OVERRIDE_OTA_CHANNEL),)
    PRODUCT_PROPERTY_OVERRIDES += \
        awaken.updater.uri=$(OVERRIDE_OTA_CHANNEL)
endif
