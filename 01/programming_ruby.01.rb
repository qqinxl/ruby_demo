class Song 
	attr_reader :name, :artist, :duration
	attr_writer :duration
	def initialize(name, artist, duration)
		@name = mixed_case(name)
		@artist = mixed_case(artist)
		@duration = duration
		@plays = 0
	end
	
	private
	def mixed_case(name)
		name.downcase.gsub(/\b\w/) {|first| first.upcase}
	end
end

class Song
	def to_s
		"Song: #{@name} -- #{@artist}:#{@duration}"
	end 
end

song = Song.new("Pretty Girl", "s.shin", "2:45")
p song.inspect

class KaraokeSong < Song
	def initialize(name, artist, duration, lyrics)
		super(name, artist, duration)
		@lyrics = lyrics
	end
end

class KaraokeSong
	def to_s
		super + " [#{@lyrics}]"
	end 
end

class KaraokeSong 
	attr_reader :lyrics
end

karaoke = KaraokeSong.new("Pretty Girl", "s.shin", "2:45", "lalalalala");
p karaoke.inspect
p karaoke.lyrics

class Song
	@@plays = 0
	def play
		@plays +=1
		@@plays += 1
		"This song: #{@plays} plays . And total #{@@plays} plays." 
	end
end

p song.play
p song.play

song2 = Song.new("My Love", "s.shin", "1979")
p song2.play
p song2.play


class MyLogger
	private_class_method :new
	@@logger = nil
	def self.create
		@@logger = new unless @@logger
		@@logger
	end

end

p MyLogger.create

song3 = song.dup
p song
p song.play
p song3
p song3.play

song.duration = "2012"
p song
p song3

class WordIndex
	def initialize
		@index = {}
	end
	
	def add(obj, *phrases)
		phrases.each do |phrase|
			phrase.scan(/\w[-\w']+/) do |word|
				word.downcase!
				@index[word] = [] if @index[word].nil?
				@index[word].push(obj) unless @index[word].include?(obj)
			end
		end
	end
	
	def lookup(word)
		@index[word.downcase]
	end
end

class SongList
	def initialize
		@songs = Array.new
		@word_index = WordIndex.new
	end
	def add(song)
		@songs.push(song)
		@word_index.add(song, song.name, song.artist)
		self
	end
	def delete_first
		@songs.shift
	end
	def delete_last
		@songs.pop
	end
	def [](index)
		@songs[index]
	end
	def size
		@songs.size
	end
	
	def lookup(word)
		@word_index.lookup(word)
	end
end

class SongList
	def with_title(title)
		@songs.find{|song| title == song.name}
	end
end

class SongList
	def self.load(fileName)
		list = SongList.new
		File.open(fileName) do |song_file|
			song_file.each do |line|
				file, duration, name, title = line.chomp.split(/\s*\|\s*/)
				list.add(Song.new(title.strip, name.strip, duration.strip))
			end
		end
		list
	end
end

class Volumn
	include Comparable
	attr :volumn
	
	def initialize(volumn)
		@volumn = volumn
	end
	def to_s
		@volumn
	end
	def <=>(other)
		self.volumn <=> other.volumn
	end
	def succ
		raise(IndexError, "Volumn too big") if @volumn >= 9
		Volumn.new(@volumn.succ)
	end
end

require 'test/unit'

class SongListTestCases < Test::Unit::TestCase
	def test_delete
		list = SongList.new
		song1 = Song.new("My Love 1", "s.shin", "2:45")
		song2 = Song.new("My Love 2", "s.shin", "2:45")
		song3 = Song.new("My Love 3", "s.shin", "2:45")
		song4 = Song.new("My Love 4", "s.shin", "2:45")
		list.add(song1).add(song2).add(song3).add(song4)
		
		assert_equal(song1, list[0])
		assert_equal(song4, list[3])
		assert_nil(list[4])
		
		assert_equal(song1, list.with_title("My Love 1"))
		assert_equal(song4, list.with_title("My Love 4"))
		
		assert_equal(song1, list.delete_first)
		assert_equal(song2, list.delete_first)
		assert_equal(song4, list.delete_last)
		assert_equal(song3, list.delete_last)
		assert_nil(list.delete_first)
		assert_nil(list.delete_last)
	end
	def test_loadfile
		list = SongList.load("songlist.txt");

		assert_equal(3, list.size)
		assert_equal("My Love", list[0].name)
		assert_equal("Pretty Girl", list[1].name)
		assert_equal("Love Love Love", list[2].name)
		
		result = list.lookup("Love")
		assert_equal(2, result.size)
		assert_equal("My Love", result[0].name)
		assert_equal("Love Love Love", result[1].name)
		
	end
	
	def test_volumn
		volumns = Volumn.new(3)..Volumn.new(5)
		assert_equal(false, volumns.include?(Volumn.new(7)));
		
	end
end


def show_regexp(a, re)
	if a =~ re
		"#{$~} ---> #{$`}<<#{$&}>>#{$'}"
	else
		"No match"
	end
end

p show_regexp("Fats Waller", /ll/)
p show_regexp("Fats Waller", /l/)




