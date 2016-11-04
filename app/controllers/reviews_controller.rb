class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  def show
    @review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = current_user.reviews.new
  end

  # GET /reviews/1/edit
  def edit
    @review = current_user.reviews.find(params[:id])
  end

  # POST /reviews
  def create
  @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
      @review = current_user.reviews.find(params[:id])
      if @review.update(review_params)
       redirect_to @review, notice: 'Review was successfully updated.'
      else
      render :edit 
    end
  end

  # DELETE /reviews/1
  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
      redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :content)
    end
end
