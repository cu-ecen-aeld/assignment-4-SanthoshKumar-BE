##############################################################
#
# AESD-ASSIGNMENTS Buildroot package
#
##############################################################

AESD_ASSIGNMENTS_VERSION = main
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-SanthoshKumar-BE.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D)/finder-app CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
endef

# Install scripts and configuration files
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Create necessary directories
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/

	# Install configuration files
	if [ -f "$(@D)/conf/username.txt" ]; then \
		$(INSTALL) -m 0644 $(@D)/conf/username.txt $(TARGET_DIR)/etc/finder-app/; \
	else \
		echo "testuser" > $(TARGET_DIR)/etc/finder-app/username.txt; \
	fi

	if [ -f "$(@D)/conf/assignment.txt" ]; then \
		$(INSTALL) -m 0644 $(@D)/conf/assignment.txt $(TARGET_DIR)/etc/finder-app/; \
	else \
		echo "assignment4" > $(TARGET_DIR)/etc/finder-app/assignment.txt; \
	fi

	# Install binaries and scripts to /usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/

	# Install test scripts from autotest (optional)
	if [ -d "$(@D)/assignment-autotest/test/assignment4" ]; then \
		$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/usr/bin/; \
	fi
endef

$(eval $(generic-package))
