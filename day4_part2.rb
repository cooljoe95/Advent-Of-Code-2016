def decrypt(ar, id)
    ar = ar.join("")
    final = ""
    ar.chars.each do |chr|
        let = chr.ord + id
        let -= 26 if let > 'z'.ord
        final << let.chr
    end
    final
end

while(s = gets)
    chunks = s.chomp.split("-")
    id = Integer((chunks[-1])[0..(-8)])
    print decrypt(chunks[0..-2], (id % 26)), id
    puts
end
