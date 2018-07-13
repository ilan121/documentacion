#!/bin/bash

	cd ./$vendor/$module/etc

	modulelow="${module,,}"

	mkdir adminhtml
	cd adminhtml

	echo '<?xml version="1.0" ?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
<router id="admin">
    <route frontName="'$modulelow'" id="'$modulelow'">
        <module name="'$vendormodule'" before="Magento_Backend"/>
    </route>
</router>
</config>
' > routes.xml

