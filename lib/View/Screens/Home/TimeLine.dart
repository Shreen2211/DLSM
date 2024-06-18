import 'package:dlsm/View/Component/Button/ButtonCustom.dart';
import 'package:dlsm/View/Component/TitleAnimation/TitleAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ViewModel/Bloc/Post/post_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../Model/Posts/PostModel.dart';
import '../../../View/Component/TopScreen/TopScreenCustom.dart';
import '../../../View/Component/Background/SignBackground.dart';
import '../../../View/Component/Input/InputCustom.dart';
import '../../../View/Component/Text/TitleCustom.dart';
import '../../../View/Component/Animation/SimpleAnimation.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Component/Constant/Navigation.dart';
import '../Profile/Profile.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        // Implement listener if needed
      },
      builder: (context, state) {
        var cubit = PostCubit.get(context);
        List<PostModel> myPost = [];
        if (LocalData.get(key: SharedKey.currentUserType) == 4) {
          myPost = cubit.myPost;
        } else {
          myPost = cubit.allPost;
        }
        return SignBackground(
          backgroundPhoto: ImgCustom.imgLogin,
          newScreen: SingleChildScrollView(
            child: Column(
              children: [
                const TopScreenCustom(
                  pageTwo: 'TimeLine',
                  pageShow: 'nothing',
                  show: false,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Visibility(
                        visible:
                            LocalData.get(key: SharedKey.currentUserType) == 4,
                        child: InputCustom(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: ColorCustom.red,
                            size: 30,
                          ),
                          controller: cubit.postController,
                          keyboardType: TextInputType.name,
                          inputName: 'New Post',
                          onPressed: () async {
                            cubit.newPost(
                                idShipping: LocalData.get(
                                    key: SharedKey.currentUserID));
                          },
                          iconSuffix: const Icon(Icons.send),
                        ),
                      ),
                      const SimpleAni(
                        color2: ColorCustom.white,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              PostCubit.get(context).getPosts(
                                  id: LocalData.get(
                                      key: SharedKey.currentUserID));
                            },
                            icon: const Icon(
                              Icons.refresh,
                              size: 35,
                              color: ColorCustom.red,
                            )),
                      ),
                      if (cubit.allPost.isEmpty)
                        const Center(
                          child: TextTitle(
                            text: 'No Posts Yet',
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              elevation: 8,
                              borderOnForeground: true,
                              margin: const EdgeInsets.all(10),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigation.push(
                                                context,
                                                UserProfile(
                                                    dataUser:
                                                        myPost[index].client!));
                                          },
                                          child: Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 25,
                                                backgroundColor:
                                                    ColorCustom.red,
                                                child: Icon(
                                                  Icons.person,
                                                  color: ColorCustom.white,
                                                  size: 40,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              TextTitle(
                                                text:
                                                    myPost[index].client?.name ?? '',
                                                fontSize: 22,
                                                color: ColorCustom.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              150,
                                          child: Text(
                                            myPost[index].data ?? '',
                                            overflow: TextOverflow.visible,
                                            style: const TextStyle(
                                              color: ColorCustom.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                      ],
                                    ),
                                    Visibility(
                                      visible: LocalData.get(
                                              key: SharedKey.currentUserType) ==
                                          4,
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2.5,
                                                    child: Column(
                                                      children: [
                                                        TitleAnimation(
                                                            title:
                                                                '${myPost[index].client?.name}'),
                                                        InputCustom(
                                                            controller: cubit
                                                                .postController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            inputName:
                                                                '${myPost[index].data}'),
                                                        ButtonCustom(
                                                            text: 'Edit',
                                                            width: 120,
                                                            onPressed: () {
                                                              cubit.updatePost(
                                                                  idShipping:
                                                                      LocalData
                                                                          .get(
                                                                    key: SharedKey
                                                                        .currentUserID,
                                                                  ),
                                                                  idPost: myPost[
                                                                          index]
                                                                      .id);
                                                            }),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 27,
                                              color: ColorCustom.red,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await cubit
                                                  .deletePost(
                                                id: myPost[index].id,
                                              )
                                                  .then((value) {
                                                cubit.getPosts(
                                                  id: LocalData.get(
                                                    key:
                                                        SharedKey.currentUserID,
                                                  ),
                                                );
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete_forever,
                                              size: 30,
                                              color: ColorCustom.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: myPost.length,
                        ),
                    ],
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