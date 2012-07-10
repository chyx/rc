require 'set'
filename = ARGV[0]
signature = ARGV[1]
dat = ARGV[2]

dict = {}
File.open dat do |file|
	curr_head = ''
	content = []
	while line = file.gets
		if line == nil or line[0..2] == '###'
		   next
		end
		line.rstrip!
		if line[0..1] == '//'
			dict[curr_head] = content if content.size > 0

			curr_head = line[2..-1]
			content = []
		else
			content << line
		end
	end
end

=begin
dict.each do |k, v|
	p k
	p v
end
=end

output = []
content = []
content_flat = ''
content_set = Set.new
File.open filename do |file|
	while line = file.gets
		content << line
		content_flat += line
		content_set << line.rstrip
	end
end
output = []

dict.each do |k, v|
	next if content_set.count(v[0]) != 0
	next if not (v[0].start_with? "#include" or v[0].start_with? "using")
	reg = Regexp.compile(k)
	if content_flat =~ reg
		v.each {|l| output << l}
	end
end

content.each do |line|
	output << line
	if line.rstrip == signature.strip or line.rstrip == "//>w<"
		dict.each do |k, v|
			next if content_set.count(v[0]) != 0
			next if (v[0].start_with? "#include" or v[0].start_with? "using")
			reg = Regexp.compile(Regexp.escape k)
			if content_flat =~ reg
				reg2 = Regexp.compile(Regexp.escape v[0])
				unless content_flat =~ reg2
					#puts k
					v.each {|l| output << l}
				end
			end
		end
	end
end

output.each do |l|
	puts l.rstrip
end
