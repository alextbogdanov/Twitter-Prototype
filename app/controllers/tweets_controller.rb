class TweetsController < ApplicationController
    before_action :find_tweet, only: [:show, :edit, :update]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @tweets = Tweet.all.order("created_at DESC")
    end

    def new
        @tweet = current_user.tweets.build
        # if devise not installed use:
        # Tweet.new
    end

    def create
        @tweet = current_user.tweets.build
        # if devise not installed use:
        # Tweet.new(tweet_params)
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
