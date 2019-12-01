#!/bin/bash

#
# Check TXLiteAVSDK_UGC pod source
#
# Result:
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.2/TXLiteAVSDK_UGC_Rename_iOS_4.2.3427.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.3/TXLiteAVSDK_UGC_Rename_iOS_4.3.3609.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.4/TXLiteAVSDK_UGC_Rename_iOS_4.4.3774.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.5/TXLiteAVSDK_UGC_Rename_iOS_4.5.4018.zip

## Known versions from CocoaPods Specs: https://github.com/CocoaPods/Specs/tree/master/Specs/a/3/e/TXLiteAVSDK_UGC
# 4.2.3427  Free
# 4.4.3774  Free
# 4.5.4018  Licensed

# Usage: _check 4.2 3774
_check()
{
    url="https://liteavsdk-1252463788.cosgz.myqcloud.com/$1/TXLiteAVSDK_UGC_Rename_iOS_$1.$2.zip"
    # https://superuser.com/a/442395/227501
    httpCode=`curl -s -o /dev/null -I -w "%{http_code}" "$url"`

    if [[ $? != 0 ]]; then
        echo "*** Error ***"
        exit 1
    fi

    if [[ $httpCode == 200 ]]; then
        echo "$url"
    fi
}

cd "$(dirname $0)"

for mainVer in 4.2 4.3 4.4 4.5; do
    for patchVer in {3427..4018}; do
        _check $mainVer $patchVer
        sleep .1
    done
done
