class ApisController < InheritedResources::Base

  include ActionController::HttpAuthentication::Basic::ControllerMethods 
        http_basic_authenticate_with name: "hello", password: "world", except: :index
        before_action :set_tweet, only: [:show, :update, :destroy]
        skip_before_action :verify_authenticity_token

        respond_to :json

        def index
            @tweet = Tweet.last(50).map do |t|
                {
                    id: t.id,
                    content: t.content,
                    user_id: t.user_id,
                    like_count: t.likes.count,
                    retweets_count: t.origin_tweet
                }
            end
            render json: @tweet
        end

        def show
            respond_with Tweet.find(params[:id])
        end

        def create
            @tweet = Tweet.new(tweet_params)
            
            if @tweet.save
              render json: @tweet
            else
              render json: @tweet.errors
            end
        end

        def update
            respond_with Tweet.update(params[:id], params[:tweet])
        end

        def destroy
            respond_with Tweet.destroy(params[:id])
        end

        def between_dates
            @tweets = Tweet.where(created_at:(params[:fecha1].to_date)..(params[:fecha2].to_date))
            render json: @tweets
        end

        private

        def set_post
            @tweet = Tweet.find(params[:id])
        end

        def tweet_params
            params.require(:tweet).permit(:content, :user_id)
        end

  # private

  #   def api_params
  #     params.require(:api).permit()
  #   end

end
