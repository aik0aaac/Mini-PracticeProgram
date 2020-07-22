=begin
  - 実施日: 2020/07/22
  - 結果URL: https://paiza.jp/challenges/share/bBHGBYXDdFk4rlk96hUObrlr4ZT0C_nodaG4jsYXMRg?campaign=95&source=social
=end

require "date"

# 指定したDateTime変数に指定した時間数を足す関数
def addHour(target, hour)
    return target + Rational(hour, 24)
end

# 指定したDateTime変数に指定した時間数を引く関数
def minusHour(target, hour)
    return target - Rational(hour, 24)
end

# 指定したDateTime変数に指定した分数を足す関数
def addMinute(target, minute)
    return target + Rational(minute, 24 * 60) 
end

# 指定したDateTime変数に指定した分数を引く関数
def minusMinute(target, minute)
    return target - Rational(minute, 24 * 60) 
end

################################################

input = $stdin.readlines

=begin
  入力値のフォーマットについて: 
  a b c　　#配座駅へまで時間 a 分, 配座駅から儀野駅の乗車時間 b 分, 儀野駅から会社までの時間 c 分
  N　　　　#配座駅から出る電車の本数を表す整数 N
  h_1 m_1　#1本目の電車の発車時刻 h_1 時 m_1 分
  h_2 m_2　#2本目の電車の発車時刻 h_2 時 m_2 分
  ...
  h_N m_N　#N本目の電車の発車時刻 h_N 時 m_N 分
=end

inputFirstLine = input[0].split(' ')
toStation = inputFirstLine[0].to_i
boadingTime = inputFirstLine[1].to_i
toOffice = inputFirstLine[2].to_i

trainNum = input[1].to_i

limitDateTime = DateTime.new(2020, 1, 1, 8, 59, 00, 0);

resultDateTime = DateTime.new(2020, 1, 1, 6, 00, 00, 0);

# 入力値1行毎に次を判定:
trainStartCount = 2
for i in trainStartCount..(trainStartCount+trainNum-1) do
    # 電車の発車時刻毎に出社時刻を算出
    departureTime = DateTime.new(2020, 1, 1, input[i].split(' ')[0].to_i, input[i].split(' ')[1].to_i, 00, 0);
    reachStationTime = addMinute(departureTime, boadingTime)
    reachOfficeTime = addMinute(reachStationTime, toOffice)
    # 「駅への到着時刻 + 会社までの徒歩時間」が出社時刻期限を過ぎてれば処理を次に回す
    if reachOfficeTime > limitDateTime
        next
    end
    
    startTime = minusMinute(departureTime, toStation)
    # もし算出した出社時刻が最も良い出社時刻候補であれば挿げ替え
    if startTime >resultDateTime
        resultDateTime = startTime
    end
end

puts resultDateTime.strftime("%H:%M")

