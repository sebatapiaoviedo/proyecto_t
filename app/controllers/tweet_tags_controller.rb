class TweetTagsController < ApplicationController
  before_action :set_tweet_tag, only: %i[ show edit update destroy ]

  # GET /tweet_tags or /tweet_tags.json
  def index
    @tweet_tags = TweetTag.all
  end

  # GET /tweet_tags/1 or /tweet_tags/1.json
  def show
  end

  # GET /tweet_tags/new
  def new
    @tweet_tag = TweetTag.new
  end

  # GET /tweet_tags/1/edit
  def edit
  end

  # POST /tweet_tags or /tweet_tags.json
  def create
    @tweet_tag = TweetTag.new(tweet_tag_params)

    respond_to do |format|
      if @tweet_tag.save
        format.html { redirect_to @tweet_tag, notice: "Tweet tag was successfully created." }
        format.json { render :show, status: :created, location: @tweet_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweet_tags/1 or /tweet_tags/1.json
  def update
    respond_to do |format|
      if @tweet_tag.update(tweet_tag_params)
        format.html { redirect_to @tweet_tag, notice: "Tweet tag was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweet_tags/1 or /tweet_tags/1.json
  def destroy
    @tweet_tag.destroy
    respond_to do |format|
      format.html { redirect_to tweet_tags_url, notice: "Tweet tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet_tag
      @tweet_tag = TweetTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_tag_params
      params.require(:tweet_tag).permit(:tweet_id, :tag_id)
    end
end
