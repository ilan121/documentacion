#!/bin/bash

	cd ./$vendor/$module

	export modulelow="${module,,}"

	mkdir view
	cd view
	mkdir adminhtml
	cd adminhtml
	mkdir ui_component
	cd ui_component


    echo '<?xml version="1.0"?>
<form xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Ui:etc/ui_configuration.xsd">
    <fieldset name="content">
        <field name="'$image'">
            <argument name="data" xsi:type="array">
                <item name="config" xsi:type="array">
                    <item name="dataType" xsi:type="string">string</item>
                    <item name="source" xsi:type="string">category</item>
                    <item name="label" xsi:type="string" translate="true">Label</item>
                    <item name="visible" xsi:type="boolean">true</item>
                    <item name="formElement" xsi:type="string">fileUploader</item>
                    <item name="elementTmpl" xsi:type="string">ui/form/element/uploader/uploader</item>
                    <item name="previewTmpl" xsi:type="string">Magento_Catalog/image-preview</item>
                    <item name="required" xsi:type="boolean">false</item>
                    <item name="sortOrder" xsi:type="number">40</item>
                    <item name="uploaderConfig" xsi:type="array">
                        <item name="url" xsi:type="url" path="'$modulelow'/category_image/upload"/>
                    </item>
                </item>
            </argument>
        </field>
    </fieldset>
</form>' > category_form.xml