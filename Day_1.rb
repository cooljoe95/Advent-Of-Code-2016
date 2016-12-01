#!/bin/ruby

moves = gets.chomp.split(", ")
dir = [0, 1]
pos = [0, 0]

def negate(new)
    new[0] = -new[0]
    new[1] = -new[1]
end

def switchLeft(dir)
    negate(dir) if dir[0] == 0
    dir = [dir[1], dir[0]]
end

def switchRight(dir)
    negate(dir) if dir[1] == 0
    dir = [dir[1], dir[0]] 
end

def move!(dir, pos, num, seen)
    num.to_i.times do
        pos[0] += dir[0]
        pos[1] += dir[1]
        return true if seen[pos]
        seen[pos] = true
    end
    false
end

def distance(pos)
    pos[0] = -pos[0] if pos[0] < 0
    pos[1] = -pos[1] if pos[1] < 0
    puts pos.inject(:+)
end

seen = {}
seen[[0, 0]] = true

moves.each do |move|
    dir = switchLeft(dir) if move[0] == 'L'
    dir = switchRight(dir) if move[0] == 'R'
    break if move!(dir, pos, move[1..-1], seen)
end

puts distance(pos)
