=begin
  - 結果URL: https://paiza.jp/challenges/share/5PHV3w_qJy45tcUEeQ8_DTNDQmel11ZpNOVweTx2yvc?source=social
=end

input = $stdin.readlines

=begin
  入力値のフォーマットについて: 
  - input[0]: M N K- M:立候補者の人数 / N:有権者の人数 / K:演説が行われる回数
  - input[1...N]: 誰が演説したか(1 = 1番目の立候補者が演説)
=end

inputFirstLine = input[0].split(' ')
candidateNum = inputFirstLine[0].to_i
voterNum = inputFirstLine[1].to_i
speechNum = inputFirstLine[2].to_i

# 立候補者毎の支持者たちを示す配列作成
# 「誰も支持しない」支持者たちは配列の最後に入れる
supporterList = Array.new(candidateNum, 0)
supporterList.push(voterNum)

# 入力値1行毎に次を判定:
for i in 1..input.length-1 do
  # 現在の立候補者のIndexを取得
  currentCandidate = input[i].chomp.to_i-1
  # 演説をした立候補者以外の支持者たちの中で、1以上支持者がいる場合は、1を引き演説をした立候補者の支持者たちへインクリメント
  for j in 0..supporterList.length-1 do
    # 演説者の支持者たち以外に処理を実行
    if j!=currentCandidate then
      if supporterList[j] > 0
        supporterList[j] -= 1
        supporterList[currentCandidate] += 1
      end
    end
  end
end

# 最大支持者数を取得
# 配列の最後は「誰も支持しない」支持者たちの数が格納されているので除外する
maxSupporterNum = 0
for i in 0..supporterList.length-2 do
  if maxSupporterNum < supporterList[i]
    maxSupporterNum = supporterList[i]
  end
end

# 最大支持者数を持つ立候補者を出力
# 配列の最後は「誰も支持しない」支持者たちの数が格納されているので除外する
for i in 0..supporterList.length-2 do
  if maxSupporterNum == supporterList[i]
    # 立候補者は配列のインデックスではないので+1して表示
    p i+1
  end
end