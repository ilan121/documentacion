#!/bin/bash

cd ./$vendor/$module/etc

    echo '<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:ObjectManager/etc/config.xsd">
   <virtualType name="Magento\Catalog\CategoryImageUpload" type="Magento\Catalog\Model\ImageUploader">
        <arguments>
            <argument name="baseTmpPath" xsi:type="string">catalog/tmp/category</argument>
            <argument name="basePath" xsi:type="string">catalog/category</argument>
            <argument name="allowedExtensions" xsi:type="array">
                <item name="jpg" xsi:type="string">jpg</item>
                <item name="jpeg" xsi:type="string">jpeg</item>
                <item name="gif" xsi:type="string">gif</item>
                <item name="png" xsi:type="string">png</item>
            </argument>
        </arguments>
    </virtualType>
    <type name="'$vendor'\'$module'\Controller\Adminhtml\Category\Image\Upload">
        <arguments>
            <argument name="imageUploader" xsi:type="object">Magento\Catalog\CategoryImageUpload</argument>
        </arguments>
    </type>
    <preference for="Magento\Catalog\Model\Category\DataProvider" type="'$vendor'\'$module'\Model\Category\DataProvider" />
    </config>' > di.xml


