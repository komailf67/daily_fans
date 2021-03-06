import 'package:daily_fans/models/color/color_model.dart';
import 'package:daily_fans/models/date/loading_date_model.dart';
import 'package:daily_fans/models/date/price_model.dart';
import 'package:daily_fans/services/color/get_colors_list_service.dart';
import 'package:daily_fans/services/date/add_new_date_service.dart';
import 'package:daily_fans/services/date/add_new_product_details_service.dart';
import 'package:daily_fans/services/date/delete_date_service.dart';
import 'package:daily_fans/services/date/delete_priceList_service.dart';
import 'package:daily_fans/services/date/edit_product_details_service.dart';
import 'package:daily_fans/services/date/get_dates_list_service.dart';
import 'package:daily_fans/services/date/get_prices_list_by_date_service.dart';
import 'package:daily_fans/services/date/send_date_to_contacts_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

enum DatesLoadings { getDates, getPrices }

class DatesController extends GetxController {
  Jalali now = Jalali.now();
  // DatesController({this.now});
  // Jalali? now;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  late String dayController = now.day.toString();
  late String monthController = now.month.toString();
  late String yearController = now.year.toString();

  Rx<PriceModel> productDetails = PriceModel().obs;
  RxInt selectedColorValue = 0.obs;
  RxList<LoadingDateModel> dates = <LoadingDateModel>[].obs;
  RxList<PriceModel> prices = <PriceModel>[].obs;
  RxList<ColorType> colors = <ColorType>[].obs;

  @override
  void onReady() {
    getDatesList();
    getColors();
  }

  var descending = true.obs;
  RxBool hasGuarantee = true.obs;
  RxBool getDatesListLoading = false.obs;
  RxBool getPriceListLoading = false.obs;

  void changeSelectedColor(int colorValue) {
    ColorType selectedColor =
        colors.firstWhere((element) => element.id == colorValue);
    selectedColorValue.value = colorValue;
    productDetails.value.colorId = colorValue;
    productDetails.value.color = selectedColor;
    productDetails.refresh();
  }

  void validateNewProductDetails() {
    //TODO
    productDetails.toJson().forEach((final String key, final value) {
      // if (value == null || value) {

      // }

      // print((value is String && value.length));
      // print("$key => $value");
    });
    // print(productDetails.values);
// productDetails.val
  }

  setPriceListId(int id) {
    productDetails.value.priceListId = id;
  }

  void handleNewProductDetails(String paramName, value) {
    switch (paramName) {
      case 'title':
        productDetails.value.title = value;
        break;
      case 'description':
        productDetails.value.description = value;
        break;
      case 'price':
        if (value.length > 0) {
          productDetails.value.price = int.parse(value);
        }
        // productDetails.value.price = int.parse(value);
        break;
      case 'partNumber':
        productDetails.value.partNumber = value;
        break;
      case 'yearModel':
        if (value.length > 0) {
          productDetails.value.yearModel = int.parse(value);
        }
        break;
      case 'color':
        productDetails.value.colorId = value;
        break;
      case 'hasGuarantee':
        productDetails.value.hasGuarantee = value;
        break;
      case 'priceListId':
        productDetails.value.priceListId = int.parse(value);
        break;
      default:
    }
  }

  void prepareEditPriceList(int priceId) {
    PriceModel selectedPriceList = prices.firstWhere((e) => e.id == priceId);
    productDetails.value = selectedPriceList;
  }

  Future editPiceList() async {
    EditProductDetailsResponse? res = await editProductDetailsService(
      EditProductDetailsRequest(
        id: productDetails.value.id!,
        title: productDetails.value.title!,
        description: productDetails.value.description!,
        price: productDetails.value.price!,
        partNumber: productDetails.value.partNumber!,
        yearModel: productDetails.value.yearModel!,
        colorId: productDetails.value.color!.id,
        hasGuarantee: productDetails.value.hasGuarantee!,
        priceListId: productDetails.value.priceListId!,
      ),
    );
    return res;
  }

  void changeSortDates() {
    descending.value = !descending.value;
    getDatesList();
  }

  void toggleGuarantee() {
    hasGuarantee.value = !hasGuarantee.value;
    productDetails.value.hasGuarantee = hasGuarantee.value;
    productDetails.refresh();
  }

