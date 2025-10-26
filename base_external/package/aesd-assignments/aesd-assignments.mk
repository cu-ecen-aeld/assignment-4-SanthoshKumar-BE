AESD_ASSIGNMENTS_VERSION = main
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-SanthoshKumar-BE.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D)/finder-app CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/ || true

	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/bin/ || true
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/bin/ || true
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/bin/ || true

	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin/ || true
endef

$(eval $(generic-package))
