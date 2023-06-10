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
    SubjectModel(name: 'Sinh học', type: MenuType.subject),
    SubjectModel(name: 'Hoá học', type: MenuType.subject),
    SubjectModel(name: 'GDCD', type: MenuType.subject),
    SubjectModel(name: 'Anh văn', type: MenuType.subject),
    SubjectModel(name: 'Địa lí', type: MenuType.subject),
    SubjectModel(name: 'Lịch sử', type: MenuType.subject),
    SubjectModel(name: 'Tin học', type: MenuType.subject),
    SubjectModel(name: 'Ngữ văn', type: MenuType.subject),
    SubjectModel(name: 'Toán', type: MenuType.subject),
    SubjectModel(name: 'Âm nhạc', type: MenuType.subject),
    SubjectModel(name: 'Vật lí', type: MenuType.subject),
    SubjectModel(name: 'Công nghệ', type: MenuType.subject),
    SubjectModel(name: 'Chăm sóc sức khoẻ', type: MenuType.feedback),
    SubjectModel(name: 'Góp ý xây dựng', type: MenuType.feedback),
    SubjectModel(name: 'Tư vấn tâm lí', type: MenuType.feedback),
    SubjectModel(name: 'Phong trào', type: MenuType.feedback),
  ];
}
