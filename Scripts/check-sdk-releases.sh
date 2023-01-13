#!/bin/bash

#
# Check TXLiteAVSDK_UGC, LiteAVSDK_UGC_Android SDK releases.
#
# Known versions from CocoaPods Specs: https://github.com/CocoaPods/Specs/tree/master/Specs/a/3/e/TXLiteAVSDK_UGC
# 4.2.3427  Free
# 4.4.3774  Free
# 4.5.4018  Licensed
#
# Result:
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.2/TXLiteAVSDK_UGC_Rename_iOS_4.2.3423.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.2/TXLiteAVSDK_UGC_Rename_iOS_4.2.3427.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.3/TXLiteAVSDK_UGC_Rename_iOS_4.3.3609.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.4/TXLiteAVSDK_UGC_Rename_iOS_4.4.3774.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.5/TXLiteAVSDK_UGC_Rename_iOS_4.5.4018.zip
#
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.2/LiteAVSDK_UGC_Android_4.2.3424.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.2/LiteAVSDK_UGC_Android_4.2.3425.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.2/LiteAVSDK_UGC_Android_4.2.3427.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.3/LiteAVSDK_UGC_Android_4.3.3610.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.4/LiteAVSDK_UGC_Android_4.4.3774.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.5/LiteAVSDK_UGC_Android_4.5.4018.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.5/LiteAVSDK_UGC_Android_4.5.4020.zip
# https://liteavsdk-1252463788.cosgz.myqcloud.com/4.5/LiteAVSDK_UGC_Android_4.5.4021.zip
#

# Usage: _check 4.2 3774
_check()
{
    # iOS SDK
    url="https://liteavsdk-1252463788.cosgz.myqcloud.com/$1/TXLiteAVSDK_UGC_Rename_iOS_$1.$2.zip"
    # Android SDK
    # url="https://liteavsdk-1252463788.cosgz.myqcloud.com/$1/LiteAVSDK_UGC_Android_$1.$2.zip"

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

for mainVer in 4.2 4.3 4.4 4.5; do
    for patchVer in {3300..4300}; do
        _check $mainVer $patchVer
        sleep .1
    done
done
