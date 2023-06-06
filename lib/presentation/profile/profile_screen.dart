import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/style/app_text_styles.dart';
import 'package:behype_test/core/consts/widgets/app_loader_widget.dart';
import 'package:behype_test/core/consts/widgets/custom_app_bar.dart';
import 'package:behype_test/core/consts/widgets/custom_network_image_widget.dart';
import 'package:behype_test/domain/user_photos/user_photos_cubit.dart';
import 'package:behype_test/domain/user_photos/user_photos_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  const ProfileScreen({super.key, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserPhotosCubit _photosCubit;

  @override
  void initState() {
    _photosCubit = context.read<UserPhotosCubit>();
    _photosCubit.getUserPhotos(widget.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          actionIcon: Icon(
            Icons.notifications,
            size: 32,
          ),
          centerTitle: true,
          title: 'Test App',
        ),
        body: BlocBuilder<UserPhotosCubit, UserPhotosState>(
          builder: (_, state) {
            if (state is ShowUserPhotosState) {
              if (state.isLoading) {
                return const Center(
                    child: AppLoaderWidget(color: AppColors.grey));
              }

              if (state.photos.isEmpty) {
                return Center(
                    child: Text(
                  "User dont have photos",
                  style: AppTextStyles.splashTitle
                      .copyWith(color: AppColors.black),
                ));
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomNetworkImageWidget(
                      url: state.selectedPhoto!.urls.full,
                      size: 500,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                        height: 10.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) => InkWell(
                                  borderRadius: BorderRadius.circular(16),
                                  onTap: () {
                                    _photosCubit
                                        .setSelectedPhoto(state.photos[index]);
                                  },
                                  child: CustomNetworkImageWidget(
                                    borderRadius: 16,
                                    size: 100,
                                    url: state.photos[index].urls.full,
                                  ),
                                ),
                            separatorBuilder: (_, index) =>
                                const SizedBox(width: 8),
                            itemCount: state.photos.length))
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
