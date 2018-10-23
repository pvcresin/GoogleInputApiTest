import java.net.URLEncoder;

//- https://www.google.co.jp/ime/cgiapi.html

//1. ひらがなで入力するよ。
//1. `,`（半角カンマ）が入ると文節を指定できるよ。

String encoded = "";

try {
  encoded = URLEncoder.encode("ぐーぐるのへんかん", "UTF-8");
}  
catch(Exception e) {
  e.printStackTrace();
}

String url = "http://www.google.com/transliterate?langpair=ja-Hira|ja&text=";
JSONArray sections = loadJSONArray(url + encoded);

for (int i = 0; i < sections.size(); i++) {
  JSONArray section = sections.getJSONArray(i);

  String text = section.getString(0);
  println(text);

  String[] candidates = section.getJSONArray(1).getStringArray();

  for (String candidate : candidates) {
    println("  " + candidate);
  }
}