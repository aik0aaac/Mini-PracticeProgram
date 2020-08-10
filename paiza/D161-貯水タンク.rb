=begin
  - 実施日: 2020/08/10
  - 結果URL: https://paiza.jp/challenges/share/pt3KiBmnGbEiXDun_nmGTwmGzhEvKpY6HiTO3dI5m2E?source=social
=end

input = $stdin.readlines

maxSize = input[0].to_i
size = 0

# 入力値1行毎に次を判定:
startCount = 1
for i in startCount..(input.length-1) do
    if (size >= maxSize) 
        size = maxSize
    else
        size += input[i].to_i
    end
end

puts size