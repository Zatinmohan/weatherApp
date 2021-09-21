import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/misc/weatherData.dart';
import 'package:weather/api/weather.dart';

class GlobalController extends GetxController {
  var _weatherData = weatherData().obs;
  var _cardIndex = 0.obs;
  RxBool _isloading = true.obs;

  @override
  void onInit() {
    if (_isloading.value == true)
      _fetchLocation();
    else
      getIndex();
    super.onInit();
  }

  _fetchLocation() async {
    print("Fetching Location");
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error("Location not Enabled");

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied)
        return Future.error("Location permissions are denied");
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((value) {
      return APIManager()
          .processData(value.latitude, value.longitude)
          .then((value) {
        _weatherData.value = value;
        _isloading.value = false;
        //print("${_isloading.value}");
      });
    });
  }

  weatherData getData() {
    return _weatherData.value;
  }

  RxBool loading_check() => _isloading;

  RxInt getIndex() {
    print("Getting Index");
    return _cardIndex;
  }
}
