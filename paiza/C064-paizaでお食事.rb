=begin
  - 実施日: 2020/07/24
  - 結果URL: https://paiza.jp/challenges/share/FAi9vVzTOtnyftIextoCYp-MJLbn6egxbPzs8cVFzP0?campaign=95&source=social
=end

input = $stdin.readlines

=begin
    入力値のフォーマットについて: 
    M N  
    c_1  
    c_2  
    ...  
    c_M
    a_{1,1} a_{1,2}  ... a_{1,M}  
    a_{2,1} a_{2,2}  ... a_{2,M}  
    ...  
    a_{N,1} a_{N,2}  ... a_{N,M}
    ・1 行目にそれぞれ料理の品数、就活生の人数を表す整数 M , N がこの順で半角スペース区切りで与えられます。
    ・続く M 行のうちの i 行目 (1 ≦ i ≦ M) には、100 g あたりのカロリーを表す整数 c_i がこの順で半角スペース区切りで与えられます。
    ・さらに続く N 行のうちの i 行目 (1 ≦ i ≦ N) には M 個の整数が半角スペース区切りで与えられます。i 行目の j 番目 (1 ≦ j ≦ M) の整数 a_{i, j} は i 番目の就活生が食べた、j 番目の料理の量を表します。
    ・入力は合計で M + N + 1 行となり、入力値最終行の末尾に改行が 1 つ入ります。
=end

input = $stdin.readlines

inputFirstLine = input[0].split(' ')
dishNum = inputFirstLine[0].to_i
studentNum = inputFirstLine[1].to_i

# 各料理のカロリー数を算出
dishCalList = []
startCount = 1
for i in startCount..(startCount+dishNum-1) do
    # dishCalListへ各料理の100gあたりのカロリー数を挿入
    dishCalList.push(input[i].to_i)
end

# 各学生の食べたカロリー量を算出
studentTakeCalList = []
startCount = dishNum+1
for i in startCount..(startCount+studentNum-1) do
    studentTakeCal = 0
    input[i].split(' ').each_with_index do |e, i|
        studentTakeCal += e.to_i*dishCalList[i]/100
    end
    studentTakeCalList.push(studentTakeCal.floor)
end

puts studentTakeCalList