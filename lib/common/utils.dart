import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:start_up_app/common/constants/app_colors.dart';
import 'package:start_up_app/common/constants/assets.dart';
import 'package:start_up_app/common/core_data_source/failure.dart';
import 'package:start_up_app/common/logger.dart';
import 'package:start_up_app/common/routes/routes.dart';
import 'package:start_up_app/common/theme/font_manager.dart';
import 'package:start_up_app/features/authentication/presentation/auth_provider/provider/auth_provider.dart';
import 'package:start_up_app/features/widget/custom_button.dart';
import 'package:start_up_app/features/widget/custom_text.dart';
import 'package:start_up_app/features/widget/loading_widget.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'utils.g.dart';

@riverpod
Utils utils(UtilsRef ref) {
  return Utils(ref);
}

class Utils {
  final UtilsRef ref;
  late final BuildContext context;
  Utils(this.ref) {
    context = ref.watch(contextProvider);
  }

  void showToast(String text,
          {Color? backgroundColor, Color? textColor, int? duration}) =>
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            width: MediaQuery.of(context).size.width - 50,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: duration ?? 4),
            content: CustomText(
              text,
              style: AppFontStyle.almaraiRegularStyle.copyWith(
                color: textColor ?? Colors.white,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: backgroundColor ?? Colors.green.withOpacity(0.7),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        );
      });

  void showErrorToast(String text, {int? duration}) =>
      showToast(text, backgroundColor: Colors.red.withOpacity(0.7));

  bool isRTL() {
    final bool isRTL = (AppLocalizations.of(context)!.localeName) == 'ar';
    return isRTL;
  }

// stack of dialogs to know if there is a dialog with the same title or not
  final _allDialogs = <dynamic>[];
// add dialog to _allDialog to know if there is a dialog with the same title or not
  showEnhancedDialog({required String dialogName, required Function dialog}) {
    if (_allDialogs.isNotEmpty && _allDialogs.last == dialogName) {
      Navigator.pop(context);
    } else {
      _allDialogs.add(dialogName);
    }
    dialog();
  }

// remove dialog from _allDialog
  removeEnhancedDialog({required String dialogName}) {
    if (_allDialogs.contains(dialogName)) {
      _allDialogs.remove(dialogName);
      Navigator.pop(context);
    }
  }

// clear all dialogs from _allDialog
  clearDialogs() {
    _allDialogs.clear();
  }

