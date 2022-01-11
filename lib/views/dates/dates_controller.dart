import 'package:daily_fans/services/date/add_new_date_service.dart';
import 'package:daily_fans/services/date/get_dates_list_service.dart';
import 'package:daily_fans/services/date/get_prices_list_by_date_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DatesController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  List dates = [].obs;
  List prices = [].obs;

  List<Map<String, String>> dates2 = [
    {'date': '1400/3/4', 'title': 'aliw'},
    {'date': '1400/3/5', 'title': 'reza'},
    {'date': '1400/3/6', 'title': 'mohammad'},
    {'date': '1400/3/7', 'title': 'saeid'},
    {'date': '1400/3/8', 'title': 'mehdi'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
    {'date': '1400/3/9', 'title': 'hasan'},
  ].obs;

  List prices2 = [
    {
      'sellerName': 'seller 1',
      'items': {
        'price': 225000,
        'active': true,
        'partNumber': 'Pn 1001',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'red',
      }
    },
    {
      'sellerName': 'seller 2',
      'items': {
        'price': 325000,
        'active': true,
        'partNumber': 'Pn 1002',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'blue',
      }
    },
    {
      'sellerName': 'seller 3',
      'items': {
        'price': 425000,
        'active': true,
        'partNumber': 'Pn 1003',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'green',
      }
    },
    {
      'sellerName': 'seller 4',
      'items': {
        'price': 125000,
        'active': true,
        'partNumber': 'Pn 1004',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'white',
      }
    },
    {
      'sellerName': 'seller 5',
      'items': {
        'price': 525000,
        'active': true,
        'partNumber': 'Pn 1005',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'brown',
      }
    },
    {
      'sellerName': 'seller 6',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 7',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 8',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 9',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 10',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 11',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 12',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 13',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 14',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 15',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 16',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 17',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
    {
      'sellerName': 'seller 18',
      'items': {
        'price': 625000,
        'active': true,
        'partNumber': 'Pn 1006',
        'yearMade': 2021,
        'guarantee': true,
        'color': 'orange',
      }
    },
  ].obs;

  var descending = true.obs;

  @override
  void onReady() {
    getDatesList();
  }

  void changeSortDates() {
    descending.value = !descending.value;
  }

  Future addNewDate() async {
    var year = yearController.text.length == 2
        ? yearController.text
        : "0${yearController.text}"; //TODO
    var req = AddNewDateRequest(
      title: titleController.text,
      dateTime: "14$year/${monthController.text}/${dayController.text}",
    );
    var res = await addNewDateService(req);
    return res;
  }

  Future getDatesList() async {
    var res = await getDatesListService();
    if (res == null) return;

    for (var key in res!.data!) {
      dates.add(key);
    }
  }

  Future getPriceListByDate(int dateId) async {
    try {
      var res = await getPricesListByDateService(dateId);
      for (var key in res!.data) {
        prices.add(key);
      }
    } catch (e) {
      print('errrrrrrrrrrrrrrrrrr');
      print(e);
    }
  }

  void emptyPriceList() {
    prices.clear();
  }
}
