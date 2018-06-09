class TweetsController < ApplicationController
    before_action :find_tweet, only: [:show, :edit, :update]
    def index
        @tweets = Tweet.all.order("created_at DESC")
    end

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            redirect_to @tweet
        else
            render 'new'
        end
    end

    def show

    end

    def edit

    end

    def update
        if @tweet.update(tweet_params)
            redirect_to @tweet
        else
            render 'edit'
        end
    end

    def destroy
        @tweet.destroy
        redirect_to root_path
    end

    private

    def find_tweet
        @tweet = Tweet.find(params[:id])
    end

    def tweet_params
        params.require(:tweet).permit(:message)
    end
end
