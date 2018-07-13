#!/bin/bash

	cd ./$vendor/$module

    mkdir Setup

    cd Setup

    echo "<?php

namespace $vendor\\$module\Setup;

use Magento\Eav\Setup\EavSetup;
use Magento\Eav\Setup\EavSetupFactory;
use Magento\Framework\Setup\InstallDataInterface;
use Magento\Framework\Setup\ModuleContextInterface;
use Magento\Framework\Setup\ModuleDataSetupInterface;
use Magento\Eav\Model\Entity\Attribute\ScopedAttributeInterface;

/**
 * Class InstallData
 * @package $vendor\\$module\Setup
 */
class InstallData implements InstallDataInterface
{
    /**
     * @var EavSetupFactory
     */
    private \$eavSetupFactory;

    /**
     * InstallData constructor.
     * @param EavSetupFactory \$eavSetupFactory
     */
    public function __construct(EavSetupFactory \$eavSetupFactory)
    {
        \$this->eavSetupFactory = \$eavSetupFactory;
    }

    /**
     * @param ModuleDataSetupInterface \$setup
     * @param ModuleContextInterface \$context
     */
    public function install(ModuleDataSetupInterface \$setup, ModuleContextInterface \$context)
    {

        \$setup->startSetup();
        \$eavSetup = \$this->eavSetupFactory->create(['setup' => \$setup]);
        \$eavSetup->addAttribute(
            \Magento\Catalog\Model\Category::ENTITY, '$image', [
            'type'     => 'varchar',
            'label'    => 'Image',
            'input'    => 'image',
            'backend' => 'Magento\Catalog\Model\Category\Attribute\Backend\Image',
            'visible'  => true,
            'sort_order' => 9,
            'required' => false,
            'global'   => \Magento\Eav\Model\Entity\Attribute\ScopedAttributeInterface::SCOPE_STORE,
            'group'    => 'General Information',
        ]
        );

        \$setup->endSetup();
    }
}
" > InstallData.php