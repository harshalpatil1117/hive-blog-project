class HiveBlogResponse {
  final int? id;
  final String? jsonrpc;
  final List<HiveBlogData>? result;

  const HiveBlogResponse({this.id, this.jsonrpc, this.result});

  factory HiveBlogResponse.fromJson(Map<String, dynamic> json) {
    return HiveBlogResponse(
      id: json['id'],
      jsonrpc: json['jsonrpc'],
      result: (json['result'] as List?)?.map((v) => HiveBlogData.fromJson(v)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'jsonrpc': jsonrpc,
    if (result != null) 'result': result!.map((v) => v.toJson()).toList(),
  };
}


class HiveBlogData {
  List<ActiveVotes>? activeVotes;
  String? author;
  String? authorPayoutValue;
  double? authorReputation;
  List<Beneficiaries>? beneficiaries;
  String? body;
  String? category;
  int? children;
  String? created;
  String? curatorPayoutValue;
  int? depth;
  bool? isPaidout;
  JsonMetadata? jsonMetadata;
  String? maxAcceptedPayout;
  int? netRshares;
  double? payout;
  String? payoutAt;
  String? pendingPayoutValue;
  int? percentHbd;
  String? permlink;
  int? postId;
  String? promoted;
  int? reblogs;
  List<dynamic>? replies; // Changed to dynamic list for flexibility
  Stats? stats;
  String? title;
  String? updated;
  String? url;
  String? authorRole;
  String? authorTitle;
  String? community;
  String? communityTitle;

  HiveBlogData({
    this.activeVotes,
    this.author,
    this.authorPayoutValue,
    this.authorReputation,
    this.beneficiaries,
    this.body,
    this.category,
    this.children,
    this.created,
    this.curatorPayoutValue,
    this.depth,
    this.isPaidout,
    this.jsonMetadata,
    this.maxAcceptedPayout,
    this.netRshares,
    this.payout,
    this.payoutAt,
    this.pendingPayoutValue,
    this.percentHbd,
    this.permlink,
    this.postId,
    this.promoted,
    this.reblogs,
    this.replies,
    this.stats,
    this.title,
    this.updated,
    this.url,
    this.authorRole,
    this.authorTitle,
    this.community,
    this.communityTitle,
  });

  HiveBlogData.fromJson(Map<String, dynamic> json) {
    activeVotes = (json['active_votes'] as List?)?.map((v) => ActiveVotes.fromJson(v)).toList();
    author = json['author'];
    authorPayoutValue = json['author_payout_value'];
    authorReputation = json['author_reputation']?.toDouble();
    beneficiaries = (json['beneficiaries'] as List?)?.map((v) => Beneficiaries.fromJson(v)).toList();
    body = json['body'];
    category = json['category'];
    children = json['children'];
    created = json['created'];
    curatorPayoutValue = json['curator_payout_value'];
    depth = json['depth'];
    isPaidout = json['is_paidout'];
    jsonMetadata = json['json_metadata'] != null ? JsonMetadata.fromJson(json['json_metadata']) : null;
    maxAcceptedPayout = json['max_accepted_payout'];
    netRshares = json['net_rshares'];
    payout = json['payout']?.toDouble();
    payoutAt = json['payout_at'];
    pendingPayoutValue = json['pending_payout_value'];
    percentHbd = json['percent_hbd'];
    permlink = json['permlink'];
    postId = json['post_id'];
    promoted = json['promoted'];
    reblogs = json['reblogs'];
    replies = json['replies']; // Kept flexible
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    title = json['title'];
    updated = json['updated'];
    url = json['url'];
    authorRole = json['author_role'];
    authorTitle = json['author_title'];
    community = json['community'];
    communityTitle = json['community_title'];
  }

  Map<String, dynamic> toJson() => {
    if (activeVotes != null) 'active_votes': activeVotes!.map((v) => v.toJson()).toList(),
    'author': author,
    'author_payout_value': authorPayoutValue,
    'author_reputation': authorReputation,
    if (beneficiaries != null) 'beneficiaries': beneficiaries!.map((v) => v.toJson()).toList(),
    'body': body,
    'category': category,
    'children': children,
    'created': created,
    'curator_payout_value': curatorPayoutValue,
    'depth': depth,
    'is_paidout': isPaidout,
    if (jsonMetadata != null) 'json_metadata': jsonMetadata!.toJson(),
    'max_accepted_payout': maxAcceptedPayout,
    'net_rshares': netRshares,
    'payout': payout,
    'payout_at': payoutAt,
    'pending_payout_value': pendingPayoutValue,
    'percent_hbd': percentHbd,
    'permlink': permlink,
    'post_id': postId,
    'promoted': promoted,
    'reblogs': reblogs,
    'replies': replies,
    if (stats != null) 'stats': stats!.toJson(),
    'title': title,
    'updated': updated,
    'url': url,
    'author_role': authorRole,
    'author_title': authorTitle,
    'community': community,
    'community_title': communityTitle,
  };
}
class ActiveVotes{
  String? voter;
  int? weight;
  double? percent;
  int? rshares;
  String? time;

  ActiveVotes({
    this.voter,
    this.weight,
    this.percent,
    this.rshares,
    this.time,
  });

  factory ActiveVotes.fromJson(Map<String, dynamic> json) {
    return ActiveVotes(
      voter: json['voter'],
      weight: json['weight'],
      percent: json['percent']?.toDouble(),
      rshares: json['rshares'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'voter': voter,
      'weight': weight,
      'percent': percent,
      'rshares': rshares,
      'time': time,
    };
  }
}


class Beneficiaries {
  String? account;
  int? weight;

  Beneficiaries({
    this.account,
    this.weight,
  });

  // Factory constructor to create an instance from JSON
  factory Beneficiaries.fromJson(Map<String, dynamic> json) {
    return Beneficiaries(
      account: json['account'],
      weight: json['weight'],
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'weight': weight,
    };
  }
}

class JsonMetadata {
  String? app;
  String? format;
  List<String>? image;
  List<String>? links;
  List<String>? tags;
  List<String>? users;

  JsonMetadata({
    this.app,
    this.format,
    this.image,
    this.links,
    this.tags,
    this.users,
  });

  factory JsonMetadata.fromJson(Map<String, dynamic> json) {
    return JsonMetadata(
      app: json['app'],
      format: json['format'],
      image: (json['image'] as List<dynamic>?)?.map((item) => item as String).toList(),
      links: (json['links'] as List<dynamic>?)?.map((item) => item as String).toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((tag) => tag as String).toList(),
      users: (json['users'] as List<dynamic>?)?.map((user) => user as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'app': app,
      'format': format,
      'image': image,
      'links': links,
      'tags': tags,
      'users': users,
    };
  }
}


class Stats {
  double? flagWeight;
  bool? gray;
  bool? hide;
  int? totalVotes;

  Stats({
    this.flagWeight,
    this.gray,
    this.hide,
    this.totalVotes,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    flagWeight: json['flag_weight'],
    gray: json['gray'],
    hide: json['hide'],
    totalVotes: json['total_votes'],
  );

  Map<String, dynamic> toJson() => {
    'flag_weight': flagWeight,
    'gray': gray,
    'hide': hide,
    'total_votes': totalVotes,
  };
}

class SourceMap {
  String? format;
  String? type;
  String? url;

  SourceMap({
    this.format,
    this.type,
    this.url,
  });

  factory SourceMap.fromJson(Map<String, dynamic> json) => SourceMap(
    format: json['format'],
    type: json['type'],
    url: json['url'],
  );

  Map<String, dynamic> toJson() => {
    'format': format,
    'type': type,
    'url': url,
  };
}

class Info {
  String? author;
  double? duration;
  String? file;
  int? filesize;
  bool? firstUpload;
  String? lang;
  String? permlink;
  String? platform;
  List<SourceMap>? sourceMap;
  String? title;
  String? videoV2;

  Info({
    this.author,
    this.duration,
    this.file,
    this.filesize,
    this.firstUpload,
    this.lang,
    this.permlink,
    this.platform,
    this.sourceMap,
    this.title,
    this.videoV2,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    author: json['author'],
    duration: (json['duration'] as num?)?.toDouble(),
    file: json['file'],
    filesize: json['filesize'],
    firstUpload: json['firstUpload'],
    lang: json['lang'],
    permlink: json['permlink'],
    platform: json['platform'],
    sourceMap: (json['sourceMap'] as List<dynamic>?)
        ?.map((e) => SourceMap.fromJson(e))
        .toList(),
    title: json['title'],
    videoV2: json['video_v2'],
  );

  Map<String, dynamic> toJson() => {
    'author': author,
    'duration': duration,
    'file': file,
    'filesize': filesize,
    'firstUpload': firstUpload,
    'lang': lang,
    'permlink': permlink,
    'platform': platform,
    'sourceMap': sourceMap?.map((e) => e.toJson()).toList(),
    'title': title,
    'video_v2': videoV2,
  };
}

class Video {
  Content? content;
  Info? info;

  Video({this.content, this.info});

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    content: json['content'] != null
        ? Content.fromJson(json['content'])
        : null,
    info: json['info'] != null ? Info.fromJson(json['info']) : null,
  );

  Map<String, dynamic> toJson() => {
    'content': content?.toJson(),
    'info': info?.toJson(),
  };
}

class Content {
  String? description;
  List<String>? tags;

  Content({this.description, this.tags});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    description: json['description'],
    tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
  );

  Map<String, dynamic> toJson() => {
    'description': description,
    'tags': tags,
  };
}

