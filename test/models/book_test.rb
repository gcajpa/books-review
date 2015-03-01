require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "name must be present" do
    book = Book.create(title: nil)
    assert book.errors[:title].any?
  end
  test "user must be present" do
    book = Book.create(user: nil)
    assert book.errors[:user].any?
  end
  test "status completed" do
    book = Book.new(completed_at: Time.current)
    assert book.completed_at?
    assert_equal 'completed', book.status
  end
  test "status pending" do
    book = Book.new(completed_at: nil)
    refute book.completed_at?
    assert_equal 'pending', book.status
  end
end
