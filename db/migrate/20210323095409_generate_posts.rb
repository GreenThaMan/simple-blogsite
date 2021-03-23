class GeneratePosts < ActiveRecord::Migration[6.1]
  def change
    i = 1
    while i <= 1000 do
      body = ""
      author = RandomWord.adjs.next + " " + RandomWord.nouns.next
      title = RandomWord.adjs.next + " " + RandomWord.nouns.next + " " + RandomWord.phrases.next
      while body.length < 1000
        body += RandomWord.adjs.next + " " + RandomWord.nouns.next + " " + RandomWord.phrases.next + " "
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
      while j < comment_count do
        c_author = RandomWord.nouns.next
        c_comment = RandomWord.adjs.next + " " + RandomWord.nouns.next + " " + RandomWord.phrases.next
        comment = Comment.new(
          author: c_author,
          body: c_comment,
          post: post.id
        )
        comment.save
        j+=1
      end
      i+=1
    end
  end
end
