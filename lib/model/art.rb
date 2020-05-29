class Art
  def write_art(file_name)
    File.readlines(file_name) do |line|
      puts line
    end
  end

  def castle1
    write_art('./lib/model/art_files/castle1.txt')
  end

  def castle2
    write_art('./lib/model/art_files/castle2.txt')
  end

  def castle3
    write_art('./lib/model/art_files/castle3.txt')
  end

  def royalty
    write_art('./lib/model/art_files/royalty.txt')
  end

  def royalty2
    write_art('./lib/model/art_files/royalty2.txt')
  end

  def fighting1
    write_art('./lib/model/art_files/fighting1.txt')
  end

  def fighting2
    write_art('./lib/model/art_files/fighting2.txt')
  end
end
