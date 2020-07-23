=begin
  - 実施日: 2020/07/23
  - 結果URL: https://paiza.jp/challenges/share/biG8Y86dfKKtTGanwy2bFwqDJbWloZhfAF6_NeLjEFQ?campaign=95&source=social
=end

input = $stdin.readlines

=begin
  入力フォーマットについて
  N M
  a_1 b_1
  a_2 b_2
  ...
  a_N b_N
  ・1 行目に学生の人数を表す整数 N と合格点を表す整数 M が半角スペース区切りで与えられます。
  ・続く N 行のうち i 行目 (1 ≦ i ≦ N ) には学籍番号 i の学生のテストの点数を表す整数 a_i、欠席回数を表す整数 b_i が半角スペース区切りで与えられます。
  ・入力は合計で N + 1 行であり、入力値最終行の末尾に改行が 1 つ入ります。
=end


inputFirstLine = input[0].split(' ')
studentNum = inputFirstLine[0].to_i
passPoint = inputFirstLine[1].to_i

passStudentList = []

# 入力値1行毎に次を判定:
startCount = 1
for i in startCount..(startCount+studentNum-1) do
    # テストの点数から欠席点数*5を引いた値を判定値とする
    judge = input[i].split(' ')[0].to_i - (input[i].split(' ')[1].to_i*5)
    
    # 判定値が負の値になったら「0」扱いとする
    if judge < 0
        judge = 0
    end

    # 判定値が合格点以上であれば合格とする
    if judge >= passPoint
        passStudentList.push(i)
    end
end

for i in 0..passStudentList.length-1 do
    p passStudentList[i]
end