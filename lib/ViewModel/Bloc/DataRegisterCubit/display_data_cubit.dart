import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'display_data_state.dart';

class DisplayDataCubit extends Cubit<DisplayDataState> {
  DisplayDataCubit() : super(DisplayDataInitial());

  static DisplayDataCubit get(context) =>
      BlocProvider.of<DisplayDataCubit>(context);
  XFile? importCard;
  XFile? industryCard;
  XFile? taxCard;
  XFile? photo;
  XFile? comCard;

  Future<void> takePhotoTaxCard() async {
    taxCard = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(TakePhotoTax());
  }

  Future<void> takePhotoImportCard() async {
    importCard = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(TakePhotoImport());
  }
  Future<void> takePhotoProfile() async {
    photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(TakePhotoProfile());
  }
  Future<void> takePhotoIndustryCard() async {
    industryCard = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(TakePhotoIn());
  }

  Future<void> takePhotoComCard() async {
    comCard = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(TakePhotoCom());
  }
}
