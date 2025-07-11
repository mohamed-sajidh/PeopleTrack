import 'package:flutter/material.dart';
import 'package:peopletrack/app/themes/app_colors.dart';
import 'package:peopletrack/views/widgets/personal_status_icon.dart';

class SinglePersonalDetails extends StatelessWidget {
  const SinglePersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Esther Anil",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          PersonalStatusIcon()
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                color: AppColors.black,
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "09299292747",
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: AppColors.black,
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "colony owner",
                                style: TextStyle(
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
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    "Melay street, Puthucode, Palakkad, Kerala, India",
                    style: TextStyle(
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
