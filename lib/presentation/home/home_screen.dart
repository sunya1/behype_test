import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/widgets/app_loader_widget.dart';
import 'package:behype_test/core/consts/widgets/custom_app_bar.dart';
import 'package:behype_test/core/consts/widgets/custom_text_field.dart';
import 'package:behype_test/domain/home/home_cubit.dart';
import 'package:behype_test/domain/home/home_state.dart';
import 'package:behype_test/domain/user_photos/user_photos_cubit.dart';
import 'package:behype_test/presentation/home/widgets/carousel_widget.dart';
import 'package:behype_test/presentation/home/widgets/photos_grid_view_widget.dart';
import 'package:behype_test/presentation/home/widgets/users_list_widget.dart';
import 'package:behype_test/presentation/profile/profile_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    _homeCubit.getAllData();
    _homeCubit.initPaginationControllerListener();

    super.initState();
  }

  final CarouselController _controller = CarouselController();

  int _currentPageIndex = 0;
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
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is HomeShowCollectionsState,
        builder: (_, state) {
          if (state is HomeShowCollectionsState) {
            if (state.isLoading) {
              return const Center(
                child: AppLoaderWidget(
                  color: AppColors.grey,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomTextField(
                      hint: 'What are you looking for? ',
                      borderColor: AppColors.grey94,
                      isEnabledBorder: true,
                      
                      onChanged: (String query) {
                        _homeCubit.setQuery(query);
                      },
                    ),
                  ),
                  CarouselWidget(
                    controller: _controller,
                    currentPageIndex: _currentPageIndex,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: UsersListWidget(
                      users: state.users,
                      onTap: (int index) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => UserPhotosCubit(),
                                  child: ProfileScreen(
                                      username:
                                          state.unsplashCollections[index].user.username),
                                )));
                      },
                    ),
                  ),
                  PhotosGridViewWidget(
                      pagingController: _homeCubit.getPagingController,
                      photos: state.photos)
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
