#!/bin/bash

cd ./$vendor/$module

mkdir Model
cd Model
mkdir Category
cd Category


echo "<?php
namespace $vendor\\$module\Model\Category;

/**
 * Class DataProvider
 * @package $vendor\\$module\Model\Category
 */
class DataProvider extends \Magento\Catalog\Model\Category\DataProvider
{
    /**
     * @return array
     */
    protected function getFieldsMap()
    {
        \$fields = parent::getFieldsMap();
        \$fields['content'][] = '$image';

        return \$fields;
    }
}" > DataProvider.php