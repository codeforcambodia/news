class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final String parts;
  final int descendants;
  
  ItemModel.fromJson(Map<String, dynamic> parsed)
    : id =parsed['id'],
      deleted =parsed['deleted'],
      type = parsed['type'],
      by =parsed['by'],
      time =parsed['time'],
      text =parsed['text'],
      dead = parsed['dead'],
      parent = parsed['parent'],
      kids = parsed['kids'],
      url =parsed['url'],
      score =parsed['score'],
      title = parsed['title'],
      parts = parsed['parts'],
      descendants =parsed['descendants'];
      
}