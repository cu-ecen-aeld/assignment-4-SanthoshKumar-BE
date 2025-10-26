################################################################################
#
# aesd-assignments-main
#
################################################################################

# 1. Set the source version. This is arbitrary since we use a local copy.
AESD_ASSIGNMENTS_MAIN_VERSION = 1.0.0

# 2. CRITICAL: Define the source location as the directory *above* the Buildroot folder.
# $(TOPDIR)/.. points to the root of your GitHub repository clone.
AESD_ASSIGNMENTS_MAIN_SITE = $(TOPDIR)/..

# 3. CRITICAL: Instruct Buildroot to COPY the source code.
# This bypasses the failed internet download entirely.
AESD_ASSIGNMENTS_MAIN_SITE_METHOD = local

# 4. Define the subdirectory for the source code, relative to the repository root.
# Assuming the source code is at the root of your repository (where 'buildroot' folder is).
AESD_ASSIGNMENTS_MAIN_SUBDIR = .

# 5. Buildroot Dependencies
AESD_ASSIGNMENTS_MAIN_DEPENDENCIES = host-make

# 6. Optional: Skip checks unnecessary for local assignment code.
AESD_ASSIGNMENTS_MAIN_SUPPORTS_INSOURCE = YES
AESD_ASSIGNMENTS_MAIN_SKIP_LICENSE_CHECK = YES

# Include the standard Buildroot package boilerplate
$(eval $(generic-package))
