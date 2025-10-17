AESD_ASSIGNMENTS_VERSION = master
AESD_ASSIGNMENTS_SITE = git@github.com:your-username/assignment-3-and-later.git
AESD_ASSIGNMENTS_SITE_METHOD = git

AESD_ASSIGNMENTS_DEPENDENCIES =

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
 $(INSTALL) -D -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
 $(INSTALL) -D -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin/writer
 $(INSTALL) -D -m 0755 $(@D)/tester.sh $(TARGET_DIR)/usr/bin/tester.sh
 $(INSTALL) -D -m 0755 $(@D)/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
 $(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
 cp -r $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
