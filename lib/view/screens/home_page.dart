import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_flutter/viewmodel/authentication_provider.dart';

import '../../model/news_article_model.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/constants.dart';
import '../../shared/helper/utility.dart';
import '../../viewmodel/home_provider.dart';
import '../widgets/custom_confirm_dialogue.dart';
import '../widgets/custom_text_types.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          centerTitle: false,
          title: const TextBoldW700(
            text: Constants.myNewsText,
            textColor: Colors.white,
            fontSize: 14,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: kWhiteColor,
                      size: 20,
                    ),
                    onPressed: () {
                      showConfirmationDialog(
                        context: context,
                        title: Constants.confirmLogoutText,
                        content: Constants.logoutMessageText,
                        onConfirm: () {
                          Provider.of<AuthenticationProvider>(context,
                                  listen: false)
                              .logout();
                        },
                        cancelText: Constants.noText,
                        confirmText: Constants.yesText,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: kPrimaryColor, // App bar background color
          elevation: 0, // No shadow
        ),
        backgroundColor: kBackgroundColor,
        body: FutureBuilder<NewsArticleModel>(
          future: homeProvider.fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.numResults == 0) {
              return const Center(child: Text('No news found.'));
            }

            final newsList = snapshot.data!;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const TextBoldW700(
                    text: Constants.topHeadLineText,
                    fontSize: 14,
                    textColor: kBlackColor,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: newsList.results?.length ?? 0,
                      itemBuilder: (context, index) {
                        final news = newsList.results?[index];
                        return
                            // MyCardWidget();
                            Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            BreakingNewsTile(news: news),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

class BreakingNews {
  final String source;
  final String headline;
  final String time;

  BreakingNews(
      {required this.source, required this.headline, required this.time});
}

class BreakingNewsTile extends StatelessWidget {
  final Result? news;

  const BreakingNewsTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the Container
        borderRadius:
            BorderRadius.circular(10), // Rounded corners with radius 10
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    news?.title ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  news?.resultAbstract ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10), // Add some spacing between text and image
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: news?.multimedia?[0].url != null ? news!.multimedia![0].url! : "",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
        ],
      ),
    );
  }
}
