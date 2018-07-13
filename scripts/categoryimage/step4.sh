#!/bin/bash

	cd ./$vendor/$module

	mkdir Controller
	cd Controller
	mkdir Adminhtml
	cd Adminhtml
	mkdir Category
	cd Category
	mkdir Image
	cd Image

	echo "<?php
namespace $vendor\\$module\Controller\Adminhtml\Category\Image;
use Magento\Framework\Controller\ResultFactory;

/**
 * Class Upload
 * @package $vendor\\$module\Controller\Adminhtml\Category\Image
 */
class Upload extends \Magento\Backend\App\Action
{
    /**
     * @var \Magento\Catalog\Model\ImageUploader
     */
    protected \$imageUploader;

    /**
     * Upload constructor.
     * @param \Magento\Backend\App\Action\Context \$context
     * @param \Magento\Catalog\Model\ImageUploader \$imageUploader
     */
    public function __construct(
        \Magento\Backend\App\Action\Context \$context,
        \Magento\Catalog\Model\ImageUploader \$imageUploader
    ) {

        parent::__construct(\$context);
        \$this->imageUploader = \$imageUploader;
    }

    /**
     * @return bool
     */
    protected function _isAllowed()
    {
        return \$this->_authorization->isAllowed('Magento_Catalog::categories');
    }

    /**
     * @return \Magento\Framework\App\ResponseInterface|\Magento\Framework\Controller\ResultInterface
     */
    public function execute()
    {
        try {

            \$result = \$this->imageUploader->saveFileToTmpDir('$image');

            \$result['cookie'] = [
                'name'  => \$this->_getSession()->getName(),
                'value'     => \$this->_getSession()->getSessionId(),
                'lifetime'   => \$this->_getSession()->getCookieLifetime(),
                'path'       => \$this->_getSession()->getCookiePath(),
                'domain'   => \$this->_getSession()->getCookieDomain(),
            ];
        } catch (\Exception \$e) {

            \$result = ['error' => \$e->getMessage(), 'errorcode' => \$e->getCode()];
        }
        return \$this->resultFactory->create(ResultFactory::TYPE_JSON)->setData(\$result);
    }
}
" > Upload.php