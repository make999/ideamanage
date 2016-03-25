class ChallengesController < ApplicationController
  before_action :find_challenge, only: [:show, :edit, :update, :destroy]

  def index
    @challenge = Challenge.all.order("created_at DESC")

  end

  def show
  end

  def create
    @challenge = Challenge.new(challenge_params)

    if @challenge.save
      redirect_to @challenge, notice: "Successfully created a new challenge"
    else
      render 'new'
    end
  end

  def new
    @challenge = Challenge.new
  end

  def edit
  end

  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge
    else
      render 'edit'
    end

  end

  def destroy
    @challenge.destroy
    redirect_to root_path, notice: "Successfully deleted challenge"
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :description, :begin_period, :end_period, :image)
  end

  def find_challenge

    @challenge = Challenge.find(params[:id])
  end
end
