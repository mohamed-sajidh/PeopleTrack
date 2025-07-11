import 'package:flutter/material.dart';
import 'package:peopletrack/app/themes/app_assets.dart';
import 'package:peopletrack/app/themes/app_colors.dart';
import 'package:peopletrack/routes/app_routes.dart';
import 'package:peopletrack/viewmodels/personal_details_viewmodel.dart';
import 'package:peopletrack/views/personal_details/single_personal_details.dart';
import 'package:peopletrack/views/widgets/app_loader.dart';
import 'package:peopletrack/views/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.homePageBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * 0.16,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.homeBgImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Foreground content (image and text)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profile or icon image
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.apps_sharp,
                            color: AppColors.black,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Text
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Personal Details List",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: roundedSearchBar(
                    controller: searchController,
                    hintText: 'Search...',
                    onChanged: (value) {
                      // Do something with value
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "GO",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Consumer<PersonalDetailsViewmodel>(
            builder: (context, provider, child) {
              if (provider.isLoader) {
                return const Expanded(
                  child: Center(
                    child: AppLoadingIndicator(size: 20),
                  ),
                );
              }
              if (provider.persoanalDetailsList.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: Text("No Personal Details Found"),
                  ),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10,
                  ),
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        SinglePersonalDetails(index: index),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: provider.persoanalDetailsList.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.addPersonalDetails,
          );
        },
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: AppColors.black,
          size: 30,
          weight: 700,
        ),
      ),
    );
  }
}
