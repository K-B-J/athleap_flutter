dynamic sorter(dynamic snapshot) {
  List jsons = [];
  for (dynamic i in snapshot.docs) {
    jsons.add(i.data());
  }
  jsons.sort((a, b) => a["date"].compareTo(b["date"]));
  return List.from(jsons.reversed);
}
