class PhotosController < ApplicationController
  def new_form
    render("new_form.html.erb")
  end

  def show
    id_number = params["the_id_number"]
    @photo = Photo.find(id_number)
    @the_caption = @photo.caption
    @the_image_url = @photo.source
    @created_at = @photo.created_at
    render("show_html.erb")
  end

  def index
    @all_photos = Photo.order({ :created_at => :desc })
    render("index.html.erb")
  end

  def create_row
    # render("create_row.html.erb")
    p = Photo.new
    p.source = params["the_image_url"]
    p.caption = params["the_caption"]
    p.save

    redirect_to("/photos")
  end

  def edit_form
    @photo = Photo.find(params[:the_id])

    render("photos/edit_form.html.erb")
  end

  def update_row
    p = Photo.find(params[:the_id])
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save

    redirect_to("/photos")
  end

  def destroy
    p = Photo.find(params[:id])
    p.destroy

    redirect_to("/photos")
  end
end
