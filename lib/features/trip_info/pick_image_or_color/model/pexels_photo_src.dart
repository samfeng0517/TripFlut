///An assortment of different image sizes that can be used to display this Pexels photo.
class PexelsPhotoSrc {
  ///The image without any size changes.
  String? original;

  ///The image resized to `W 940px X H 650px` `DPR 2`.
  String? large2x;

  ///The image resized to `W 940px X H 650px` `DPR 1`.
  String? large;

  ///The image scaled proportionally so that it's new height is `350px`.
  String? medium;

  ///The image scaled proportionally so that it's new height is `130px`.
  String? small;

  ///The image cropped to `W 800px X H 1200px`.
  String? portrait;

  ///The image cropped to `W 1200px X H 627px`.
  String? landscape;

  ///The image cropped to `W 280px X H 200px`.
  String? tiny;

  PexelsPhotoSrc(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  PexelsPhotoSrc.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    large2x = json['large2x'];
    large = json['large'];
    medium = json['medium'];
    small = json['small'];
    portrait = json['portrait'];
    landscape = json['landscape'];
    tiny = json['tiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original'] = original;
    data['large2x'] = large2x;
    data['large'] = large;
    data['medium'] = medium;
    data['small'] = small;
    data['portrait'] = portrait;
    data['landscape'] = landscape;
    data['tiny'] = tiny;
    return data;
  }
}
