messages = %w[おはよう こんにちは こんばんは]
messages.each do |message|
  Message.create!(content: message)
end
puts '初期データの保存に成功しました!'
