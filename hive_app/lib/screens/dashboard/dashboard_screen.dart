import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/network.dart';

import '../../utils/app_strings.dart';
import '../home/side_navigation.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  String selectedType = 'Trending';
  List<String> type = [
    'Trending',
    'Hot',
    'Created',
    'Promoted',
    'Payout',
    'Payout_comments',
    'Muted'
  ];
  final regexBodyText = RegExp(r'!\[.*?\]\(.*?\)|https?:\/\/\S+|\*|\<.*?>');

  HiveBlogResponse hiveBlogResponse = const HiveBlogResponse();
  List<HiveBlogData> hiveBlogData = [];

  Future<void> getHiveBlogDataCall() async {
    HiveBlogRequest request = HiveBlogRequest(
        id: 1,
        jsonrpc: '2.0',
        method: 'bridge.get_ranked_posts',
        params: Params(
            observer: "hive.blog", sort: selectedType.toLowerCase(), tag: ''));
    await ref.read(hiveBlogDataProvider.notifier).hiveBlog(request);
    setState(() {
      hiveBlogResponse = ref.read(hiveBlogDataProvider).hiveBlogResponse;
    });
    if (hiveBlogResponse.result != null ||
        hiveBlogResponse.result != [] ||
        hiveBlogResponse.result!.isNotEmpty) {
      setState(() {
        hiveBlogData = hiveBlogResponse.result!;
        // hiveBlogData.addAll(hiveBlogResponse.result ?? []);
      });
    } else {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  String _timeAgo(String created) {

    DateTime createdDate = DateTime.parse(created);

    DateTime now = DateTime.now();

    Duration difference = now.difference(createdDate);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
  String _timeOut(String payoutAt) {

    DateTime createdDate = DateTime.parse(payoutAt);

    DateTime now = DateTime.now();

    Duration difference = createdDate.difference(now);

    if (difference.inDays > 0) {
      return '${difference.inDays} days';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes';
    } else {
      return 'Just now';
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(const Duration(microseconds: 1)).then(
          (_) async {
            await getHiveBlogDataCall();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: HomeAppBar(
        onNotificationPressed: () {},
        notificationNumber: 2,
        title: AppStrings.appName,
        title2: ' ${AppStrings.dashboardTitle}',
        notifyIcon: Icons.notifications,
      ),
      drawer: const SideNavigation(),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding.all(Dimensions.small),
          child: Column(
            children: [
              BaseDropDownFormField(
                label: '',
                onChanged: (value) async {
                  setState(() {
                    selectedType = value!;
                  });
                  print(selectedType);
                  await getHiveBlogDataCall();
                },
                validator: (value) {
                  return null;
                },
                value: selectedType,
                options: type,
              ),
              hiveBlogData.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: hiveBlogData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: Padding(
                            padding: padding.all(Dimensions.small),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Center(
                                        child: Text(
                                          hiveBlogData[index]
                                              .author!
                                              .substring(0, 1),
                                        ),
                                      ),
                                      backgroundColor: theme
                                          .hiveColorsExtensions.onBackground,
                                      radius: 15,
                                    ),
                                    const Space(Dimensions.smallest),
                                    Text(
                                      '${hiveBlogData[index].author}',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    Text(
                                      '(${hiveBlogData[index].authorReputation?.toStringAsFixed(0)})',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    Expanded(
                                      child: Text(
                                        ' in ${hiveBlogData[index].communityTitle ?? "#${hiveBlogData[index].category}"} • ${_timeAgo(hiveBlogData[index].updated.toString())}',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                                color: theme.hiveColorsExtensions
                                                    .onBackground
                                                    .withOpacity(0.5)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
const Space(Dimensions.smaller),
                                Image.network((hiveBlogData[index]
                                                .jsonMetadata!
                                                .image ==
                                            null ||
                                        hiveBlogData[index]
                                            .jsonMetadata!
                                            .image!
                                            .isEmpty)
                                    ? "https://thumbs.dreamstime.com/b/web-324671699.jpg"
                                    : hiveBlogData[index]
                                        .jsonMetadata!
                                        .image!
                                        .first),
                                const Space(Dimensions.smaller),
                                Text(
                                  hiveBlogData[index].title.toString(),
                                  style: theme.textTheme.titleLarge,
                                ),
                                const Space(Dimensions.smaller),
                                Text(
                                  hiveBlogData[index]
                                      .body!
                                      .replaceAll(regexBodyText, '')
                                      .trim(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const Space(Dimensions.smaller),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                         const Icon(
                                            CupertinoIcons
                                                .chevron_up_circle_fill,
                                            color: Colors.red,
                                          ),
const Space(Dimensions.smallest),
                                         const Icon(
                                            CupertinoIcons.chevron_down_circle,
                                          ),
const Space(Dimensions.smaller),

                                        Tooltip(
                                          message : 'Pending payout amount: \$${hiveBlogData[index].payout?.toStringAsFixed(2)} \n'
                                              'Payout in ${_timeOut(hiveBlogData[index].payoutAt.toString())}',
                                          child: Row(
                                            children: [
                                              Text(
                                                '\$ ${hiveBlogData[index].payout?.toStringAsFixed(2)}',
                                                style: theme.textTheme.titleMedium,
                                              ),
                                              Icon(Icons.arrow_drop_down,color: theme.hiveColorsExtensions.onBackground.withOpacity(0.5),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Space(Dimensions.medium),
                                    Row(
                                      children: [
                                    Icon(CupertinoIcons.chevron_up,color: theme.hiveColorsExtensions.onBackground.withOpacity(0.4),),
                                        Text(
                                          '${hiveBlogData[index].stats?.totalVotes ?? 0}',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                    const Space(Dimensions.medium),
                                    Row(
                                      children: [
                                        Icon(CupertinoIcons.chat_bubble_2,color: theme.hiveColorsExtensions.onBackground.withOpacity(0.5),),
                                        Text(
                                          '${hiveBlogData[index].children ?? 0}',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
