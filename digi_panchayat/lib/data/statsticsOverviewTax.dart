class statisticsOverview {
  final String attribute;
  final String data;

  statisticsOverview({required this.attribute, required this.data});

  factory statisticsOverview.fromJson(Map<String, dynamic> json) {
    return statisticsOverview(
      attribute: json['attribute'],
      data: json['data'],
    );
  }
}

List<statisticsOverview> statisticsDataTax = [
  statisticsOverview(attribute: "total number of tax payers", data: "1000"),
  statisticsOverview(attribute: "Water tax pending cases", data: "20"),
  statisticsOverview(attribute: "Property tax pending cases", data: "16"),
  statisticsOverview(
      attribute: "both water and property tax pending cases", data: "12"),
  statisticsOverview(attribute: "data unavailable cases", data: "4"),
];
