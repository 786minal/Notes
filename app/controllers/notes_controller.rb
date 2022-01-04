class NotesController < ApplicationController
   # After_action :show_message, only: [:create, :edit, :update, :destroy]
   def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to @note
    else
      render :new, status: :unprocessable_entity
    end
  end  
  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.find(params[:id])

    if @note.update(note_params)
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy

    redirect_to root_path
  end
  private
    def note_params
      params.require(:note).permit(:user_id,  :title, :description)
    end
    # def show_message
    #   @article = Article.find(params[:id])
    # end
end


