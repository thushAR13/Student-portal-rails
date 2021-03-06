class ForumsController < ApplicationController
  before_action :set_forum, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]

  # GET /forums or /forums.json
  def index
    @forums = Forum.all
  end

  # GET /forums/1 or /forums/1.json
  def show; end

  # GET /forums/new
  def new
    # @forum = Forum.new
    @forum = current_user.forums.build
  end

  # GET /forums/1/edit
  def edit; end

  # POST /forums or /forums.json
  def create
    # @forum = Forum.new(forum_params)
    @forum = current_user.forums.build(forum_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to forum_url(@forum), notice: 'Forum was successfully created.' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1 or /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to forum_url(@forum), notice: 'Forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1 or /forums/1.json
  def destroy
    @forum.destroy

    respond_to do |format|
      format.html { redirect_to forums_url, notice: 'Forum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @forum = current_user.forums.find_by(id: params[:id])
    # render json: @forum
    redirect_to root_path, notice: 'Not Authorised' if @forum.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_forum
    @forum = Forum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def forum_params
    params.require(:forum).permit(:author_id, :title, :content, :user_id)
  end
end
