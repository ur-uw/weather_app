import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/data/address_model.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/helper_functions.dart';

class UserAddress extends StatelessWidget {
  final AddressModel addressModel;
  const UserAddress({Key? key, required this.addressModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      text(
        '${addressModel.city}',
        textStyle: Get.theme.textTheme.headline4!
            .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
      ),
      SizedBox(height: 15),
      text(
        "${addressModel.subLocality!.isNotEmpty ? addressModel.subLocality : addressModel.city}, ${addressModel.countryCode}    ${DateFormat('d MMM, ' 'yy').format(DateTime.now())}",
        textColor: fontColor,
        fontWeight: FontWeight.w500,
      ),
    ]);
  }
}
