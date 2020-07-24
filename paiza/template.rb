=begin
  - 実施日: 2020/07/24
  - 結果URL: 
=end

input = $stdin.readlines

inputFirstLine = input[0].split(' ')
toStation = inputFirstLine[0].to_i
boadingTime = inputFirstLine[1].to_i

# 入力値1行毎に次を判定:
startCount = 2
for i in startCount..(startCount+trainNum-1) do
  p input[i]
end

puts input