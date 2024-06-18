import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import '../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../i10l/locale_keys.g.dart';

class ListData {
  final AuthCubit authCubit;
  final ReqAndOfferCubit req;
  final BuildContext context;

  ListData({required this.authCubit, required this.req, required this.context});

  static List<String> typeUserList = [
    LocaleKeys.user.tr(),
    LocaleKeys.factory.tr(),
    LocaleKeys.imAndExCompany.tr(),
    LocaleKeys.shippingCompany.tr(),
  ];
  static List<String> typeInternational = ['Wild', 'Ocean', 'Air', 'Best Case'];

  List<Map<String, dynamic>> getInputConfigs() {
    return [
      {
        'controller': authCubit.locationController,
        'inputName': LocaleKeys.location.tr(),
        'keyboardType': TextInputType.streetAddress,
      },
      {
        'controller': authCubit.websiteController,
        'inputName': LocaleKeys.website.tr(),
        'keyboardType': TextInputType.url,
      },
    ];
  }

  List<Map<String, dynamic>> getInputUser() {
    return [
      {
        'controller': authCubit.sSNController,
        'inputName': LocaleKeys.sSN.tr(),
        'keyboardType': TextInputType.number,
      },
      {
        'controller': authCubit.nationalityController,
        'inputName': LocaleKeys.nationality.tr(),
        'keyboardType': TextInputType.text,
      },
    ];
  }

  List<Map<String, dynamic>> getInputPhotoUser() {
    return [
      {
        'name': authCubit.photoUser,
        'text': LocaleKeys.photoProfile.tr(),
      },
    ];
  }

  List<Map<String, dynamic>> getInputPhotoCompany() {
    return [
      {
        'name': authCubit.industrialRecord,
        'text': LocaleKeys.industrialRecord.tr(),
      },
      {
        'name': authCubit.commercialRecord,
        'text': LocaleKeys.commercialRecord.tr(),
      },
     /* {
        'name': authCubit.importCard,
        'text': LocaleKeys.importCard.tr(),
      },
      {
        'name': authCubit.taxCard,
        'text': LocaleKeys.taxCard.tr(),
      },*/
    ];
  }

  List<Map<String, dynamic>> getInputShipping() {
    return [
      {
        'controller': authCubit.businessHoursController,
        'inputName': LocaleKeys.businessHours.tr(),
        'keyboardType': TextInputType.text,
      },
    ];
  }

  List<Map<String, dynamic>> getInputCompany() {
    return [
      {
        'controller': authCubit.countriesTarget,
        'inputName': LocaleKeys.targetsCountries.tr(),
        'keyboardType': TextInputType.text,
      },
      {
        'controller': authCubit.countriesDealing,
        'inputName': LocaleKeys.countriesDealing.tr(),
        'keyboardType': TextInputType.text,
      },
    ];
  }

  List<Map<String, dynamic>> getInputWild() {
    return [
      {
        'controller': req.typeOfTruck,
        'inputName': 'Type of trucks',
        'keyboardType': TextInputType.number,
      },
      {
        'controller': req.weightOfSingleCarton,
        'inputName': 'Weight of Single carton',
        'keyboardType': TextInputType.text,
      },
    ];
  }

  List<Map<String, dynamic>> getInputOcean() {
    return [
      {
        'controller': req.numberOfContainers,
        'inputName': 'Number of Containers',
        'keyboardType': TextInputType.number,
      },
      {
        'controller': req.typeOfContainer,
        'inputName': 'Type of Container',
        'keyboardType': TextInputType.text,
      },
    ];
  }

  List<Map<String, dynamic>> getInputAir() {
    return [
      {
        'controller': req.numberOfCarton,
        'inputName': 'Number of Cartons',
        'keyboardType': TextInputType.number,
      },
      {
        'controller': req.weightOfSingleCarton,
        'inputName': 'Weight of single carton',
        'keyboardType': TextInputType.text,
      },
    ];
  }

  List<Map<String, dynamic>> getInputInter() {
    return [
      {
        'controller': req.lengthController,
        'inputName': LocaleKeys.length.tr(),
        'keyboardType': TextInputType.text,
      },
      {
        'controller': req.widthController,
        'inputName': LocaleKeys.width.tr(),
        'keyboardType': TextInputType.text,
      },
      {
        'controller': req.heightController,
        'inputName': 'height',
        'keyboardType': TextInputType.text,
      },
    ];
  }
}
