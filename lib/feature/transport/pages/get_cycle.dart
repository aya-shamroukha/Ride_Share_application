import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/config/localstorage.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/share/sized_box.dart';
import 'package:ride_application/feature/transport/bloc/get_cycle_by_id/get_cycle_by_id_bloc.dart';
import 'package:ride_application/feature/transport/bloc/get_cycle_by_id/get_cycle_by_id_event.dart';
import 'package:ride_application/feature/transport/widget/container_for_carfeature.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../share/network_image.dart';
import '../bloc/get_cycle_by_id/get_cycle_by_id_state.dart';
import '../widget/container_for_spe.dart';

class GetCycleScreen extends StatelessWidget {
  const GetCycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCycleByIdBloc()
        ..add(GetCycleByIdSuccessEvent(
            id: getIt.get<SharedPreferences>().getInt('id'))),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      AppStrings.back,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox_width(width: 50.w),
                  ],
                ),
                SizedBox_Height(height: 15.h),
                BlocBuilder<GetCycleByIdBloc, GetCycleByIdState>(
                  builder: (context, state) {
                    if (state is GetCycleByIdSuccessState) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.getallbicycle.model_price[0].model,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox_Height(height: 30.h),
                            Center(
                              child: MyNetworkImage(
                                  width: 269.w,
                                  height: 156.h,
                                  imageUrl:
                                      'https://${state.getallbicycle.photoPath}'),
                            ),
                            SizedBox_Height(height: 30.h),
                            Text(
                              AppStrings.specifications,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox_Height(height: 15.h),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ContainerForSpecifi(
                                  icon: (Icons.settings_suggest),
                                  text: AppStrings.back,
                                  text2: AppStrings.breaktext,
                                ),
                                ContainerForSpecifi(
                                  icon: (Icons.assignment),
                                  text: AppStrings.grips,
                                  text2: AppStrings.gripstext,
                                ),
                                ContainerForSpecifi(
                                  text: AppStrings.tubes,
                                  text2: AppStrings.tubestext,
                                  icon: (Icons.add_road),
                                ),
                                ContainerForSpecifi(
                                  text: AppStrings.stem,
                                  text2: AppStrings.stemtext,
                                  icon: (Icons.directions_bike),
                                )
                              ],
                            ),
                            SizedBox_Height(height: 20.h),
                            Text(
                              AppStrings.carfeatures,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox_Height(height: 15.h),
                            ContainerForCarFeatures(
                              text: 'Type',
                              text2: state.getallbicycle.type,
                            ),
                            SizedBox_Height(height: 8.h),
                            ContainerForCarFeatures(
                              text: 'Size',
                              text2: state.getallbicycle.size.toString(),
                            ),
                            SizedBox_Height(height: 8.h),
                            ContainerForCarFeatures(
                              text: 'Price',
                              text2: state.getallbicycle.model_price[0].price
                                  .toString(),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
