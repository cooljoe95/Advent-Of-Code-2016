require 'digest'

start = 'uqwqemis'
count = 4000000
final = Array.new(8)
until final.select{|el| el == nil} == []
    hash = Digest::MD5.hexdigest((start + count.to_s))
    if hash[0...5] == '00000'
			if hash[5] == '0' || hash[5].to_i != 0
				final[hash[5].to_i] = hash[6] unless final[hash[5].to_i]
			end
		end
		count += 1
end
print final
