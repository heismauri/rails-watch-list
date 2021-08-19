class RemovePosterUrlFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :poster_url, :string
  end
end
