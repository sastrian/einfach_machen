class CommentsController < ApplicationController
  
  before_action :authenticate_user!, only: [:create]  
  
    # POST /comments
  # POST /comments.json
  def create        
    @comment = Comment.new(comment_params)
     respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.commentable, notice: 'Kommentar hinzugefügt.' }
        format.json { render :show, status: :created, location: @comment.commentable }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /comments
  # POST /comments.json
  def update    
     respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.commentable, notice: 'Kommentar hinzugefügt.' }
        format.json { render :show, status: :created, location: @comment.commentable }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:title, :comment, :user_id, :commentable_id, :commentable_type, :role)    
  end

end

