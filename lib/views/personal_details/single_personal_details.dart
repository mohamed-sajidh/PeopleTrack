import 'package:flutter/material.dart';
import 'package:peopletrack/app/themes/app_colors.dart';
import 'package:peopletrack/viewmodels/personal_details_viewmodel.dart';
import 'package:peopletrack/views/widgets/personal_status_icon.dart';
import 'package:provider/provider.dart';

class SinglePersonalDetails extends StatelessWidget {
  final int index;
  const SinglePersonalDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final personalDetailsProvider =
        Provider.of<PersonalDetailsViewmodel>(context);
    var personalDetails = personalDetailsProvider.persoanalDetailsList[index];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 10,
          right: 14,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
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
                    child: Icon(
                      Icons.people,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${personalDetails.firstName} ${personalDetails.lastName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          PersonalStatusIcon(status: personalDetails.status)
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.call,
                                color: AppColors.black,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                personalDetails.contactNumber,
                                style: const TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                                color: AppColors.black,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                (personalDetails.roleDetails != null &&
                                        personalDetails.roleDetails!.isNotEmpty)
                                    ? personalDetails.roleDetails![0].role
                                    : 'No role',
                                style: const TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 1),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    "${personalDetails.address}, ${personalDetails.postcode}, ${personalDetails.state}, ${personalDetails.country}",
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
