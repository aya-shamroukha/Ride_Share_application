// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/config/localstorage.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/share/custom_button.dart';
import 'package:ride_application/feature/share/network_image.dart';
import 'package:ride_application/feature/share/shimmer_body.dart';
import 'package:ride_application/feature/share/sized_box.dart';
import 'package:ride_application/feature/transport/bloc/get_all_bicycle_bloc/get_all_bicycle_bloc.dart';
import 'package:ride_application/feature/transport/bloc/get_all_bicycle_bloc/get_all_bicycle_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/resources/app_color.dart';
import '../bloc/get_all_bicycle_bloc/get_all_bicycle_state.dart';

class GetAllBicycleScreen extends StatelessWidget {
  const GetAllBicycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            GetAllBicycleBloc()..add(GetAllBicycleSuccessEvent()),
        child: SafeArea(
            child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox_Height(height: 10.h),
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox_width(width: 50.w),
                  ],
                ),
                SizedBox_Height(height: 10.h),
                Text(
                  AppStrings.avaiablecycle,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColor.grey2),
                ),
                SizedBox_Height(height: 30.h),
                BlocBuilder<GetAllBicycleBloc, GetAllBicycleState>(
                    builder: (context, state) {
                  if (state is GetAllBicycleSuccessState) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: state.getallbicycle.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: 363.w,
                                  height: 170.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary50,
                                    border: Border.all(color: AppColor.primary),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.getallbicycle[index]
                                                      .type,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall!
                                                      .copyWith(
                                                          color: AppColor
                                                              .textcolor),
                                                ),
                                                SizedBox_Height(height: 10.h),
                                                Row(
                                                  children: [
                                                    Text(
                                                      state.getallbicycle[index]
                                                          .model_price[0].model,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall!
                                                          .copyWith(
                                                              color: AppColor
                                                                  .grey),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8.0),
                                                      child: Container(
                                                        width: 3,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColor.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                    ),
                                                    Text(
                                                      state.getallbicycle[index]
                                                          .size
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall!
                                                          .copyWith(
                                                              color: AppColor
                                                                  .grey),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8.0),
                                                      child: Container(
                                                        width: 3,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColor.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                    ),
                                                    Text(
                                                      state.getallbicycle[index]
                                                          .model_price[0].price
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall!
                                                          .copyWith(
                                                              color: AppColor
                                                                  .grey),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox_Height(height: 5.h),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.location_on),
                                                    Text(
                                                      '800m (5mins away)',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall!
                                                          .copyWith(
                                                            color: AppColor
                                                                .titlecolor,
                                                          ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            MyNetworkImage(
                                                width: 85.w,
                                                height: 60.h,
                                                imageUrl:
                                                    'https://${state.getallbicycle[index].photoPath}')
                                          ],
                                        ),
                                        SizedBox_Height(height: 18.h),
                                        CustomButton(
                                            width: 300,
                                            background: AppColor.primary50,
                                            textcolor: AppColor.primary,
                                            onPressed: () {
                                              getIt
                                                  .get<SharedPreferences>()
                                                  .setInt(
                                                      'id',
                                                      state.getallbicycle[index]
                                                          .id);
                                              print(getIt
                                                  .get<SharedPreferences>()
                                                  .getInt('id'));
                                              Navigator.of(context)
                                                  .pushNamed('getCycle');
                                            },
                                            text: AppStrings.viewcycle)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: const ShimmerBody(),
                            );
                          })),
                    );
                  }
                })
              ],
            ),
          ),
        )));
  }
}
