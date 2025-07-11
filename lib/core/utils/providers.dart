import 'package:peopletrack/viewmodels/add_personal_details_viewmodel.dart';
import 'package:peopletrack/viewmodels/auth_viewmodel.dart';
import 'package:peopletrack/viewmodels/personal_details_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthViewmodel()),
  ChangeNotifierProvider(create: (_) => PersonalDetailsViewmodel()),
  ChangeNotifierProvider(create: (_) => AddPersonalDetailsViewmodel()),
];
