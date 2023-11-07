import 'package:articles_app/models/article_data.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:intl/intl.dart';

class ArticlesProvider {
  final faker = Faker.instance;
  final DateFormat formatter = DateFormat('dd-MM-yyyy'); //format date

  ArticlesProvider() {
    faker.setLocale(FakerLocaleType.ru);
  }

  List<ArticleData> getArticles() {
    return List.generate(
      10,
          (index) => ArticleData(
        id: index,
        title: faker.lorem.sentence(),
        date: formatter
            .format(faker.date.between(DateTime(2000), DateTime.now()))
            .toString(),
        text: faker.lorem.paragraph(sentenceCount: 50),
      ),
    );
  }
}
