import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/core/utils/service_locator.dart';
import 'package:onestopshop/features/Acount/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:onestopshop/features/Acount/repo/auth_repo.dart';
import 'package:onestopshop/features/Home/data/models/repos/home_repo_impl.dart';
import 'package:onestopshop/features/Home/presentation/view_models/best_seller_perfume_cubit/best_seller_perfume_cubit.dart';
import 'package:onestopshop/features/Home/presentation/view_models/featured_perfume_cubit/featured_perfume_cubit.dart';
import 'package:onestopshop/features/cart/presentation/view_models/cubit/cart_cubit.dart';
import 'package:onestopshop/features/profile/data/models/app_settings_model.dart';
import 'package:onestopshop/features/profile/presentation/view_models/settings_cubit/settings_cubit.dart';
import 'package:onestopshop/features/search/data/search_repo.dart';
import 'package:onestopshop/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:onestopshop/features/splah/presentation/views/splash_view.dart';
import 'package:onestopshop/services/app_settings_service.dart';
import 'package:onestopshop/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  final settingsService = AppSettingsService();
  setup();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder:
          (context) => BlocProvider(
            create: (context) => SettingsCubit(settingsService),
            child: const OneStopShop(),
          ),
    ),
  );
}

class OneStopShop extends StatelessWidget {
  const OneStopShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchCubit(SearchRepo(getIt.get()))),

        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(
          create:
              (context) =>
                  FeaturedPerfumeCubit(getIt.get<HomeRepoImpl>())
                    ..featchFeaturePerfume(),
        ),
        BlocProvider(
          create:
              (context) =>
                  BestSellerPerfumeCubit(getIt.get<HomeRepoImpl>())
                    ..featchBestSellerPerfume(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(AuthRepository())..tryAutoLogin(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, AppSettingsModel>(
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              scaffoldBackgroundColor: kPrimaryColor,
              brightness: state.isDarkMode ? Brightness.dark : Brightness.light,
              primarySwatch: kAppBarColor,
            ),

            home: const SplashView(),
          );
        },
      ),
    );
  }
}
