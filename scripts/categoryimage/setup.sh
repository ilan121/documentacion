#!/bin/bash
if [[ ! -d "$vendor" ]]
then
    mkdir ./$vendor
    	cd ./$vendor
   			mkdir ./$module
    			cd ./$module
    				mkdir ./etc
    					echo "<?php
								/**
								 * ACL. Can be queried for relations between roles and resources.
								 *
								 * Copyright © 2017 Magento. All rights reserved.
								 * See COPYING.txt for license details.
								 */
								\Magento\Framework\Component\ComponentRegistrar::register(
								    \Magento\Framework\Component\ComponentRegistrar::MODULE,
								    '$vendormodule',
								    __DIR__
								);" > registration.php

						cd ./etc
						   echo '<?xml version="1.0"?>
						<!--
						/**
						 * ACL. Can be queried for relations between roles and resources.
						 *
						 * Copyright © 2017 Magento. All rights reserved.
						 * See COPYING.txt for license details.
						 */
						-->

						<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
						        xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
						    <module name="'$vendormodule'" setup_version="1.0.1"></module>
						</config>' > module.xml

fi