#!/bin/bash
echo "Enter vendor name"
read vendoraux
echo "Enter module name"
read moduleaux
echo "Enter image field name"
read imageaux


export vendor=${vendoraux}
export module=${moduleaux}
export image=${imageaux}
export vendormodule=${vendor}_${module}

./setup.sh
./step1.sh
./step2.sh
./step3.sh
./step4.sh
./step5.sh
./step6.sh
./step7.sh



