#!/bin/sh
set -e

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=()

realpath() {
  DIRECTORY=$(cd "${1%/*}" && pwd)
  FILENAME="${1##*/}"
  echo "$DIRECTORY/$FILENAME"
}

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm\""
      xcrun mapc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ABSOLUTE_XCASSET_FILE=$(realpath "${PODS_ROOT}/$1")
      XCASSET_FILES+=("$ABSOLUTE_XCASSET_FILE")
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
if [[ "$CONFIGURATION" == "Debug" ]]; then
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/1.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/10.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/10@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/11.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/11@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/12.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/12@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/13.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/13@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/14.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/14@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/15.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/15@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/16.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/16@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/17.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/17@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/18.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/18@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/19.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/19@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/1@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/2.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/20.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/20@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/2@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/3.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/3@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/4.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/4@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/5.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/5@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/6.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/6@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/7.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/7@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/8.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/8@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/9.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/9@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/checkmark.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/checkmark@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/cross.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/cross@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/warning.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/warning@2x.png"
  install_resource "MJRefresh/MJRefreshExample/MJRefreshExample/MJRefresh/MJRefresh.bundle"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_click_image.png"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_click_image@2x.png"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_click_image@3x.png"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_noimage.png"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_noimage@2x.png"
  install_resource "${BUILT_PRODUCTS_DIR}/FSMediaPicker.bundle"
fi
if [[ "$CONFIGURATION" == "Release" ]]; then
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/1.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/10.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/10@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/11.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/11@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/12.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/12@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/13.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/13@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/14.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/14@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/15.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/15@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/16.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/16@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/17.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/17@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/18.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/18@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/19.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/19@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/1@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/2.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/20.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/20@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/2@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/3.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/3@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/4.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/4@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/5.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/5@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/6.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/6@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/7.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/7@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/8.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/8@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/9.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/9@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/checkmark.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/checkmark@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/cross.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/cross@2x.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/warning.png"
  install_resource "FVCustomAlertView/FVCustomAlertView/FVCustomAlertViewResources/warning@2x.png"
  install_resource "MJRefresh/MJRefreshExample/MJRefreshExample/MJRefresh/MJRefresh.bundle"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_click_image.png"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_click_image@2x.png"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_click_image@3x.png"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_noimage.png"
  install_resource "SDWebImage-Category/SDWebImage-Category/Resource/lk_noimage@2x.png"
  install_resource "${BUILT_PRODUCTS_DIR}/FSMediaPicker.bundle"
fi

rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]]; then
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n "$XCASSET_FILES" ]
then
  case "${TARGETED_DEVICE_FAMILY}" in
    1,2)
      TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
      ;;
    1)
      TARGET_DEVICE_ARGS="--target-device iphone"
      ;;
    2)
      TARGET_DEVICE_ARGS="--target-device ipad"
      ;;
    *)
      TARGET_DEVICE_ARGS="--target-device mac"
      ;;
  esac

  # Find all other xcassets (this unfortunately includes those of path pods and other targets).
  OTHER_XCASSETS=$(find "$PWD" -iname "*.xcassets" -type d)
  while read line; do
    if [[ $line != "`realpath $PODS_ROOT`*" ]]; then
      XCASSET_FILES+=("$line")
    fi
  done <<<"$OTHER_XCASSETS"

  printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${IPHONEOS_DEPLOYMENT_TARGET}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
