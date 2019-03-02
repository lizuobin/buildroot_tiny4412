################################################################################
#
# libump
#
################################################################################

LIBUMP_VERSION = 9d0b7e62f77abd3a02510f7068dec983aa83ed00
LIBUMP_SITE = $(call github,linux-sunxi,libump,$(LIBUMP_VERSION))
LIBUMP_LICENSE = Apache-2.0
#LIBUMP_AUTORECONF = YES
LIBUMP_INSTALL_STAGING = YES
	
define LIBUMP_BUILD_CMDS
	cd $(@D) && make
	cd $(@D) && ln -s libUMP.so libUMP.so.2
endef

define LIBUMP_INSTALL_TARGET_CMDS
	cp $(@D)/include/ump  $(STAGING_DIR)/usr/include/ -r
	cp $(@D)/libUMP.so* $(STAGING_DIR)/usr/lib/ 
	cp $(@D)/libUMP.so* $(TARGET_DIR)/usr/lib/ 
endef

$(eval $(generic-package))
