require "sinatra/base"
require 'sinatra/flash'
require_relative "./lib/bookmark"
require_relative "./lib/comment"
require_relative "./lib/tag"
require_relative "./lib/bookmark_tag"
require_relative "./database_connection_setup.rb"

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get "/" do
    "Bookmark Manager"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get "/bookmarks/new" do
    erb :"/bookmarks/new"
  end

  post "/bookmarks" do
    flash[:notice] = "Please submit a valid URL" unless Bookmark.create(title: params[:title], url: params[:url])
    redirect "/bookmarks"
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(id: params[:id])
    redirect "/bookmarks"
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"/bookmarks/edit"
  end

  patch "/bookmarks/:id" do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect "/bookmarks"
  end

  get "/bookmarks/:id/comments/new" do
    @bookmark_id = params[:id]
    erb :"comments/new"
  end

  post "/bookmarks/:id/comments" do
    Comment.create(bookmark_id: params[:id], text: params[:comment])
    redirect "/bookmarks"
  end

  get "/bookmarks/:id/tags/new" do
    @bookmark_id = params[:id]
    erb :"tags/new"
  end

  post "/bookmarks/:id/tags" do
    tag = Tag.create(content: params[:tag])
    BookmarkTag.create(tag_id: tag.id, bookmark_id: params[:id])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
