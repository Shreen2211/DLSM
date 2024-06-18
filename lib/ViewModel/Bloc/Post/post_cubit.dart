import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/Posts/PostModel.dart';
import '../../../Model/User/UserData.dart';
import '../../../View/Component/ShowToast/ShowToast.dart';
import '../../Data/Network/DioHelper.dart';
import '../../Data/Network/EndPoint.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  static PostCubit get(context) => BlocProvider.of<PostCubit>(context);
  TextEditingController? postController = TextEditingController();
  TextEditingController? searchController = TextEditingController();
  PostModel post = PostModel();
  List<PostModel> allPost = [];
  List<PostModel> myPost = [];
  User dataShipping = User();
  List<User> searchResults = [];

  Future<void> newPost({int? idShipping}) async {
    emit(LoadingPostState());
    DioHelper.post(
      endPoint: EndPoint.posts,
      data: {
        'data': postController?.text,
        'shipping_companies_id': idShipping,
      },
    ).then((value) {
      ShowToast(msg: '${value?.data['message']}').show();
      if (value?.data['status'] == true) {
        clear();
        getPosts(id: idShipping);
        emit(SuccessPostState());
      }
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorPostState());
      throw error;
    });
  }

  Future<void> updatePost({int? idShipping,int? idPost}) async {
    emit(LoadingPostState());
    DioHelper.post(
      endPoint: '${EndPoint.editPost}/$idPost',
      data: {
        'data': postController?.text,
        'shipping_companies_id': idShipping,
      },
    ).then((value) {
      ShowToast(msg: '${value?.data['message']}').show();
      if (value?.data['status'] == true) {
        clear();
        getPosts(id: idShipping);
        emit(SuccessPostState());
      }
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorPostState());
      throw error;
    });
  }

  bool isLoading = false;

  void loading() {
    isLoading != isLoading;
    emit(LoadingState());
  }

  Future<void> getPosts({int? id}) async {
    emit(LoadingDataState());
    DioHelper.get(
      endPoint: EndPoint.allPosts,
    ).then((value) {
      allPost.clear();
      myPost.clear();
      for (var item in value?.data) {
        post = PostModel.fromJson(item);
        allPost.add(post);
        if (post.shippingCompaniesId == id) {
          myPost.add(post);
        }
      }
      emit(SuccessDataState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorDataState());
      throw error;
    });
  }

  Future<void> deletePost({int? id}) async {
    emit(LoadingDeleteState());
    DioHelper.get(
      endPoint: '${EndPoint.deletePost}/$id',
    ).then((value) {
      ShowToast(msg: '${value?.data['message']}').show();
      emit(SuccessDeleteState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorDeleteState());
      throw error;
    });
  }

  Future<void> search() async {
    emit(LoadingPostState());
    DioHelper.post(
      endPoint: EndPoint.searchShipping,
      data: {
        'name': searchController?.text,
      },
    ).then((value) {
      for (var item in value?.data) {
        dataShipping =
            User.fromJson(jsonData: item, typeUser: 'Shipping Company');
        searchResults.add(dataShipping);
      }
      clear();
      emit(SuccessPostState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorPostState());
      throw error;
    });
  }

  void clear() {
    postController!.clear();
    searchController!.clear();
    emit(ClearPostState());
  }
}