/*****
  課題URL: http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0100&lang=jp

  ### 課題内容: 
  - 売上金額のトータルが 1,000,000 円以上の社員の社員番号を出力
  - 社員が複数いる場合は、社員のデータが入力された順番に社員番号を順番に出力
  - 該当する社員がいない場合、”NA”と出力
  - 社員番号は重複しない
  - 社員<4000人(1~4000)、販売単価<=1,000,000円、売上数量<=100,000個
  
  #### 入力
  - n = データの個数(n<=1000)
    - n=0→入力の終わり
  - ei = 社員番号(1 ≤ ei ≤ 4,000)
  - pi = 販売単価(0 ≤ pi ≤ 1,000,000)
  - qi = 売上数量(0 ≤ qi ≤ 100,000)

  ```
  n
  e1 p1 q1
  ...
  en pn qn
  ```

  ```
  例: 
  4
  1001 2000 520
  1002 1800 450
  0
  ```
*****/

// 複数行の標準入力を取得する

process.stdin.resume();
process.stdin.setEncoding('utf8');

var lines = [];
var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.on('line', (line) => {
  // ここで入力を処理する
  lines.push(line);
});
reader.on('close', () => {
  // ここで出力する
  for (var i = 0; i < lines.length; i++) {
    console.log(lines[i]);
  }
});
