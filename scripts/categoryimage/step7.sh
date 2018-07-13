#!/bin/bash

cd ./$vendor/$module/Controller/

mkdir Catalog
cd Catalog
mkdir Adminhtml
cd Adminhtml
mkdir Category
cd Category


echo "<?php

namespace $vendor\\$module\Controller\Catalog\Adminhtml\Category;

/**
 * Class Save
 * @package $vendor\\$module\Controller\Catalog\Adminhtml\Category
 */
class Save extends \Magento\Catalog\Controller\Adminhtml\Category\Save
{

    /**
     * Workaround
     * Solve a bug, that when user try to save a category with footer option,
     * and max categories allowed already satisfied, the icon image show wrong
     * preview.
     *
     * @param array \$data
     * @return array
     */

    public function imagePreprocessing(\$data)
    {

        \$dataLocal = parent::imagePreprocessing(\$data);

        if (\$dataLocal['$image'] == false) {
            \$dataLocal['$image'] = null;
        }

        return \$dataLocal;
    }

}" > Save.php