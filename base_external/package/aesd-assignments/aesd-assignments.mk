##############################################################
#
# AESD-ASSIGNMENTS Buildroot package
#
##############################################################

AESD_ASSIGNMENTS_VERSION = main
AESD_ASSIGNMENTS_SITE = https://github.com/cu-ecen-aeld/assignments-3-and-later-SanthoshKumar-BE.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
\t$(MAKE) -C $(@D)/finder-app CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
endef

# Instalación de scripts y archivos de configuración
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
\t# Crear directorios necesarios
\t$(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf/
\t
\t# Instalar archivos de configuración
\tif [ -f "$(@D)/conf/username.txt" ]; then \
\t\t$(INSTALL) -m 0644 $(@D)/conf/username.txt $(TARGET_DIR)/etc/finder-app/conf/; \
\telse \
\t\techo "testuser" > $(TARGET_DIR)/etc/finder-app/conf/username.txt; \
\tfi
\t
\tif [ -f "$(@D)/conf/assignment.txt" ]; then \
\t\t$(INSTALL) -m 0644 $(@D)/conf/assignment.txt $(TARGET_DIR)/etc/finder-app/conf/; \
\telse \
\t\techo "assignment4" > $(TARGET_DIR)/etc/finder-app/conf/assignment.txt; \
\tfi
\t
\t# Instalar binarios en /bin
\t$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/bin/
\t$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/bin/
\t$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/bin/
\t
\t# Instalar scripts de test
\t$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin/
endef

$(eval $(generic-package))
