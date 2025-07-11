import 'package:flutter/material.dart';
import 'package:peopletrack/app/themes/app_assets.dart';
import 'package:peopletrack/app/themes/app_colors.dart';
import 'package:peopletrack/viewmodels/add_personal_details_viewmodel.dart';
import 'package:peopletrack/views/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class AddPersonalDetails extends StatefulWidget {
  const AddPersonalDetails({super.key});

  @override
  State<AddPersonalDetails> createState() => _AddPersonalDetailsState();
}

class _AddPersonalDetailsState extends State<AddPersonalDetails> {
  late TextEditingController nameTextcontroller;
  late TextEditingController addressTextcontroller;
  late TextEditingController suburbTextcontroller;
  late TextEditingController stateTextcontroller;
  late TextEditingController postCodeTextcontroller;
  late TextEditingController contactTextcontroller;
  late TextEditingController additionalNotesTextcontroller;

  @override
  void initState() {
    super.initState();
    nameTextcontroller = TextEditingController();
    addressTextcontroller = TextEditingController();
    suburbTextcontroller = TextEditingController();
    stateTextcontroller = TextEditingController();
    postCodeTextcontroller = TextEditingController();
    contactTextcontroller = TextEditingController();
    additionalNotesTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    nameTextcontroller.dispose();
    addressTextcontroller.dispose();
    suburbTextcontroller.dispose();
    stateTextcontroller.dispose();
    postCodeTextcontroller.dispose();
    contactTextcontroller.dispose();
    additionalNotesTextcontroller.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              customTextWidget("First Name"),
              const SizedBox(height: 5),
              TextFormField(
                controller: nameTextcontroller,
                decoration: InputDecoration(
                  hintText: 'Please type',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              customTextWidget("Address"),
              const SizedBox(height: 5),
              TextFormField(
                controller: addressTextcontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  suffixIcon: const Icon(Icons.settings_applications_rounded),
                  hintText: 'Please type',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              customTextWidget("Suburb"),
              const SizedBox(height: 5),
              TextFormField(
                controller: suburbTextcontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  suffixIcon: const Icon(Icons.settings_applications_rounded),
                  hintText: 'Please type',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextWidget("State"),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: stateTextcontroller,
                          decoration: InputDecoration(
                            hintText: 'Please type',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Second Input Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextWidget("Post Code"),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: postCodeTextcontroller,
                          decoration: InputDecoration(
                            hintText: 'Please type',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              customTextWidget("Contact Number"),
              const SizedBox(height: 5),
              TextFormField(
                controller: contactTextcontroller,
                decoration: InputDecoration(
                  hintText: 'Please type',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              customTextWidget("Role"),
              const SizedBox(height: 5),
              Consumer<AddPersonalDetailsViewmodel>(
                builder: (context, provider, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: const Text("Colony Owner"),
                          value: provider.colonyOwnerValue,
                          onChanged: (_) {
                            provider.changeColonyOwnerValue();
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          title: const Text("Chem Applicator"),
                          value: provider.chemApplicatorValue,
                          onChanged: (_) {
                            provider.changeChemApplicatorValue();
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          title: const Text("Land Owner"),
                          value: provider.landOwnerValue,
                          onChanged: (_) {
                            provider.changeLandOwnerValue();
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              customTextWidget("Additional Notes"),
              const SizedBox(height: 5),
              TextFormField(
                controller: additionalNotesTextcontroller,
                maxLines: 4,
                minLines: 4,
                textAlignVertical: TextAlignVertical.center, // Vertical center
                decoration: InputDecoration(
                  hintText: 'Please type',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Consumer<AddPersonalDetailsViewmodel>(
                builder: (context, provider, child) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Status",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: provider.isStatusOn,
                            onChanged: (_) {
                              provider.changeStatus();
                            },
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
