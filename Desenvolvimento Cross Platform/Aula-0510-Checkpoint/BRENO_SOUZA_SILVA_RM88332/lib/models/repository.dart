import 'package:githubrepo/models/owner.dart';

class Repository {
  final int? id;
  final String? name;
  final Owner? owner;
  final String? htmlUrl;
  final String? description;
  final String? url;

  Repository({
    this.id,
    this.name,
    this.owner,
    this.htmlUrl,
    this.description,
    this.url,
  });
}

typedef Repositories = List<Repository>;
