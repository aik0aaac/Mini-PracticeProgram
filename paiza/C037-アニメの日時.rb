=begin
  - 問題URL: https://paiza.jp/challenges/165/ready
  - 結果URL: https://paiza.jp/challenges/share/iGJFn5ySOO3qktAxlqd98ev6Ws4q2m1cCmNpyEpMCZs?source=social
=end

input = $stdin.readlines

=begin
  入力値のフォーマットについて: 
  - input[0]: a b R - 工事現場のx座標,工事現場のy座標,工事現場の騒音が届く範囲
  - input[1]: N - 木陰の数
  - input[2...N-1]: x_1 y_1 - 木陰1のx座標,木陰1のy座標
  - input[N-1]: x_N y_N - 木陰Nのx座標,木陰Nのy座標
=end

pointWorkX = input[0].split(" ")[0].to_i # a: 工事現場のx座標
pointWorkY = input[0].split(" ")[1].to_i # b: 工事現場のy座標
pointWorkNoise = input[0].split(" ")[2].to_i # R: 工事現場の騒音が届く範囲
treeShadeNum = input[1].to_i # N: 木陰の数

# 入力値は「2行目以降から木陰の座標」となるのでindexは2より開始
for i in 2..input.length-1 do
  pointTreeShadeX = input[i].split(" ")[0].to_i # 木陰iのx座標
  pointTreeShadeY = input[i].split(" ")[1].to_i # 木陰iのy座標

  # 「工事現場から木陰まで」の距離が「工事現場の騒音が届く範囲」より大きいか判定
  if ((pointTreeShadeX - pointWorkX)**2 + (pointTreeShadeY - pointWorkY)**2) >= pointWorkNoise**2 then
    puts "silent"
  else
    puts "noisy"
  end
end