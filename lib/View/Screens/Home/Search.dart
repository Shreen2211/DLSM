import 'package:dlsm/View/Component/Constant/Navigation.dart';
import 'package:dlsm/View/Component/Input/InputCustom.dart';
import 'package:dlsm/ViewModel/Bloc/Post/post_cubit.dart';
import 'package:dlsm/ViewModel/Utils/colorCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Component/Background/AppBar.dart';
import '../Profile/Profile.dart';

class ShippingCompanyScreen extends StatelessWidget {
  const ShippingCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = PostCubit.get(context);
        return ConstantTopic(
          newScreen: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                InputCustom(
                  keyboardType: TextInputType.name,
                  inputName: 'Search',
                  onPressed: () {
                    cubit.loading();
                    cubit.search();
                  },
                  controller: cubit.searchController,
                  iconSuffix: const Icon(
                    Icons.search,
                    color: ColorCustom.red,
                  ),
                ),
                cubit.isLoading
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: cubit.searchResults.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorCustom.red, // Border color
                                      width: 1.2, // Border width
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8.0), // Border radius
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    title: Text(
                                      cubit.searchResults[index].name ??
                                          'Name Not Available',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    subtitle: Text(
                                      cubit.searchResults[index].email ??
                                          'Email Not Available',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey[600],
                                    ),
                                    onTap: () {
                                      Navigation.push(
                                          context,
                                          UserProfile(
                                              dataUser:
                                                  cubit.searchResults[index]));
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15,),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
