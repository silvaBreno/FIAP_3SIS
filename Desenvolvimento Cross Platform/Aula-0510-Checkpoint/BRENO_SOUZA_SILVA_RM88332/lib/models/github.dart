import 'package:githubrepo/models/repository.dart';

class GitHub {
  final int? totalCount;
  final Repositories? items;

  GitHub({
    this.totalCount,
    this.items,
  });
}
