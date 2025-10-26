################################################################################
#
# aesd-assignments-main
#
################################################################################

# 1. Set the source version (can be arbitrary)
AESD_ASSIGNMENTS_MAIN_VERSION = 1.0.0

# 2. Set the source location to the directory above 'buildroot' (i.e., the repo root)
# $(TOPDIR)/.. is the path to the root of the GitHub repository checkout
AESD_ASSIGNMENTS_MAIN_SITE = $(TOPDIR)/..

# 3. CRITICAL: Tell Buildroot to use the 'local' method (i.e., copy the source, do not download)
AESD_ASSIGNMENTS_MAIN_SITE_METHOD = local

# 4. Set the source code directory (e.g., if code is in a 'project' subdirectory)
# If the source is at the repo root, you can omit this or use:
AESD_ASSIGNMENTS_MAIN_SUBDIR = .

# Optional: Disable hash check since it's a local copy
AESD_ASSIGNMENTS_MAIN_SKIP_LICENSE_CHECK = YES

# Include the standard Buildroot package boilerplate
$(eval $(generic-package))
