def top5(ar)
    ar = ar.join("")
    chars = ar.chars
    chars.sort! do |el1, el2| 
        count = chars.count(el2) <=> chars.count(el1)
        count == 0 ? el1 <=> el2 : count
    end
    (chars.uniq[0...5]).join("")
end

count = 0
while(s = gets)
    chunks = s.chomp.split("-")
    id = Integer((chunks[-1])[0..(-8)])
    count += id if (chunks[-1])[-6..-2] == top5(chunks[0...-1])
end

print count