// custom Network dialog
  showNetworkDialog(
      {required Function() tryAgainMethod, bool isDismissible = true}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    showEnhancedDialog(
      dialogName: AppLocalizations.of(context)!.network_failure,
      dialog: () => showDialog(
        context: context,
        builder: (ctx) {
          return WillPopScope(
            onWillPop: () async {
              if (isDismissible) {
                _allDialogs
                    .remove(AppLocalizations.of(context)!.network_failure);
              }
              return isDismissible;
            },
            child: AlertDialog(
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LottieBuilder.asset(AnimationsAssets.noInternet),
                    const SizedBox(height: 10.0),
                    CustomText(
                      AppLocalizations.of(context)!.network_failure,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          color: Colors.blue,
                          onPressed: () {
                            hideCustomDialog(
                                name: AppLocalizations.of(context)!
                                    .network_failure);
                            tryAgainMethod();
                          },
                          child: CustomText(
                            AppLocalizations.of(context)!.continue_,
                            style: AppFontStyle.almaraiRegularStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }

//show Custom Dialogs
  showCustomDialog(
      {required Widget content,
      List<Widget>? actions,
      required String name,
      bool showClose = false,
      Color? backgroundColor,
      double? widthPercent,
      BorderRadiusGeometry? borderRadius}) {
    showEnhancedDialog(
      dialogName: name,
      dialog: () => showDialog(
        context: context,
        builder: (ctx) {
          return WillPopScope(
            onWillPop: () async {
              hideCustomDialog(name: name);

              return true;
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      (widthPercent ?? 90) /
                      100,
                  child: Material(
                    color: backgroundColor,
                    elevation: 24,
                    borderRadius: borderRadius ?? BorderRadius.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 24),
                      child: content,
                    ),
                  ),
                ),
                if (showClose)
                  Positioned(
                    top: -15,
                    right: -15,
                    child: GestureDetector(
                      onTap: () => hideCustomDialog(name: name),
                      child: const CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 16,
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  ///Handle pagination
  void handlePagination(
      {required ScrollController controller, required Function call}) {
    // ignore: invalid_use_of_protected_member
    if (!controller.hasListeners) {
      controller.addListener(
        () {
// nextPageTrigger will have a value equivalent to 80% of the list size.
          final nextPageTrigger = 0.8 * controller.position.maxScrollExtent;

// _scrollController fetches the next paginated data when the current position of the user on the screen has surpassed

          if (controller.position.pixels > nextPageTrigger) {
            call();
          }
        },
      );
    }
  }

//hide Custom Dialogs
  hideCustomDialog({required String name}) {
    removeEnhancedDialog(dialogName: name);
  }

  /// data sources failures handler
  void handleFailures(Failure failure) {
    switch (failure.runtimeType) {
      case ExceptionFailure:
        showErrorToast(AppLocalizations.of(context)!.something_went_wrong);
        logger.e(failure.runtimeType);
        logger.e(failure.message);

        break;

      case UnAuthorizedFailure:
        ref.read(authProvider.notifier).resetUser();
        showErrorToast(AppLocalizations.of(context)!.un_auth_message);

        break;
      case UnVerifiedFailure:
        break;
      case DatabaseFailure:
        showErrorToast(AppLocalizations.of(context)!.user_not_found);

        break;
      default:
        showErrorToast(failure.message);

        break;
    }
  }

  /// get current Country icon
  String countryCodeToEmoji(String countryCode) {
    countryCode = countryCode.replaceAll('+', '');
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  /// method for hide loading
  void hideLoading() {
    removeEnhancedDialog(dialogName: 'loading');
  }

  /// method for show loading
  void showLoading({String? message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    showEnhancedDialog(
        dialogName: 'loading',
        dialog: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) {
              return WillPopScope(
                onWillPop: () async => false,
                child: const AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  contentPadding: EdgeInsets.zero,
                  content: SizedBox(
                    height: 350,
                    child: LoadingWidget(),
                  ),
                ),
              );
            }));
  }

  ///Home bottom sheet
  homeBottomSheet({required Widget child}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0.07.r),
            topLeft: Radius.circular(0.07.r)),
      ),
      isDismissible: true,
      context: context,
      builder: (ctx) => child,
    );
  }

  // Method to pick multi image or video
  Future<List<AssetEntity>?> pickMultiPicOrVideo({int maxImages = 1}) async {
    bool? isImages = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.image_outlined,
                color: AppColors.mainColor,
              ),
              title: const CustomText(
                  'Utils.AppLocalizations.of(context)!.images'),
              onTap: () {
                Navigator.pop(context, true);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
          ],
        );
      },
    );
    if (isImages == null) return null;

    try {
      if (context.mounted) {
        return await AssetPicker.pickAssets(
          context,
          pickerConfig: AssetPickerConfig(
            requestType: isImages ? RequestType.image : RequestType.video,
            maxAssets: isImages ? maxImages : 1,
          ),
        );
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
    return null;
  }

  //   method to get text directionality
  TextDirection getDirection(String text) {
    final string = text.trim();
    if (string.isEmpty) return TextDirection.ltr;
    final firstUnit = string.codeUnitAt(0);
    if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
        firstUnit > 0x0750 && firstUnit < 0x077F ||
        firstUnit > 0x07C0 && firstUnit < 0x07EA ||
        firstUnit > 0x0840 && firstUnit < 0x085B ||
        firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
        firstUnit > 0x08E3 && firstUnit < 0x08FF ||
        firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
        firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
        firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
        firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
        firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
        firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
        firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
        firstUnit > 0x10800 && firstUnit < 0x10805 ||
        firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
        firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
        firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
        firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
        firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
        firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
        firstUnit > 0x1D242 && firstUnit < 0x1D244) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }

  //   getter to show facebook shimmer effect
  static Shimmer get putShimmer {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        color: Colors.grey.shade300,
      ),
    );
  }
}
