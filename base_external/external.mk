# Point to the directory containing Config.in for this external tree
AESD_PROJECT_BASE_PATH := $(CURDIR)
include $(sort $(wildcard $(AESD_PROJECT_BASE_PATH)/package/*/*.mk))
