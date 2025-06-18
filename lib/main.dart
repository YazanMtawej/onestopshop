import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/service_locator.dart';
import 'package:onestopshop/features/Home/data/models/repos/home_repo_impl.dart';
import 'package:onestopshop/features/Home/presentation/view_models/best_seller_perfume_cubit/best_seller_perfume_cubit.dart';
import 'package:onestopshop/features/Home/presentation/view_models/featured_perfume_cubit/featured_perfume_cubit.dart';
import 'package:onestopshop/features/splah/presentation/views/splash_view.dart';
import 'package:onestopshop/services/notification_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  setup();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const OneStopShop(),
    ),
  );
}

class OneStopShop extends StatelessWidget {
  const OneStopShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedPerfumeCubit(getIt.get<HomeRepoImpl>())..featchFeaturePerfume()
        ),
         BlocProvider(
          create:
              (context) =>
                  BestSellerPerfumeCubit(getIt.get<HomeRepoImpl>())..featchBestSellerPerfume(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimaryColor.withValues(alpha: .8),
        ),
        home: const SplashView(),
      ),
    );
  }
}
