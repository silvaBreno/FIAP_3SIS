import 'package:github/models/repository.dart';

class GitHub {
  final int? totalCount;
  final Repositories? items;

  GitHub({
    this.totalCount,
    this.items,
  });
}
