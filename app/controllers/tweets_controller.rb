class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
    if params[:sort]
      @tweets = Tweet.order(params[:sort])

#   Tweet.order(:created_at)
#   Tweet.all.order. _____
  end
end

  def show

  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      flash[:success] = "Tweet succesfully created"
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @tweet.update_attributes(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

   def destroy
     @tweet.destroy
     redirect_to tweets_path
   end

  def sort
   @tweets.sort_by &:created_at
  end



  private
  def tweet_params
    params.require(:tweet).permit(:handle, :content)
  end

  def set_tweet
      @tweet = Tweet.find(params[:id])
  end
end
