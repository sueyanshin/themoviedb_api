import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/providers/movie_provider.dart';
import 'package:test_app/presentation/widgets/app_container_widget.dart';
import 'package:test_app/presentation/widgets/media_card.dart';
import 'package:test_app/presentation/widgets/profile_avatar.dart';
import 'package:test_app/services/api_service.dart';

class CastDetailPage extends StatefulWidget {
  const new({super.key, required this.id});
  final int id;

  @override
  State<CastDetailPage> createState() => _CastDetailPageState();
}

class _CastDetailPageState extends State<CastDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieProvider>().fetchCastDetail(widget.id);
      context.read<MovieProvider>().updateExpanded(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cast Details')),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.isCastDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.castDetailErrorMessage.isNotEmpty) {
            return Center(child: Text(provider.castDetailErrorMessage));
          }
          final castDetail = provider.castDetail;
          return ListView(
            padding: .symmetric(horizontal: 16),
            children: [
              Align(
                alignment: .center,
                child: Column(
                  children: [
                    ProfileAvatar(
                      imageUrl:
                          "${ApiService.imgBaseUrl}${castDetail.profilePath}",
                    ),
                    const SizedBox(height: 10),
                    Text(
                      castDetail.name.toString(),
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: .w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Personal Info card
              Text(
                "Personal Info",
                style: theme.textTheme.titleMedium!.copyWith(fontWeight: .w600),
              ),
              const SizedBox(height: 10),
              AppContainerWidget(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    if (castDetail.knownForDepartment != null)
                      PersonalInfoLabel(
                        title: "Known for:",
                        info: castDetail.knownForDepartment.toString(),
                      ),
                    if (castDetail.birthday != null &&
                        castDetail.birthday?.isNotEmpty == true)
                      PersonalInfoLabel(
                        title: "Birthday:",
                        info: castDetail.birthday.toString(),
                      ),
                    if (castDetail.gender != null)
                      PersonalInfoLabel(
                        title: "Gender:",
                        info: castDetail.gender == 2 ? "Male" : "Female",
                      ),
                    if (castDetail.placeOfBirth != null &&
                        castDetail.placeOfBirth?.isNotEmpty == true)
                      PersonalInfoLabel(
                        title: "Place of Birth:",
                        info: castDetail.placeOfBirth.toString(),
                      ),
                    if (castDetail.alsoKnownAs != null &&
                        castDetail.alsoKnownAs?.isNotEmpty == true)
                      PersonalInfoLabel(
                        title: "Also Known As:",
                        info: castDetail.alsoKnownAs!.first,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              if (castDetail.biography != null &&
                  castDetail.biography!.isNotEmpty) ...[
                Text(
                  "Biography",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: .w600,
                  ),
                ),
                const SizedBox(height: 10),
                AppContainerWidget(
                  child: ExpandableText(text: castDetail.biography.toString()),
                ),
              ],
              const SizedBox(height: 20),

              Text(
                "Known for",
                style: theme.textTheme.titleMedium!.copyWith(fontWeight: .w600),
              ),
              const SizedBox(height: 10),

              if (castDetail.castMediaCredits != null &&
                  castDetail.castMediaCredits?.isNotEmpty == true)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: .horizontal,
                    itemCount: castDetail.castMediaCredits!.length,
                    itemBuilder: (context, index) {
                      final credit =
                          provider.castDetail.castMediaCredits![index];
                      return MediaCard(credit: credit);
                    },
                  ),
                ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

class ExpandableText extends StatelessWidget {
  const new({super.key, required this.text, this.trimLines = 5});

  final String text;
  final int trimLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTextExpanded = context.read<MovieProvider>().isTextExpanded;
    return Column(
      crossAxisAlignment: .end,
      children: [
        Text(
          text,
          maxLines: isTextExpanded ? null : trimLines,
          overflow: isTextExpanded ? .visible : .ellipsis,
          style: theme.textTheme.bodyMedium!.copyWith(fontWeight: .w400),
        ),
        GestureDetector(
          onTap: () {
            context.read<MovieProvider>().updateExpanded(!isTextExpanded);
          },
          child: Text(isTextExpanded ? "See less" : "See more..."),
        ),
      ],
    );
  }
}

class PersonalInfoLabel extends StatelessWidget {
  const new({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyMedium!.copyWith(fontWeight: .w600),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            info,
            style: theme.textTheme.bodyMedium!.copyWith(fontWeight: .w400),
          ),
        ),
      ],
    );
  }
}
