names = []
Dir.foreach(".") do |x|
	if( x.length > 15 )
		xx = []
		(x[3..-1].split '.').each do |d|
			xx << d.to_i
		end
		xx << x
		xx[2], xx[3] = xx[3], xx[2]
		p xx
		names << xx
		#fork{ exec "./bin2asc #{x} #{x[0..-3]}" }
		#Process.waitall
	end
end

names.sort!

def copya(cnt, name)
	if cnt >= 10
		"cp " + name[-1] + " A#{cnt}"
	else
		"cp " + name[-1] + " A0#{cnt}"
	end
end

def copyb(cnt, name)
	if cnt >= 10
		"cp " + name[-1] + " B#{cnt}"
	else
		"cp " + name[-1] + " B0#{cnt}"
	end
end

def gen(names)
	ret = []
	cnt = 0
	names.each do |x|
		if x[-1].end_with? "A.BDS.cmrsp"
			cnt+=1
			ret << copya(cnt, x)
		end
	end

	cnt = 0
	names.each do |x|
		if x[-1].end_with? "B.BDS.cmrsp"
			cnt+=1
			ret << copyb(cnt, x)
		end
	end
	ret
end

gen(names).each do |x|
	p x
	fork{ exec x }
	Process.waitall
end
