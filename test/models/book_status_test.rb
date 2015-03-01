require 'test_helper'

class BookStatusTest < ActiveSupport::TestCase
  test 'complete books pending' do
    user = create(:user)
    completed_book = create(:book, :completed, user: user)
    pending_book = create(:book, user: user)

    BookStatus.update(user, [pending_book.id])

    refute completed_book.reload.completed_at?
    assert pending_book.reload.completed_at?
  end
end
