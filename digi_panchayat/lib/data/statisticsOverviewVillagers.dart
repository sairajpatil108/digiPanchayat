class statisticsOverviewVillagers {
  final String attribute;
  final String data;

  statisticsOverviewVillagers({required this.attribute, required this.data});

  factory statisticsOverviewVillagers.fromJson(Map<String, dynamic> json) {
    return statisticsOverviewVillagers(
      attribute: json['attribute'],
      data: json['data'],
    );
  }
}

List<statisticsOverviewVillagers> statisticsDataVillagers = [
  statisticsOverviewVillagers(attribute: "total population", data: "8000"),
  statisticsOverviewVillagers(attribute: "total numbae of women", data: "4020"),
  statisticsOverviewVillagers(attribute: "total number of men", data: "3080"),
  statisticsOverviewVillagers(
      attribute: "total number of voters", data: "2800"),
  statisticsOverviewVillagers(
      attribute: "total number of families", data: "2100"),
];
