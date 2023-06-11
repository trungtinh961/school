// ignore_for_file: constant_identifier_names

import 'package:smart_school/view/menu/model/subject_model.dart';

class ApplicationConstants {
  static const COMPANY_NAME = 'HWA';

  // production'da olmadığımız sürece çalışmasını istemediğimiz fonksiyonlar için kullanacağız
  static const TEST_MODE = true;

  static const LANG_ASSET_PATH = 'asset/lang';
  static const IPAD_NAME = 'IPAD';
  static const FONT_FAMILY = 'POPPINS';

  static const EMAIL_REGIEX = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$';

  static const APP_WEB_SITE =
      'https://github.com/VB10/flutter-architecture-template';

  static const PROVINCE_COLLECTION = 'provinces';
  static const SCHOOL_COLLECTION = 'schools';
  static var DEFAULT_SUBJECT = [
    SubjectModel(id: 1, name: 'Anh văn', type: MenuType.subject),
    SubjectModel(id: 2, name: 'Âm nhạc', type: MenuType.subject),
    SubjectModel(id: 3, name: 'Công nghệ', type: MenuType.subject),
    SubjectModel(id: 4, name: 'Địa lí', type: MenuType.subject),
    SubjectModel(id: 5, name: 'GDCD', type: MenuType.subject),
    SubjectModel(id: 6, name: 'Hoá học', type: MenuType.subject),
    SubjectModel(id: 7, name: 'Lịch sử', type: MenuType.subject),
    SubjectModel(id: 8, name: 'Ngữ văn', type: MenuType.subject),
    SubjectModel(id: 9, name: 'Sinh học', type: MenuType.subject),
    SubjectModel(id: 10, name: 'Tin học', type: MenuType.subject),
    SubjectModel(id: 11, name: 'Toán', type: MenuType.subject),
    SubjectModel(id: 12, name: 'Vật lí', type: MenuType.subject),
    SubjectModel(id: 13, name: 'Chăm sóc sức khoẻ', type: MenuType.feedback),
    SubjectModel(id: 14, name: 'Góp ý xây dựng', type: MenuType.feedback),
    SubjectModel(id: 15, name: 'Phong trào', type: MenuType.feedback),
    SubjectModel(id: 16, name: 'Tư vấn tâm lí', type: MenuType.feedback),
  ];
}
