import 'package:behype_test/data/model/unsplash_collections_model.dart';
import 'package:behype_test/presentation/home/widgets/user_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class UsersListWidget extends StatelessWidget {
  final List<User> users;
  final Function(int) onTap;
  const UsersListWidget({super.key, required this.users, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.h,
      child: ListView.separated(
        itemBuilder: (_, index) => UserItemWidget(
            user: users[index],
            onTap: () {
              onTap.call(index);
            }),
        separatorBuilder: (_, index) => const SizedBox(width: 8),
        itemCount: users.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
