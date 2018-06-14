class PostController < ApplicationController
    before_action :authenticate_user!

    def new
        @post = Post.new
    end

    def show 
        @post = Post.find(params[:id])
    end
    
    def create
        @post = Post.new(post_attributes.merge(user_id: current_user.id))

        if @post.save!
            redirect_to root_path
        else
          render :new
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_attributes)
            redirect_to root_path
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])

        if @post.destroy
            redirect_to root_path
        end
    end

    private

    def post_attributes
        params.require(:post).permit(:image, :title, :body)
    end
end
