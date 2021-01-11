class Hitblow

  def first_message
    puts <<~TEXT

            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

                   数当てゲームSTART!!!

            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    TEXT
  end

  def generate_answer
    @answer = [*"0".."9"].sample(3)
  end

  def input
    print "3桁の数字を入力してください : "
    num = gets.chomp
    input_array = num.chars

    if input_array.empty?
      puts "数字を入力してください。"
      puts ""
      input
    elsif input_array.size != 3
      puts "3桁ではありません。"
      puts ""
      input
    elsif (input_array.size - input_array.uniq.size) > 0
      puts "同じ数字が入力されています。"
      puts ""
      input
    else
      check_hit_blow(input_array)
    end

  end

  def check_hit_blow(input_array)
    hit = 0
    blow = 0
    
    input_array.each_with_index do |num, i|
      if num == @answer[i]
        hit += 1
      elsif @answer.include?(num)
        blow += 1
      end
    end

    puts "hit:#{hit} - blow:#{blow}"
    puts ""

    if hit == 3
      puts "おめでとうございます！正解です！"
    else
      input
    end
  end

end

hitblow = Hitblow.new
hitblow.first_message
hitblow.generate_answer
hitblow.input