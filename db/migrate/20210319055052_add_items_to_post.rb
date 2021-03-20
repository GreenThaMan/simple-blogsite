class AddItemsToPost < ActiveRecord::Migration[6.1]
  def change
    post = Post.new(
      title:"How To Use Enums in Rails 6",
      body:"In Ruby on Rails, an enum is an attribute where the values map to integers in the database and can be queried by name.
      For example, we could define an enum for the status attribute, where the possible values are pending, active, or archived.
      Ruby on Rails added support for enums in Rails 4.1.
      Basic Usage of Enums in Rails
      Adding an enum to an existing model is as simple as adding an integer column to that table. You can generate a new migration by using the following bash command:
      $ bundle exec rails g migration AddStatusToUsers status:integers
      This will generate the following migration:
      class AddStatusToUsers < ActiveRecord::Migration[6.0]
        def change
          add_column :users, :status, :integer, default: 0
        end
      end
      Run the migration using bundle exec rails db:migrate.
      If you are wondering what’s up with the Schema Information comments at the top of the model file, it’s the annotate gem. Take a look at this article on how to integrate annotate with your Rails application.
      You can now use all the provided enum helpers. Let’s take a look at some of them.",
      author:"Catalin Ionescu",
      views:0,
      comments:0
    )
    post.save
  end
end
