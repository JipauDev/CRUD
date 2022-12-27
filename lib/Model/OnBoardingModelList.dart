import 'package:nb_utils/nb_utils.dart';

class AWalkThroughModel {
  String? heading;
  String? title;
  String? subtitle;
  String? image;
  double? progress;

  AWalkThroughModel({
    this.heading,
    this.title,
    this.subtitle,
    this.image,
    this.progress,
  });
}

final List<AWalkThroughModel> modal = [
  AWalkThroughModel(
    heading: '',
    title: 'Pengenalan Aplikasi',
    subtitle: 'Ini adalah screen untuk pengenanalan aplikasi CRUD',
    image:
        'https://images.pexels.com/photos/5082581/pexels-photo-5082581.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    progress: 0.33,
  ),
  AWalkThroughModel(
    heading: '',
    title: 'CRUD API',
    subtitle:
        'Aplikasi ini dapat membuat fungsi Create, Read, Update and Delete',
    image:
        'https://images.pexels.com/photos/546819/pexels-photo-546819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    progress: 0.66,
  ),
  AWalkThroughModel(
    heading: '',
    title: 'Ada Beberapa Features',
    subtitle:
        'Aplikasi ini memiliki beberapa features seperti mengganti beberapa bahasa',
    image:
        'https://images.pexels.com/photos/5926370/pexels-photo-5926370.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    progress: 1,
  ),
];