  Future addNewDate() async {
    // var year = yearController.text.length == 2
    //     ? yearController.text
    //     : "0${yearController.text}"; //TODO
    var req = AddNewDateRequest(
      title: titleController.text,
      // dateTime: "14$year/${monthController.text}/${dayController.text}",
      dateTime: "$yearController/$monthController/$dayController",
    );
    var res = await addNewDateService(req);

    if (res != null && res.success!) {
      emptyTitleInAddNewDate();
    }
    return res;
  }

  Future getDatesList() async {
    GetDatesListResponse? res =
        await getDatesListService(descending.value ? 'dsc' : 'asc');
    if (res == null) return;
    emptyDatesList();

    for (var key in res.data!) {
      dates.add(
        LoadingDateModel(
          id: key.id,
          title: key.title,
          description: key.description,
          dateTime: key.dateTime,
          userId: key.userId,
          loading: false,
        ),
      );
    }
  }

  Future getColors() async {
    colors.clear();
    var res = await getColorsListService();
    if (res == null) return;

    for (var key in res!.data!) {
      colors.add(ColorType(id: key.id, title: key.title, hex: key.hex));
    }
  }

  Future<bool> getPriceListByDate(int dateId) async {
    try {
      emptyPriceList();
      GetPricesListByDateServiceResponse? res =
          await getPricesListByDateService(dateId);
      if (res == null) return false;

      for (var key in res.data!) {
        prices.add(
          PriceModel(
            id: key.id,
            title: key.title,
            description: key.description,
            price: key.price,
            partNumber: key.partNumber,
            yearModel: key.yearModel,
            color: key.color,
            hasGuarantee: key.hasGuarantee,
            priceListId: key.priceListId,
          ),
        );
      }
      return true;
    } catch (e) {
      return false;
      print('errrrrrrrrrrrrrrrrrr');
      print(e);
    }
  }

  void emptyDatesList() {
    dates.clear();
  }

  void emptyPriceList() {
    prices.clear();
  }

  void emptyTitleInAddNewDate() {
    titleController.clear();
  }

  void emptyNewProductDetailsObject() {
    productDetails.value = PriceModel();
  }

  Future addNewProductDetails() async {
    var req = AddNewProductDetailsRequest(
      title: productDetails.value.title ?? '',
      description: productDetails.value.description ?? '',
      price: productDetails.value.price!,
      partNumber: productDetails.value.partNumber ?? '',
      yearModel: productDetails.value.yearModel.toString(),
      colorId: productDetails.value.colorId,
      hasGuarantee: productDetails.value.hasGuarantee ?? true,
      priceListId: productDetails.value.priceListId!,
    );
    var res = await addNewProductDetailsService(req);
    return res;
  }

  Future sendDatesToContacts(int priceListId, int index) async {
    var req = SendDatesToContactRequest(priceListId: priceListId);
    return await sendDatesToContactsService(req, index);
  }

  void toggleLoading(loadingName, bool state) {
    switch (loadingName) {
      case DatesLoadings.getDates:
        getDatesListLoading.value = state;
        break;
      case DatesLoadings.getPrices:
        getPriceListLoading.value = state;
        break;
      default:
    }
    // if (loadingName == DatesLoadings.getDates) {
    //   getPriceListLoading.value = state;
    // }
  }

  void toggleShareLoading(int index, state) {
    var selectedDate = dates[index];
    selectedDate.loading = state;
    dates[index] = selectedDate;
  }

  void resetDatesInpute() {
    yearController = now.year.toString();
    monthController = now.month.toString();
    dayController = now.day.toString();
  }

  Future deleteDate(int dateId, int index) async {
    try {
      DeleteDateRequest req = DeleteDateRequest(dateId: dateId);
      DeleteDateResponse? res = await deleteDateService(req);
      if (res == null) return;
      if (res.success!) {
        dates.removeAt(index);
      } else {
        //TODO handle all errors in a service
        Get.snackbar(
          "Error",
          res.message!,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {}
  }

  Future deletePriceList(int priceListId, int index) async {
    try {
      DeletePriceListRequest req =
          DeletePriceListRequest(priceListId: priceListId);
      DeletePriceListResponse? res = await deletePriceListService(req);
      if (res == null) return;
      prices.removeAt(index);
    } catch (e) {}
  }
}
