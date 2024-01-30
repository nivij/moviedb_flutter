import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


import '../../../res/widgets/noInterrnetWidget.dart';

class ConnectivityHandler extends HookWidget {
  final Widget child;

  const ConnectivityHandler({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectivity = useState<ConnectivityResult>(ConnectivityResult.none);

    useEffect(() {
      final subscription = Connectivity().onConnectivityChanged.listen((result) {
        connectivity.value = result;
      });

      return () {
        subscription.cancel();
      };
    }, []);

    return connectivity.value == ConnectivityResult.none
        ? NoInternetWidget()
        : child;
  }
}
