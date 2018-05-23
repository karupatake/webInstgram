class CommentsController < ApplicationController
  def index
  end
  def new
    @comment=Comment.new
    @topic=Topic.find(params[:topic_id])
  end

  def create
    comment=Comment.new
    comment.user_id=current_user.id
    comment.topic_id=params[:topic_id]
    @topic=Topic.find(params[:topic_id])
    if comment.save
      redirect_to controller: 'topics',action: 'show', id:@topic.id, notice: 'コメントを登録しました'
    else
      render action:new, notice: 'コメント登録に失敗しました'
    end
  end
end
