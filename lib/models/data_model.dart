class HomeResponse {
  int? page;
  int? per_page;
  int? total;
  int? total_pages;
  List<HomeDataResponse>? data;

  HomeResponse(
      {this.page, this.per_page, this.total, this.total_pages, this.data});
}

class HomeDataResponse {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantone_value;

  HomeDataResponse(
      {this.id, this.name, this.year, this.color, this.pantone_value});

  // JSON verilerinden HomeDataResponse örneği oluşturan bir fabrika metodu
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) {
    return HomeDataResponse(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      color: json['color'],
      pantone_value: json['pantone_value'],
    );
  }
}
