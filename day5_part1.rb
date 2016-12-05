start = 'uqwqemis'
count = 14821988
final = ""
while final.length != 2
    hash = Digest::MD5.hexdigest((start + count.to_s))
    final << hash[5] if hash[0...5] == '00000'
    puts count if hash[0...5] == '00000'
    count += 1
end
puts final
