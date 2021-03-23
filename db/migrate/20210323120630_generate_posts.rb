require 'random_word_generator'

class GeneratePosts < ActiveRecord::Migration[6.1]
  def change
    require 'random_word_generator'
    i = 1
    puts "Starting random word generator"
    while (i <= 1000)
      puts i
      generate_posts
      i+=1
    end
  end

  def generate_posts
    body = ""
    author = "#{RandomWordGenerator.word.capitalize()} #{RandomWordGenerator.word.capitalize()}"
    title = "#{RandomWordGenerator.word.capitalize()} #{RandomWordGenerator.word} #{RandomWordGenerator.word}"
    while (body.length < 1000) 
      body += "#{RandomWordGenerator.word} "
    end
    comment_count = rand(1..5)
    post = Post.new(
      author: author,
      title: title,
      body: body,
      views: 0,
      comments: comment_count
    )
    post.save
    j = 0
    while (j < comment_count)
      c_author = "#{RandomWordGenerator.word.capitalize()}"
      c_length = rand(2..10)
      c_comment = ""
      jj = 0
      while jj < c_length
        c_comment += "#{RandomWordGenerator.word}"
        jj+=1
      end
      comment = Comment.new(
        author: c_author,
        body: c_comment,
        post: post
      )
      comment.save
      j+=1
    end
  end
end
