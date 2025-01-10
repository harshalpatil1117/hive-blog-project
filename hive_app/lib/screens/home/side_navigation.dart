
import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:network/network.dart';

import '../../utils/app_strings.dart';





class SideNavigation extends ConsumerStatefulWidget {
  const SideNavigation({super.key});

  @override
  ConsumerState<SideNavigation> createState() => _SideNavigationState();
}

class _SideNavigationState extends ConsumerState<SideNavigation> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    final size = MediaQuery.of(context).size;

    return Drawer(
      width: size.width * 0.85,
      backgroundColor:
          theme.hiveColorsExtensions.onBackground.withOpacity(0),
      surfaceTintColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: theme.hiveColorsExtensions.secondary,
        ),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          shrinkWrap: true,
          children: [
            Container(
              color: theme.hiveColorsExtensions.primary,
              padding: padding.symmetric(
                  vertical: Dimensions.smaller, horizontal: Dimensions.small),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Space(Dimensions.smaller),
                      Container(
                        width: 75, // Adjust the size as needed
                        height: 75, // Adjust the size as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.hiveColorsExtensions.primary,
                        ),
                        child: Icon(
                          FontAwesomeIcons.solidCircleUser,
                          color: theme.hiveColorsExtensions.onBackground,
                          size: 75,
                        ),
                      ),
                      const Space(Dimensions.smaller),
                      Text(
                        '\$0',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.hiveColorsExtensions.onBackground,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  const Space(Dimensions.small),
                  SizedBox(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            theme.hiveColorsExtensions.secondary),
                        foregroundColor: MaterialStatePropertyAll(
                            theme.hiveColorsExtensions.onBackground),
                      ),
                      onPressed: () {

                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.arrowRightToBracket,
                              size: 20,
                              color:
                              theme.hiveColorsExtensions.onBackground,
                            ),
                            const Space(Dimensions.small),
                            Text(
                              "Login",
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Space(Dimensions.smaller),
                ],
              ),
            ),
            // isGroupLogin ? DrawerGroupItems() :
            const DrawerIndividualItems(),
          ],
        ),
      ),
    );
  }
}

class ExpansionChildItem extends StatelessWidget {
  const ExpansionChildItem({
    super.key,
    required this.itemTitle,
    required this.itemIcon,
    required this.onItemPressed,
  });

  final VoidCallback onItemPressed;
  final String itemTitle;
  final Widget itemIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Padding(
      padding: padding.symmetric(
        vertical: Dimensions.smallest,
        horizontal: Dimensions.medium,
      ),
      child: Container(
        padding: padding.symmetric(
          vertical: Dimensions.smallest,
          // horizontal: Dimensions.medium,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // Adjust the radius as needed
          border: Border.all(
            color: theme.hiveColorsExtensions.secondary,
            // Set the color of the border
            width: 2.0, // Set the width of the border
          ),
        ),
        child: InkWell(
          onTap: onItemPressed,
          child: Container(
            padding: padding.symmetric(
              horizontal: Dimensions.small,
            ),
            child: Row(
              children: [
                itemIcon,
                const Space(Dimensions.small),
                Expanded(
                  child: Text(
                    itemTitle,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerIndividualItems extends StatefulWidget {
  const DrawerIndividualItems({super.key});

  @override
  State<DrawerIndividualItems> createState() => _DrawerIndividualItemsState();
}

class _DrawerIndividualItemsState extends State<DrawerIndividualItems> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Padding(
      padding: padding.symmetric(
        vertical: Dimensions.smaller,
        horizontal: Dimensions.small,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50, // Adjust the size as needed
                  height: 50, // Adjust the size as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.hiveColorsExtensions.primary,
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    size: 24,
                    color: theme.hiveColorsExtensions.onBackground,
                  ),
                ),
                title: Text(
                  AppStrings.welcome,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onTap: () {},
              ),
              const Space(Dimensions.small),
            ],
          ),
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50, // Adjust the size as needed
                  height: 50, // Adjust the size as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.hiveColorsExtensions.primary,
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    size: 24,
                    color: theme.hiveColorsExtensions.onBackground,
                  ),
                ),
                title: Text(
                  AppStrings.faq,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) =>
                  //     const StockManagementScreen(),
                  //   ),
                  // );
                },
              ),
              const Space(Dimensions.small),
            ],
          ),
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50, // Adjust the size as needed
                  height: 50, // Adjust the size as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.hiveColorsExtensions.primary,
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    size: 24,
                    color: theme.hiveColorsExtensions.onBackground,
                  ),
                ),
                title: Text(
                  AppStrings.blockExplorer,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) =>
                  //     const StockManagementScreen(),
                  //   ),
                  // );
                },
              ),
              const Space(Dimensions.small),
            ],
          ),
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50, // Adjust the size as needed
                  height: 50, // Adjust the size as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.hiveColorsExtensions.primary,
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    size: 24,
                    color: theme.hiveColorsExtensions.onBackground,
                  ),
                ),
                title: Text(
                  AppStrings.nightMode,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onTap: () {

                },
              ),
              const Space(Dimensions.small),
            ],
          ),
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50, // Adjust the size as needed
                  height: 50, // Adjust the size as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.hiveColorsExtensions.primary,
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    size: 24,
                    color: theme.hiveColorsExtensions.onBackground,
                  ),
                ),
                title: Text(
                  AppStrings.stolenAccountsRecovery,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onTap: () {

                },
              ),
              const Space(Dimensions.small),
            ],
          ),

        ],
      ),
    );
  }
}
