class BooksController < ApplicationController

  before_action :require_user_logged, except: %w[index]
  before_action :find_book, except: %w[index create batch_update]

  def index
    @user = current_user
    unless @user
      @user = User.find(params[:user_id])
    end
    @books = @user.books.completeness

    if current_user
      @book = current_user.books.new
    end
  end
  def create
      @book = current_user.books.new(book_params)
      if @book.save
        redirect_to books_path, notice: t('flash.book.create.notice')
      else
        redirect_to books_path, alert: t('flash.book.create.alert')
      end
  end
  def edit
  end
  def update
    if @book.update(book_params)
      redirect_to books_path, notice: t('flash.book.update.notice')
    else
      render 'edit'
    end
  end
  def remove
  end
  def destroy
    @book.delete
    redirect_to books_path, notice: t('flash.book.delete.notice')
  end
  def batch_update
    BookStatus.update(current_user, params[:book_ids])
    redirect_to books_path, notice: t('flash.book.batch_update.notice')
  end

  private

  def book_params
    params
    .require(:book)
    .permit(
      :title,
      :review,
      :completed_at,
      :user
    )
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
